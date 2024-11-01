unit Estatisticas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids, DateUtils, ComObj,
  Vcl.ComCtrls, Vcl.DBCtrls, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.Mask, Math;

type
  TFrmEstatisticas = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    BtnPesquisar: TBitBtn;
    BtnExportar: TBitBtn;
    BtnSair: TBitBtn;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    BtnLimpar: TBitBtn;
    Label3: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    Dados: TPageControl;
    Atendimentos: TTabSheet;
    Faturamento: TTabSheet;
    Estatisticas: TTabSheet;
    Panel2: TPanel;
    Panel4: TPanel;
    Panel3: TPanel;
    Label11: TLabel;
    DBGrid6: TDBGrid;
    Label4: TLabel;
    DBGrid1: TDBGrid;
    Panel5: TPanel;
    DBGrid2: TDBGrid;
    Panel6: TPanel;
    Label8: TLabel;
    DBEdit1: TDBEdit;
    Label9: TLabel;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    Label10: TLabel;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    Label5: TLabel;
    DBEdit4: TDBEdit;
    Label6: TLabel;
    DBEdit7: TDBEdit;
    Label7: TLabel;
    DBGrid3: TDBGrid;
    procedure BtnSairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnLimparClick(Sender: TObject);
    procedure BtnPesquisarClick(Sender: TObject);
    procedure DimensionarGrid(dbg: TDBGrid);
    procedure BtnExportarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmEstatisticas: TFrmEstatisticas;

implementation

{$R *.dfm}

uses DmRel;

procedure TFrmEstatisticas.BtnExportarClick(Sender: TObject);
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
      If DBLookupCombobox1.KeyValue = 100 then
      begin
        QryEstAtendimento_VN.First;
        for linha:= 0 to QryEstEstatistica_VN.RecordCount-1 do
          begin
            for coluna:= 1 to QryEstEstatistica_VN.FieldCount do
             begin
               valorCampo:= QryEstEstatistica_VN.Fields[coluna-1].AsString;
               planilha.cells[linha+2,coluna]:= valorCampo;
             end;

            QryEstEstatistica_VN.Next;

          end;
        for coluna:=1 to QryEstEstatistica_VN.FieldCount do
          begin
            valorCampo:= QryEstEstatistica_VN.Fields[coluna-1].DisplayLabel;
            planilha.cells[1,coluna]:= valorCampo;
          end;
        planilha.columns.AutoFit;

        //Aba2
        planilha.Sheets.Add;
        planilha.Cells.Select;
        planilha.Selection.NumberFormat := '@';
        planilha.WorkSheets[2].DisplayPageBreaks:=False;
        QryEstFaturamento_VN.First;
        for linha:= 0 to QryEstFaturamento_VN.RecordCount-1 do
          begin
           for coluna:= 1 to QryEstFaturamento_VN.FieldCount do
             begin
               valorCampo:= QryEstFaturamento_VN.Fields[coluna-1].AsString;
               planilha.cells[linha+2,coluna]:= valorCampo;
            end;

           QryEstFaturamento_VN.Next;

          end;
        for coluna:=1 to QryEstFaturamento_VN.FieldCount do
          begin
            valorCampo:= QryEstFaturamento_VN.Fields[coluna-1].DisplayLabel;
            planilha.cells[1,coluna]:= valorCampo;
          end;
        planilha.columns.AutoFit;

         //Aba3
         planilha.Sheets.Add;
         planilha.Cells.Select;
         planilha.Selection.NumberFormat := '@';
         planilha.WorkSheets[3].DisplayPageBreaks:=False;
         QryEstVendPerdida_VN.First;
         for linha:= 0 to QryEstVendPerdida_VN.RecordCount-1 do
         begin
           for coluna:= 1 to QryEstVendPerdida_VN.FieldCount do
            begin
               valorCampo:= QryEstVendPerdida_VN.Fields[coluna-1].AsString;
               planilha.cells[linha+2,coluna]:= valorCampo;
            end;

           QryEstVendPerdida_VN.Next;

         end;
         for coluna:=1 to QryEstVendPerdida_VN.FieldCount do
         begin
            valorCampo:= QryEstVendPerdida_VN.Fields[coluna-1].DisplayLabel;
            planilha.cells[1,coluna]:= valorCampo;
         end;

         //Aba4
         planilha.Sheets.Add;
         planilha.Cells.Select;
         planilha.Selection.NumberFormat := '@';
         planilha.WorkSheets[3].DisplayPageBreaks:=False;
         QryEstAtendimento_VN.First;
         for linha:= 0 to QryEstAtendimento_VN.RecordCount-1 do
         begin
           for coluna:= 1 to QryEstAtendimento_VN.FieldCount do
            begin
               valorCampo:= QryEstAtendimento_VN.Fields[coluna-1].AsString;
               planilha.cells[linha+2,coluna]:= valorCampo;
            end;

           QryEstAtendimento_VN.Next;

         end;
         for coluna:=1 to QryEstAtendimento_VN.FieldCount do
         begin
            valorCampo:= QryEstAtendimento_VN.Fields[coluna-1].DisplayLabel;
            planilha.cells[1,coluna]:= valorCampo;
         end;
      end
      else
      begin
        QryEstAtendimento_VU.First;
        for linha:= 0 to QryEstEstatistica_VU.RecordCount-1 do
          begin
            for coluna:= 1 to QryEstEstatistica_VU.FieldCount do
             begin
               valorCampo:= QryEstEstatistica_VU.Fields[coluna-1].AsString;
               planilha.cells[linha+2,coluna]:= valorCampo;
             end;

            QryEstEstatistica_VU.Next;

          end;
        for coluna:=1 to QryEstEstatistica_VU.FieldCount do
          begin
            valorCampo:= QryEstEstatistica_VU.Fields[coluna-1].DisplayLabel;
            planilha.cells[1,coluna]:= valorCampo;
          end;
        planilha.columns.AutoFit;

        //Aba2
        planilha.Sheets.Add;
        planilha.Cells.Select;
        planilha.Selection.NumberFormat := '@';
        planilha.WorkSheets[2].DisplayPageBreaks:=False;
        QryEstFaturamento_VU.First;
        for linha:= 0 to QryEstFaturamento_VU.RecordCount-1 do
          begin
           for coluna:= 1 to QryEstFaturamento_VU.FieldCount do
             begin
               valorCampo:= QryEstFaturamento_VU.Fields[coluna-1].AsString;
               planilha.cells[linha+2,coluna]:= valorCampo;
            end;

           QryEstFaturamento_VU.Next;

          end;
        for coluna:=1 to QryEstFaturamento_VU.FieldCount do
          begin
            valorCampo:= QryEstFaturamento_VU.Fields[coluna-1].DisplayLabel;
            planilha.cells[1,coluna]:= valorCampo;
          end;
        planilha.columns.AutoFit;

         //Aba3
         planilha.Sheets.Add;
         planilha.Cells.Select;
         planilha.Selection.NumberFormat := '@';
         planilha.WorkSheets[3].DisplayPageBreaks:=False;
         QryEstVendPerdida_VU.First;
         for linha:= 0 to QryEstVendPerdida_VU.RecordCount-1 do
         begin
           for coluna:= 1 to QryEstVendPerdida_VU.FieldCount do
            begin
               valorCampo:= QryEstVendPerdida_VU.Fields[coluna-1].AsString;
               planilha.cells[linha+2,coluna]:= valorCampo;
            end;

           QryEstVendPerdida_VU.Next;

         end;
         for coluna:=1 to QryEstVendPerdida_VU.FieldCount do
         begin
            valorCampo:= QryEstVendPerdida_VU.Fields[coluna-1].DisplayLabel;
            planilha.cells[1,coluna]:= valorCampo;
         end;

         //Aba4
         planilha.Sheets.Add;
         planilha.Cells.Select;
         planilha.Selection.NumberFormat := '@';
         planilha.WorkSheets[3].DisplayPageBreaks:=False;
         QryEstAtendimento_VU.First;
         for linha:= 0 to QryEstAtendimento_VU.RecordCount-1 do
         begin
           for coluna:= 1 to QryEstAtendimento_VU.FieldCount do
            begin
               valorCampo:= QryEstAtendimento_VU.Fields[coluna-1].AsString;
               planilha.cells[linha+2,coluna]:= valorCampo;
            end;

           QryEstAtendimento_VU.Next;

         end;
         for coluna:=1 to QryEstAtendimento_VU.FieldCount do
         begin
            valorCampo:= QryEstAtendimento_VU.Fields[coluna-1].DisplayLabel;
            planilha.cells[1,coluna]:= valorCampo;
         end;

        End;
      planilha.columns.AutoFit;
      planilha.WorkSheets[1].Name:='Atendimentos';
      planilha.WorkSheets[2].Name:='Vendas Perdidas';
      planilha.WorkSheets[3].Name:='Faturamento';
      planilha.WorkSheets[4].Name:='Estat�sticas';
    End;
  Screen.Cursor := crDefault;
end;

procedure TFrmEstatisticas.BtnLimparClick(Sender: TObject);
begin
  with DataModule1 do
  Begin
    DtsEstAtendimento.DataSet.Close;
    DtsEstVendPerdida.DataSet.Close;
    DtsEstFaturamento.DataSet.Close;
    DtsEstEstatistica.DataSet.Close;
    DtsEstTotal.DataSet.Close;
    DtsEstVendRealiz.DataSet.Close;
    DtsEstVendPerdid.DataSet.Close;
    DtsEstAtivos.DataSet.Close;
    DtsEstReceptivos.DataSet.Close;
    dbedit3.Text := '';
    dbedit6.Text := '';
  End;
end;

procedure TFrmEstatisticas.BtnPesquisarClick(Sender: TObject);
var
a, b, c, f, g:integer;
d, e: Double;
begin
  Screen.Cursor := crHourglass;
  with DataModule1 do
    Begin
      if DBLookupCombobox1.KeyValue = 100 then
      begin
        DtsEstAtendimento.DataSet := QryEstAtendimento_VN;
        with QryEstAtendimento_VN do
        Begin
          Close;
          ParamByName('inicio').Value := DatetoStr(DateTimePicker1.Date);
          ParamByName('fim').Value := DatetoStr(DateTimePicker2.Date);
          Open;
        End;
        DtsEstVendPerdida.DataSet := QryEstVendPerdida_VN;
        with QryEstVendPerdida_VN do
        Begin
          Close;
          ParamByName('inicio').Value := DatetoStr(DateTimePicker1.Date);
          ParamByName('fim').Value := DatetoStr(DateTimePicker2.Date);
          Open;
        End;
        DtsEstFaturamento.DataSet := QryEstFaturamento_VN;
        with QryEstFaturamento_VN do
        Begin
          Close;
          ParamByName('inicio').Value := DatetoStr(DateTimePicker1.Date);
          ParamByName('fim').Value := DatetoStr(DateTimePicker2.Date);
          Open;
        End;
        DtsEstEstatistica.DataSet := QryEstEstatistica_VN;
        with QryEstEstatistica_VN do
        Begin
          Close;
          ParamByName('inicio').Value := DatetoStr(DateTimePicker1.Date);
          ParamByName('fim').Value := DatetoStr(DateTimePicker2.Date);
          ParamByName('inicio1').Value := DatetoStr(DateTimePicker1.Date);
          ParamByName('fim1').Value := DatetoStr(DateTimePicker2.Date);
          ParamByName('inicio2').Value := DatetoStr(DateTimePicker1.Date);
          ParamByName('fim2').Value := DatetoStr(DateTimePicker2.Date);
          ParamByName('inicio3').Value := DatetoStr(DateTimePicker1.Date);
          ParamByName('fim3').Value := DatetoStr(DateTimePicker2.Date);
          ParamByName('inicio4').Value := DatetoStr(DateTimePicker1.Date);
          ParamByName('fim4').Value := DatetoStr(DateTimePicker2.Date);
          ParamByName('inicio5').Value := DatetoStr(DateTimePicker1.Date);
          ParamByName('fim5').Value := DatetoStr(DateTimePicker2.Date);
          ParamByName('inicio6').Value := DatetoStr(DateTimePicker1.Date);
          ParamByName('fim6').Value := DatetoStr(DateTimePicker2.Date);
          ParamByName('inicio7').Value := DatetoStr(DateTimePicker1.Date);
          ParamByName('fim7').Value := DatetoStr(DateTimePicker2.Date);
          ParamByName('inicio8').Value := DatetoStr(DateTimePicker1.Date);
          ParamByName('fim8').Value := DatetoStr(DateTimePicker2.Date);
          ParamByName('inicio9').Value := DatetoStr(DateTimePicker1.Date);
          ParamByName('fim9').Value := DatetoStr(DateTimePicker2.Date);
          ParamByName('inicio10').Value := DatetoStr(DateTimePicker1.Date);
          ParamByName('fim10').Value := DatetoStr(DateTimePicker2.Date);
          ParamByName('inicio11').Value := DatetoStr(DateTimePicker1.Date);
          ParamByName('fim11').Value := DatetoStr(DateTimePicker2.Date);
          ParamByName('inicio12').Value := DatetoStr(DateTimePicker1.Date);
          ParamByName('fim12').Value := DatetoStr(DateTimePicker2.Date);
          ParamByName('inicio13').Value := DatetoStr(DateTimePicker1.Date);
          ParamByName('fim13').Value := DatetoStr(DateTimePicker2.Date);
          ParamByName('inicio14').Value := DatetoStr(DateTimePicker1.Date);
          ParamByName('fim14').Value := DatetoStr(DateTimePicker2.Date);
          Open;
        End;
        with QryEstTotal do
        Begin
          Close;
          ParamByName('inicio').Value := DatetoStr(DateTimePicker1.Date);
          ParamByName('fim').Value := DatetoStr(DateTimePicker2.Date);
          ParamByName('departamento').Value := (100);
          ParamByName('departamento2').Value := (110);
        End;
        with QryEstVendRealiz do
        Begin
          Close;
          ParamByName('inicio').Value := DatetoStr(DateTimePicker1.Date);
          ParamByName('fim').Value := DatetoStr(DateTimePicker2.Date);
          ParamByName('departamento').Value := (100);
          ParamByName('departamento2').Value := (110);
        End;
        with QryEstVendPerdid do
        Begin
          Close;
          ParamByName('inicio').Value := DatetoStr(DateTimePicker1.Date);
          ParamByName('fim').Value := DatetoStr(DateTimePicker2.Date);
          ParamByName('departamento').Value := (100);
          ParamByName('departamento2').Value := (110);
        End;
        with QryEstAtivos do
        Begin
          Close;
          ParamByName('inicio').Value := DatetoStr(DateTimePicker1.Date);
          ParamByName('fim').Value := DatetoStr(DateTimePicker2.Date);
          ParamByName('departamento').Value := (100);
          ParamByName('departamento2').Value := (110);
        End;
        with QryEstReceptivos do
        Begin
          Close;
          ParamByName('inicio').Value := DatetoStr(DateTimePicker1.Date);
          ParamByName('fim').Value := DatetoStr(DateTimePicker2.Date);
          ParamByName('departamento').Value := (100);
          ParamByName('departamento2').Value := (110);
        End;
      end

    else
    begin
      with DataModule1 do
      Begin
        DtsEstAtendimento.DataSet := QryEstAtendimento_VU;
        with QryEstAtendimento_VU do
        Begin
          Close;
          ParamByName('inicio').Value := DatetoStr(DateTimePicker1.Date);
          ParamByName('fim').Value := DatetoStr(DateTimePicker2.Date);
          Open;
        End;
        DtsEstVendPerdida.DataSet := QryEstVendPerdida_VU;
        with QryEstVendPerdida_VU do
        Begin
          Close;
          ParamByName('inicio').Value := DatetoStr(DateTimePicker1.Date);
          ParamByName('fim').Value := DatetoStr(DateTimePicker2.Date);
          Open;
        End;
        DtsEstFaturamento.DataSet := QryEstFaturamento_VU;
        with QryEstFaturamento_VU do
        Begin
          Close;
          ParamByName('inicio').Value := DatetoStr(DateTimePicker1.Date);
          ParamByName('fim').Value := DatetoStr(DateTimePicker2.Date);
          Open;
        End;
        DtsEstEstatistica.DataSet := QryEstEstatistica_VU;
        with QryEstEstatistica_VU do
        Begin
          Close;
          ParamByName('inicio').Value := DatetoStr(DateTimePicker1.Date);
          ParamByName('fim').Value := DatetoStr(DateTimePicker2.Date);
          ParamByName('inicio1').Value := DatetoStr(DateTimePicker1.Date);
          ParamByName('fim1').Value := DatetoStr(DateTimePicker2.Date);
          ParamByName('inicio2').Value := DatetoStr(DateTimePicker1.Date);
          ParamByName('fim2').Value := DatetoStr(DateTimePicker2.Date);
          ParamByName('inicio3').Value := DatetoStr(DateTimePicker1.Date);
          ParamByName('fim3').Value := DatetoStr(DateTimePicker2.Date);
          ParamByName('inicio4').Value := DatetoStr(DateTimePicker1.Date);
          ParamByName('fim4').Value := DatetoStr(DateTimePicker2.Date);
          ParamByName('inicio5').Value := DatetoStr(DateTimePicker1.Date);
          ParamByName('fim5').Value := DatetoStr(DateTimePicker2.Date);
          ParamByName('inicio6').Value := DatetoStr(DateTimePicker1.Date);
          ParamByName('fim6').Value := DatetoStr(DateTimePicker2.Date);
          ParamByName('inicio7').Value := DatetoStr(DateTimePicker1.Date);
          ParamByName('fim7').Value := DatetoStr(DateTimePicker2.Date);
          ParamByName('inicio8').Value := DatetoStr(DateTimePicker1.Date);
          ParamByName('fim8').Value := DatetoStr(DateTimePicker2.Date);
          ParamByName('inicio9').Value := DatetoStr(DateTimePicker1.Date);
          ParamByName('fim9').Value := DatetoStr(DateTimePicker2.Date);
          ParamByName('inicio10').Value := DatetoStr(DateTimePicker1.Date);
          ParamByName('fim10').Value := DatetoStr(DateTimePicker2.Date);
          ParamByName('inicio11').Value := DatetoStr(DateTimePicker1.Date);
          ParamByName('fim11').Value := DatetoStr(DateTimePicker2.Date);
          ParamByName('inicio12').Value := DatetoStr(DateTimePicker1.Date);
          ParamByName('fim12').Value := DatetoStr(DateTimePicker2.Date);
          ParamByName('inicio13').Value := DatetoStr(DateTimePicker1.Date);
          ParamByName('fim13').Value := DatetoStr(DateTimePicker2.Date);
          ParamByName('inicio14').Value := DatetoStr(DateTimePicker1.Date);
          ParamByName('fim14').Value := DatetoStr(DateTimePicker2.Date);
          Open;
        End;
        with QryEstTotal do
        Begin
          Close;
          ParamByName('inicio').Value := DatetoStr(DateTimePicker1.Date);
          ParamByName('fim').Value := DatetoStr(DateTimePicker2.Date);
          ParamByName('departamento').Value := (200);
          ParamByName('departamento2').Value := (210);
        End;
        with QryEstVendRealiz do
        Begin
          Close;
          ParamByName('inicio').Value := DatetoStr(DateTimePicker1.Date);
          ParamByName('fim').Value := DatetoStr(DateTimePicker2.Date);
          ParamByName('departamento').Value := (200);
          ParamByName('departamento2').Value := (210);
        End;
        with QryEstVendPerdid do
        Begin
          Close;
          ParamByName('inicio').Value := DatetoStr(DateTimePicker1.Date);
          ParamByName('fim').Value := DatetoStr(DateTimePicker2.Date);
          ParamByName('departamento').Value := (200);
          ParamByName('departamento2').Value := (210);
        End;
        with QryEstAtivos do
        Begin
          Close;
          ParamByName('inicio').Value := DatetoStr(DateTimePicker1.Date);
          ParamByName('fim').Value := DatetoStr(DateTimePicker2.Date);
          ParamByName('departamento').Value := (200);
          ParamByName('departamento2').Value := (210);
        End;
        with QryEstReceptivos do
        Begin
          Close;
          ParamByName('inicio').Value := DatetoStr(DateTimePicker1.Date);
          ParamByName('fim').Value := DatetoStr(DateTimePicker2.Date);
          ParamByName('departamento').Value := (200);
          ParamByName('departamento2').Value := (210);
        End;
      end;
    end;

    QryEstTotal.Open;
    QryEstVendRealiz.Open;
    QryEstVendPerdid.Open;
    QryEstAtivos.Open;
    QryEstReceptivos.Open;

    d := (StrToFloat(dbedit2.Text)*100)/StrToFloat(dbedit1.Text);
    dbedit3.Text:= FormatFloat('#,,0.0',d)+'%';

    e := (StrToFloat(dbedit5.Text)*100)/StrToFloat(dbedit1.Text);
    dbedit6.Text:= FormatFloat('#,,0.0',e)+'%';

    DimensionarGrid( DBGrid1 );
    DimensionarGrid( DBGrid2 );
    DimensionarGrid( DBGrid3 );
    DimensionarGrid( DBGrid6 );

    Screen.Cursor := crDefault;
    End;
end;

procedure TFrmEstatisticas.BtnSairClick(Sender: TObject);
begin
  with DataModule1 do
  Begin
    DtsEstAtendimento.DataSet.Close;
    DtsEstVendPerdida.DataSet.Close;
    DtsEstFaturamento.DataSet.Close;
    DtsEstAtendimento.DataSet.Close;
    DtsEstEstatistica.DataSet.Close;
    DtsEstTotal.DataSet.Close;
    DtsEstVendRealiz.DataSet.Close;
    DtsEstVendPerdid.DataSet.Close;
    DtsEstAtivos.DataSet.Close;
    DtsEstReceptivos.DataSet.Close;
    dbedit3.Text := '';
    dbedit6.Text := '';
    FrmEstatisticas.Close;
  End;
end;

procedure TFrmEstatisticas.FormShow(Sender: TObject);
begin
  datetimepicker1.date:= StartOfTheMonth(now);
  datetimepicker2.date:= EndOfTheMonth(now);
  DBLookupComboBox1.KeyValue:= 100;
  Dados.ActivePage := Atendimentos;
end;

procedure TFrmEstatisticas.DimensionarGrid(dbg: TDBGrid);
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
