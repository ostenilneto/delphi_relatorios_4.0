unit VeicVendPerdidas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.DBCtrls, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.Buttons, DateUtils, Vcl.ExtCtrls,
  Datasnap.DBClient, Math, ExcelXP, ComObj;

type
  TFrmVeicVendPerdidas = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    BtnPesquisar: TBitBtn;
    BtnExportar: TBitBtn;
    BtnSair: TBitBtn;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    BtnLimpar: TBitBtn;
    ComboBox1: TComboBox;
    Panel2: TPanel;
    Label5: TLabel;
    GridResult: TDBGrid;
    Panel4: TPanel;
    Label3: TLabel;
    GridMensal: TDBGrid;
    DBLookupComboBox1: TDBLookupComboBox;
    procedure BtnPesquisarClick(Sender: TObject);
    procedure BtnLimparClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DimensionarGrid(dbg: TDBGrid);
    procedure ComboBox1Change(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure BtnExportarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmVeicVendPerdidas: TFrmVeicVendPerdidas;

implementation

{$R *.dfm}

uses DmRel;

procedure TFrmVeicVendPerdidas.BtnExportarClick(Sender: TObject);
Var
linha, coluna: integer;
planilha: variant;
valorCampo: string;
begin
  Screen.Cursor := crHourglass;
  with DataModule1 do
    Begin
     planilha:= CreateOleObject('Excel.Application');
     planilha.Workbooks.add;
     planilha.WorkSheets[1].DisplayPageBreaks:=False;
     planilha.Cells.Select;
     planilha.Selection.NumberFormat := '@';
     planilha.caption:= 'Exportação de dados para o excel';
     planilha.visible:= true;
      //Mensal
      if ComboBox1.ItemIndex = 0 then   //NOVOS
      begin
        QryVVendPerd_mes_nov.First;
        for linha:= 0 to QryVVendPerd_mes_nov.RecordCount-1 do
        begin
          for coluna:= 1 to QryVVendPerd_mes_nov.FieldCount do
           begin
             valorCampo:= QryVVendPerd_mes_nov.Fields[coluna-1].AsString;
             planilha.cells[linha+2,coluna]:= valorCampo;
           end;

          QryVVendPerd_mes_nov.Next;

        end;
          for coluna:=1 to QryVVendPerd_mes_nov.FieldCount do
          begin
            valorCampo:= QryVVendPerd_mes_nov.Fields[coluna-1].DisplayLabel;
            planilha.cells[1,coluna]:= valorCampo;
          end;
        planilha.columns.AutoFit;
      end
      else   // Usados
      begin
        QryVVendPerd_mes_usa.First;
        for linha:= 0 to QryVVendPerd_mes_usa.RecordCount-1 do
        begin
         for coluna:= 1 to QryVVendPerd_mes_usa.FieldCount do
           begin
             valorCampo:= QryVVendPerd_mes_usa.Fields[coluna-1].AsString;
             planilha.cells[linha+2,coluna]:= valorCampo;
          end;

         QryVVendPerd_mes_usa.Next;

        end;
        for coluna:=1 to QryVVendPerd_mes_usa.FieldCount do
        begin
          valorCampo:= QryVVendPerd_mes_usa.Fields[coluna-1].DisplayLabel;
          planilha.cells[1,coluna]:= valorCampo;
        end;
         planilha.columns.AutoFit;
      end;

       //VENDASPERDIDAS FILTRO
       planilha.Sheets.Add;
       planilha.Cells.Select;
       planilha.Selection.NumberFormat := '@';
       planilha.WorkSheets[2].DisplayPageBreaks:=False;
       QryVVendPerd.First;
       for linha:= 0 to QryVVendPerd.RecordCount-1 do
       begin
         for coluna:= 1 to QryVVendPerd.FieldCount do
          begin
             valorCampo:= QryVVendPerd.Fields[coluna-1].AsString;
             planilha.cells[linha+2,coluna]:= valorCampo;
          end;

         QryVVendPerd.Next;

       end;
       for coluna:=1 to QryVVendPerd.FieldCount do
       begin
          valorCampo:= QryVVendPerd.Fields[coluna-1].DisplayLabel;
          planilha.cells[1,coluna]:= valorCampo;
       end;

      End;
      planilha.columns.AutoFit;
      planilha.WorkSheets[1].Name:='Vendas Perdidas Vendedor';
      planilha.WorkSheets[2].Name:='Vendas Perdidas Geral';
  Screen.Cursor := crDefault;
end;

procedure TFrmVeicVendPerdidas.BtnLimparClick(Sender: TObject);
begin
  Screen.Cursor := crHourglass;
  with DataModule1 do
  Begin
        QryVVendPerd_mes_nov.Close;
        QryVVendPerd_mes_usa.Close;
        QryVVendPerd.Close;
  End;
  Screen.Cursor := crDefault;
end;

procedure TFrmVeicVendPerdidas.BtnPesquisarClick(Sender: TObject);
begin
  Screen.Cursor := crHourglass;
  with DataModule1 do
    Begin
      QryVVendPerd_mes_nov.Close;
      QryVVendPerd_mes_usa.Close;
      QryVVendPerd.Close;
      QryVVendPerd.ParamByName('vendedor').Value := DBLookupComboBox1.KeyValue;
      QryVVendPerd.ParamByName('inicio').Value := DatetoStr(DateTimePicker1.Date);
      QryVVendPerd.ParamByName('fim').Value := DatetoStr(DateTimePicker2.DateTime);
      QryVVendPerd.Open;

      if ComboBox1.ItemIndex = 0 then
        begin
          QryVVendPerd_mes_nov.ParamByName('inicio').Value := DatetoStr(DateTimePicker1.Date);
          QryVVendPerd_mes_nov.ParamByName('fim').Value := DatetoStr(DateTimePicker2.Date);
          QryVVendPerd_mes_nov.Open;
          DimensionarGrid( GridMensal );
        end
        else
        begin
          QryVVendPerd_mes_usa.ParamByName('inicio').Value := DatetoStr(DateTimePicker1.Date);
          QryVVendPerd_mes_usa.ParamByName('fim').Value := DatetoStr(DateTimePicker2.Date);
          QryVVendPerd_mes_usa.Open;
          DimensionarGrid( GridMensal );
        end;

      DimensionarGrid( GridResult );
      DimensionarGrid( GridMensal );
    End;
    Screen.Cursor := crDefault;
end;

procedure TFrmVeicVendPerdidas.BtnSairClick(Sender: TObject);
begin
  with DataModule1 do
  Begin
        QryVVendPerd_mes_nov.Close;
        QryVVendPerd_mes_usa.Close;
        QryVVendPerd.Close;
        QryCad_Vendedor.Close;
        FrmVeicVendPerdidas.Close;
  End;
end;

procedure TFrmVeicVendPerdidas.ComboBox1Change(Sender: TObject);
begin
  Screen.Cursor := crHourglass;
  with DataModule1 do
      Begin
        QryVVendPerd_mes_nov.Close;
        QryVVendPerd_mes_usa.Close;
        QryVVendPerd.Close;
        QryCad_Vendedor.Close;
        if ComboBox1.ItemIndex = 0 then
        begin
          QryCad_Vendedor.ParamByName('cargo').Value := 6;
          QryCad_Vendedor.Open;
          DtsVVendPerd_mes.DataSet := QryVVendPerd_mes_nov;
          DBLookupComboBox1.KeyValue:= 607;
          QryVVendPerd_mes_nov.ParamByName('inicio').Value := DatetoStr(DateTimePicker1.Date);
          QryVVendPerd_mes_nov.ParamByName('fim').Value := DatetoStr(DateTimePicker2.Date);
          QryVVendPerd_mes_nov.Open;
          DimensionarGrid( GridMensal );
        end
        else
        begin
          QryCad_Vendedor.ParamByName('cargo').Value := 7;
          QryCad_Vendedor.Open;
          DtsVVendPerd_mes.DataSet := QryVVendPerd_mes_usa;
          QryVVendPerd_mes_usa.ParamByName('inicio').Value := DatetoStr(DateTimePicker1.Date);
          QryVVendPerd_mes_usa.ParamByName('fim').Value := DatetoStr(DateTimePicker2.Date);
          DBLookupComboBox1.KeyValue:= 521;
          QryVVendPerd_mes_usa.Open;
          DimensionarGrid( GridMensal );
        end;
      End;
  Screen.Cursor := crDefault;
end;

procedure TFrmVeicVendPerdidas.FormShow(Sender: TObject);
begin
  datetimepicker1.date:= StartOfTheMonth(now);
  datetimepicker2.DateTime:= now;

  with DataModule1.QryCad_Vendedor do
  Begin
     Close;
     ParamByName('cargo').Value := 6;
     Open;
  End;

  ComboBox1.ItemIndex := 0;
  DBLookupComboBox1.KeyValue := 607;

  with DataModule1.QryVVendPerd_mes_nov do
  Begin
    Close;
    ParamByName('inicio').Value := DatetoStr(DateTimePicker1.Date);
    ParamByName('fim').Value := DatetoStr(DateTimePicker2.Date);
    Open;
  End;

  DimensionarGrid( GridMensal );

end;

procedure TFrmVeicVendPerdidas.DimensionarGrid(dbg: TDBGrid);
type
  TArray = Array of Integer;

  procedure AjustarColumns(Swidth, TSize: Integer; Asize: TArray);
  var
    idx: Integer;
  begin
    if TSize = 0 then
    begin
      TSize := dbg.Columns.Count;
      for idx := 0 to dbg.Columns.Count - 1 do
        dbg.Columns[idx].Width := (dbg.Width - dbg.Canvas.TextWidth('AAAAAA')) div TSize;
    end
    else
    begin
      for idx := 0 to dbg.Columns.Count - 1 do
        dbg.Columns[idx].Width := dbg.Columns[idx].Width + (Swidth * Asize[idx] div TSize);
    end;
  end;

var
  idx, Twidth, TSize, Swidth: Integer;
  AWidth, Asize: TArray;
  NomeColuna: String;
begin
  // Certifique-se de que existam colunas no grid
  if dbg.Columns.Count = 0 then Exit;

  // Inicializar arrays para armazenar larguras e tamanhos relativos
  SetLength(AWidth, dbg.Columns.Count);
  SetLength(Asize, dbg.Columns.Count);
  Twidth := 0;
  TSize := 0;

  // Evitar atualizações visuais durante o redimensionamento
  LockWindowUpdate(dbg.Handle);
  try
    // Loop para calcular as larguras das colunas com base nos títulos e nos dados
    for idx := 0 to dbg.Columns.Count - 1 do
    begin
      NomeColuna := dbg.Columns[idx].Title.Caption;

      // Ajustar a largura baseada no título e nos dados da coluna
      dbg.Columns[idx].Width := Max(
        dbg.Canvas.TextWidth(dbg.Columns[idx].Title.Caption + 'A'), // Cabeçalho
        dbg.Canvas.TextWidth(dbg.Columns[idx].Field.AsString + ' ') // Conteúdo
      );

      // Armazenar a largura da coluna
      AWidth[idx] := dbg.Columns[idx].Width;
      Twidth := Twidth + AWidth[idx];

      // Tamanho relativo da coluna baseado no tamanho do campo ou padrão 1
      if Assigned(dbg.Columns[idx].Field) then
        Asize[idx] := dbg.Columns[idx].Field.Size
      else
        Asize[idx] := 1;

      TSize := TSize + Asize[idx];
    end;

    // Adicionar largura das linhas de colunas, se aplicável
    if dgColLines in dbg.Options then
      Twidth := Twidth + dbg.Columns.Count;

    // Adicionar a largura do indicador, se aplicável
    if dgIndicator in dbg.Options then
      Twidth := Twidth + IndicatorWidth;

    // Determinar o espaço disponível para ajustar as colunas
    Swidth := dbg.ClientWidth - Twidth;

    // Ajustar as colunas proporcionalmente ao espaço disponível
    AjustarColumns(Swidth, TSize, Asize);
  finally
    // Liberar o bloqueio da janela para permitir atualizações visuais
    LockWindowUpdate(0);
  end;
end;

end.
