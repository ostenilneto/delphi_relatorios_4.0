unit VeicLeads;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids, DateUtils,
  Vcl.DBCtrls, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.Buttons, Vcl.ExtCtrls, Math, ExcelXP, ComObj;

type
  TFrmVeicLeads = class(TForm)
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
    DBLookupComboBox1: TDBLookupComboBox;
    Panel2: TPanel;
    Label5: TLabel;
    GridResult: TDBGrid;
    Panel4: TPanel;
    Label3: TLabel;
    GridMensal: TDBGrid;
    DBLookupComboBox2: TDBLookupComboBox;
    procedure FormShow(Sender: TObject);
    procedure DimensionarGrid(dbg: TDBGrid);
    procedure ComboBox1Change(Sender: TObject);
    procedure BtnLimparClick(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure BtnPesquisarClick(Sender: TObject);
    procedure BtnExportarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmVeicLeads: TFrmVeicLeads;

implementation

{$R *.dfm}

uses DmRel;

procedure TFrmVeicLeads.BtnExportarClick(Sender: TObject);
Var
  linha, coluna: integer;
  ExcelApp, Workbook, Worksheet: variant;
  valorCampo: string;
begin
  Screen.Cursor := crHourglass;
  try
    with DataModule1 do
    Begin
      // Inicializando o Excel
    ExcelApp := CreateOleObject('Excel.Application');
    ExcelApp.Visible := True;
    Workbook := ExcelApp.Workbooks.Add;

    // Leads Mensal
    Worksheet := Workbook.WorkSheets[1];
    Worksheet.Name := 'Resumo Leads';
    Worksheet.DisplayPageBreaks := False;

    // Aqui voc� pode aplicar o formato direto �s c�lulas em vez de selecion�-las
    Worksheet.Cells.NumberFormat := '@';

    // Exportando os dados de QryLeads
    QryLeads.First;
    for linha := 0 to QryLeads.RecordCount - 1 do
    begin
      for coluna := 1 to QryLeads.FieldCount do
      begin
        valorCampo := QryLeads.Fields[coluna-1].AsString;
        Worksheet.Cells[linha+2, coluna] := valorCampo;
      end;
      QryLeads.Next;
    end;

    // Cabe�alhos
    for coluna := 1 to QryLeads.FieldCount do
    begin
      valorCampo := QryLeads.Fields[coluna-1].DisplayLabel;
      Worksheet.Cells[1, coluna] := valorCampo;
    end;
    Worksheet.Columns.AutoFit;

    // Leads Origem ou Vendedor
    if ComboBox1.ItemIndex = 0 then
    begin
      // Criar nova planilha para Leads por Origem
      Worksheet := Workbook.WorkSheets.Add;
      Worksheet.Name := 'Leads por Origem';
      Worksheet.DisplayPageBreaks := False;

      QryLeads_origem.First;
      for linha := 0 to QryLeads_origem.RecordCount - 1 do
      begin
        for coluna := 1 to QryLeads_origem.FieldCount do
        begin
          valorCampo := QryLeads_origem.Fields[coluna-1].AsString;
          Worksheet.Cells[linha+2, coluna] := valorCampo;
        end;
        QryLeads_origem.Next;
      end;

      // Cabe�alhos
      for coluna := 1 to QryLeads_origem.FieldCount do
      begin
        valorCampo := QryLeads_origem.Fields[coluna-1].DisplayLabel;
        Worksheet.Cells[1, coluna] := valorCampo;
      end;
      Worksheet.Columns.AutoFit;
    end
    else
    begin
      // Criar nova planilha para Leads por Vendedor
      Worksheet := Workbook.WorkSheets.Add;
      Worksheet.Name := 'Leads por Vendedor';
      Worksheet.DisplayPageBreaks := False;

      QryLeads_vendedor.First;
      for linha := 0 to QryLeads_vendedor.RecordCount - 1 do
      begin
        for coluna := 1 to QryLeads_vendedor.FieldCount do
        begin
          valorCampo := QryLeads_vendedor.Fields[coluna-1].AsString;
          Worksheet.Cells[linha+2, coluna] := valorCampo;
        end;
        QryLeads_vendedor.Next;
      end;

      // Cabe�alhos
      for coluna := 1 to QryLeads_vendedor.FieldCount do
      begin
        valorCampo := QryLeads_vendedor.Fields[coluna-1].DisplayLabel;
        Worksheet.Cells[1, coluna] := valorCampo;
      end;
      Worksheet.Columns.AutoFit;
    end;
    End;

  finally
    Screen.Cursor := crDefault;
  end;
end;


procedure TFrmVeicLeads.BtnLimparClick(Sender: TObject);
begin
  Screen.Cursor := crHourglass;
  with DataModule1 do
  Begin
        QryLeads.Close;
        QryLeads_origem.Close;
        QryLeads_vendedor.Close;
  End;
  Screen.Cursor := crDefault;
end;

procedure TFrmVeicLeads.BtnPesquisarClick(Sender: TObject);
begin
  Screen.Cursor := crHourglass;
  GridResult.DataSource.DataSet.Close;
  GridMensal.DataSource.DataSet.Close;
  with DataModule1.QryLeads do
    Begin
       Close;
       ParamByName('inicio').Value := DatetoStr(DateTimePicker1.Date);
       ParamByName('fim').Value := DatetoStr(DateTimePicker2.Date);
       ParamByName('inicio2').Value := DatetoStr(DateTimePicker1.Date);
       ParamByName('fim2').Value := DatetoStr(DateTimePicker2.Date);
       ParamByName('inicio3').Value := DatetoStr(DateTimePicker1.Date);
       ParamByName('fim3').Value := DatetoStr(DateTimePicker2.Date);
       Open;
    End;
    DimensionarGrid( GridMensal );

  if ComboBox1.ItemIndex = 1 then
    begin
      with DataModule1.QryLeads_vendedor do
        Begin
          ParamByName('inicio').Value := DateTimetoStr(DateTimePicker1.Date);
          ParamByName('fim').Value := DateTimetoStr(DateTimePicker2.Date);
          ParamByName('vendedor').Value := DBLookupComboBox2.KeyValue;
          Open;
        End;
  end
  else begin
        with DataModule1.QryLeads_origem do
        Begin
          ParamByName('inicio').Value := DateTimetoStr(DateTimePicker1.Date);
          ParamByName('fim').Value := DateTimetoStr(DateTimePicker2.Date);
          ParamByName('inicio2').Value := DateTimetoStr(DateTimePicker1.Date);
          ParamByName('fim2').Value := DateTimetoStr(DateTimePicker2.Date);
          ParamByName('origem').Value := DBLookupComboBox1.KeyValue;
          Open;
        End;
  end;
  Screen.Cursor := crDefault;
end;

procedure TFrmVeicLeads.BtnSairClick(Sender: TObject);
begin
    with DataModule1 do
  Begin
        QryLeads.Close;
        QryLeads_origem.Close;
        QryLeads_vendedor.Close;
        QryCad_Vendedor.Close;
        QryOrigem_Trafego.Close;
        FrmVeicLeads.Close;
  End;
end;

procedure TFrmVeicLeads.ComboBox1Change(Sender: TObject);
begin
  Screen.Cursor := crHourglass;
  with DataModule1 do
    Begin
      QryLeads.Close;
      QryLeads_origem.Close;
      QryLeads_vendedor.Close;
      QryCad_Vendedor.Close;
      QryOrigem_Trafego.Close;
      if ComboBox1.ItemIndex = 1 then
      begin
        QryCad_Vendedor.ParamByName('cargo').Value := 6;
        QryCad_Vendedor.Open;
        Label6.Caption := 'Escolha o vendedor:';
        DtsLeads_.DataSet := QryLeads_vendedor;
        DBLookupComboBox2.KeyValue:= 607;
        DBLookupComboBox1.Enabled := False;
        DBLookupComboBox1.Visible := False;
        DBLookupComboBox2.Enabled := True;
        DBLookupComboBox2.Visible := True;
        with DataModule1.QryLeads do
          Begin
             Close;
             ParamByName('inicio').Value := DatetoStr(DateTimePicker1.Date);
             ParamByName('fim').Value := DatetoStr(DateTimePicker2.Date);
             ParamByName('inicio2').Value := DatetoStr(DateTimePicker1.Date);
             ParamByName('fim2').Value := DatetoStr(DateTimePicker2.Date);
             ParamByName('inicio3').Value := DatetoStr(DateTimePicker1.Date);
             ParamByName('fim3').Value := DatetoStr(DateTimePicker2.Date);
             Open;
          End;
        DimensionarGrid( GridMensal );
      end
      else
      begin
        QryOrigem_Trafego.Open;
        Label6.Caption := 'Origem de Tr�fego:';
        DtsLeads_.DataSet := QryLeads_origem;
        DBLookupComboBox1.ListFieldIndex:= 0;
        DBLookupComboBox1.Enabled := True;
        DBLookupComboBox1.Visible := True;
        DBLookupComboBox2.Enabled := False;
        DBLookupComboBox2.Visible := False;
        with DataModule1.QryLeads do
          Begin
             Close;
             ParamByName('inicio').Value := DatetoStr(DateTimePicker1.Date);
             ParamByName('fim').Value := DatetoStr(DateTimePicker2.Date);
             ParamByName('inicio2').Value := DatetoStr(DateTimePicker1.Date);
             ParamByName('fim2').Value := DatetoStr(DateTimePicker2.Date);
             ParamByName('inicio3').Value := DatetoStr(DateTimePicker1.Date);
             ParamByName('fim3').Value := DatetoStr(DateTimePicker2.Date);
             Open;
          End;
        DimensionarGrid( GridMensal );
      end;
    End;
  Screen.Cursor := crDefault;
end;

procedure TFrmVeicLeads.DimensionarGrid(dbg: TDBGrid);
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

procedure TFrmVeicLeads.FormShow(Sender: TObject);
begin
  datetimepicker1.date:= StartOfTheMonth(now);
  datetimepicker2.DateTime:= now;
  DBLookupComboBox2.Enabled := False;
  DBLookupComboBox2.Visible := False;
  DBLookupComboBox1.Enabled := True;
  DBLookupComboBox1.Visible := True;

  with DataModule1.QryLeads do
  Begin
     Close;
     ParamByName('inicio').Value := DatetoStr(DateTimePicker1.Date);
     ParamByName('fim').Value := DatetoStr(DateTimePicker2.Date);
     ParamByName('inicio2').Value := DatetoStr(DateTimePicker1.Date);
     ParamByName('fim2').Value := DatetoStr(DateTimePicker2.Date);
     ParamByName('inicio3').Value := DatetoStr(DateTimePicker1.Date);
     ParamByName('fim3').Value := DatetoStr(DateTimePicker2.Date);
     Open;
  End;
  DataModule1.QryOrigem_Trafego.Open;
  ComboBox1.ItemIndex := 0;
  DBLookupComboBox1.KeyValue:= 14;

  DimensionarGrid( GridMensal );
end;

end.
