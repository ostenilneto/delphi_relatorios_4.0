unit VeicFaturados;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.DBCtrls,
  Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  DateUtils, Datasnap.DBClient, Math, ExcelXP, ComObj;

type
  TFrmVeicFaturados = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    BtnPesquisar: TBitBtn;
    BtnExportar: TBitBtn;
    BtnSair: TBitBtn;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    BtnLimpar: TBitBtn;
    Panel2: TPanel;
    Label5: TLabel;
    GridResult: TDBGrid;
    Panel4: TPanel;
    Label3: TLabel;
    GridMensal: TDBGrid;
    ComboBox1: TComboBox;
    DBLookupComboBox1: TDBLookupComboBox;
    Label4: TLabel;
    Label6: TLabel;
    procedure FormShow(Sender: TObject);
    procedure BtnLimparClick(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure BtnPesquisarClick(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure DimensionarGrid(dbg: TDBGrid);
    procedure BtnExportarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmVeicFaturados: TFrmVeicFaturados;

implementation

{$R *.dfm}

uses DmRel;

procedure TFrmVeicFaturados.BtnExportarClick(Sender: TObject);
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
     planilha.caption:= 'Exporta��o de dados para o excel';
     planilha.visible:= true;

      //Mensal
      QryVFatur_mes.First;
      for linha:= 0 to QryVFatur_mes.RecordCount-1 do
      begin
        for coluna:= 1 to QryVFatur_mes.FieldCount do
         begin
           valorCampo:= QryVFatur_mes.Fields[coluna-1].AsString;
           planilha.cells[linha+2,coluna]:= valorCampo;
         end;

        QryVFatur_mes.Next;

      end;
      for coluna:=1 to QryVFatur_mes.FieldCount do
      begin
        valorCampo:= QryVFatur_mes.Fields[coluna-1].DisplayLabel;
        planilha.cells[1,coluna]:= valorCampo;
      end;
      planilha.columns.AutoFit;


       //VENDAS FILTRO
       planilha.Sheets.Add;
       planilha.Cells.Select;
       planilha.Selection.NumberFormat := '@';
       planilha.WorkSheets[2].DisplayPageBreaks:=False;
       QryVFatur.First;
       for linha:= 0 to QryVFatur.RecordCount-1 do
       begin
         for coluna:= 1 to QryVFatur.FieldCount do
          begin
             valorCampo:= QryVFatur.Fields[coluna-1].AsString;
             planilha.cells[linha+2,coluna]:= valorCampo;
          end;

         QryVFatur.Next;

       end;
       for coluna:=1 to QryVFatur.FieldCount do
       begin
          valorCampo:= QryVFatur.Fields[coluna-1].DisplayLabel;
          planilha.cells[1,coluna]:= valorCampo;
       end;

      End;
    planilha.columns.AutoFit;
    planilha.WorkSheets[1].Name:='Vendas Vendedor';
     planilha.WorkSheets[2].Name:='Vendas Geral Departamento';
    Screen.Cursor := crDefault;
end;

procedure TFrmVeicFaturados.BtnLimparClick(Sender: TObject);
begin
  Screen.Cursor := crHourglass;
  with DataModule1 do
  Begin
        QryVFatur_mes.Close;
        QryVFatur.Close;
  End;
  Screen.Cursor := crDefault;
end;

procedure TFrmVeicFaturados.BtnPesquisarClick(Sender: TObject);
begin
  Screen.Cursor := crHourglass;
  with DataModule1 do
      Begin
        QryVFatur_mes.Close;
        QryVFatur.Close;
        if ComboBox1.ItemIndex = 0 then
        begin
          QryVFatur_mes.ParamByName('departamento').Value := 100;
          QryVFatur_mes.ParamByName('departamento2').Value := 110;
          QryVFatur.ParamByName('departamento').Value := 100;
          QryVFatur.ParamByName('departamento2').Value := 110;
        end
        else
        begin
          QryVFatur_mes.ParamByName('departamento').Value := 200;
          QryVFatur_mes.ParamByName('departamento2').Value := 210;
          QryVFatur.ParamByName('departamento').Value := 200;
          QryVFatur.ParamByName('departamento2').Value := 210;
        end;

        QryVFatur_mes.ParamByName('inicio').Value := DatetoStr(DateTimePicker1.Date);
        QryVFatur_mes.ParamByName('fim').Value := DatetoStr(DateTimePicker2.DateTime);
        QryVFatur.ParamByName('vendedor').Value := DBLookupComboBox1.KeyValue;
        QryVFatur.ParamByName('inicio').Value := DatetoStr(DateTimePicker1.Date);
        QryVFatur.ParamByName('fim').Value := DatetoStr(DateTimePicker2.DateTime);
        QryVFatur_mes.Open;
        QryVFatur.Open;
        DimensionarGrid( GridResult );
        DimensionarGrid( GridMensal );
      End;
    Screen.Cursor := crDefault;
end;

procedure TFrmVeicFaturados.BtnSairClick(Sender: TObject);
begin
      with DataModule1 do
      Begin
            QryVFatur_mes.Close;
            QryVFatur.Close;
            QryCad_Vendedor.Close;
            FrmVeicFaturados.Close;
      End;
end;

procedure TFrmVeicFaturados.ComboBox1Change(Sender: TObject);
begin
  Screen.Cursor := crHourglass;
    with DataModule1 do
      Begin
        QryVFatur_mes.Close;
        QryVFatur.Close;
        QryCad_Vendedor.Close;
        if ComboBox1.ItemIndex = 0 then
        begin
          QryVFatur_mes.ParamByName('departamento').Value := 100;
          QryVFatur_mes.ParamByName('departamento2').Value := 110;
          QryVFatur.ParamByName('departamento').Value := 100;
          QryVFatur.ParamByName('departamento2').Value := 110;
          QryCad_Vendedor.ParamByName('cargo').Value := 6;
          QryCad_Vendedor.Open;
          DBLookupComboBox1.KeyValue:= 607;
          QryVFatur_mes.Open;
          DimensionarGrid( GridMensal );
        end
        else
        begin
          QryVFatur_mes.ParamByName('departamento').Value := 200;
          QryVFatur_mes.ParamByName('departamento2').Value := 210;
          QryVFatur.ParamByName('departamento').Value := 200;
          QryVFatur.ParamByName('departamento2').Value := 210;
          QryCad_Vendedor.ParamByName('cargo').Value := 7;
          QryCad_Vendedor.Open;
          DBLookupComboBox1.KeyValue:= 521;
          QryVFatur_mes.Open;
          DimensionarGrid( GridMensal );
        end;
      End;
    Screen.Cursor := crDefault;
end;

procedure TFrmVeicFaturados.FormShow(Sender: TObject);
begin
  datetimepicker1.date:= StartOfTheMonth(now);
  datetimepicker2.DateTime:= now;

  with DataModule1.QryCad_Vendedor do
  Begin
     Close;
     ParamByName('cargo').Value := 6;
     Open;
  End;

  with DataModule1.QryVFatur_mes do
  Begin
    Close;
    ParamByName('inicio').Value := DatetoStr(DateTimePicker1.Date);
    ParamByName('fim').Value := DatetoStr(DateTimePicker2.Date);
    ParamByName('departamento').Value := 100;
    ParamByName('departamento2').Value := 110;

    Open;
  End;

  DimensionarGrid( GridMensal );

  ComboBox1.ItemIndex := 0;
  DBLookupComboBox1.KeyValue:= 607;

end;

procedure TFrmVeicFaturados.DimensionarGrid(dbg: TDBGrid);
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

  // Evitar atualiza��es visuais durante o redimensionamento
  LockWindowUpdate(dbg.Handle);
  try
    // Loop para calcular as larguras das colunas com base nos t�tulos e nos dados
    for idx := 0 to dbg.Columns.Count - 1 do
    begin
      NomeColuna := dbg.Columns[idx].Title.Caption;

      // Ajustar a largura baseada no t�tulo e nos dados da coluna
      dbg.Columns[idx].Width := Max(
        dbg.Canvas.TextWidth(dbg.Columns[idx].Title.Caption + 'A'), // Cabe�alho
        dbg.Canvas.TextWidth(dbg.Columns[idx].Field.AsString + ' ') // Conte�do
      );

      // Armazenar a largura da coluna
      AWidth[idx] := dbg.Columns[idx].Width;
      Twidth := Twidth + AWidth[idx];

      // Tamanho relativo da coluna baseado no tamanho do campo ou padr�o 1
      if Assigned(dbg.Columns[idx].Field) then
        Asize[idx] := dbg.Columns[idx].Field.Size
      else
        Asize[idx] := 1;

      TSize := TSize + Asize[idx];
    end;

    // Adicionar largura das linhas de colunas, se aplic�vel
    if dgColLines in dbg.Options then
      Twidth := Twidth + dbg.Columns.Count;

    // Adicionar a largura do indicador, se aplic�vel
    if dgIndicator in dbg.Options then
      Twidth := Twidth + IndicatorWidth;

    // Determinar o espa�o dispon�vel para ajustar as colunas
    Swidth := dbg.ClientWidth - Twidth;

    // Ajustar as colunas proporcionalmente ao espa�o dispon�vel
    AjustarColumns(Swidth, TSize, Asize);
  finally
    // Liberar o bloqueio da janela para permitir atualiza��es visuais
    LockWindowUpdate(0);
  end;
end;

end.
