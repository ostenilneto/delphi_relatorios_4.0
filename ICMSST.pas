unit ICMSST;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids, ExcelXP,
  Vcl.ComCtrls, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, ComObj, Math;

type
  TFrmIcmsST = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    BtnPesquisar: TBitBtn;
    BtnExportar: TBitBtn;
    BtnSair: TBitBtn;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    BtnLimpar: TBitBtn;
    GridIcmsST: TDBGrid;
    procedure BtnLimparClick(Sender: TObject);
    procedure DimensionarGrid(dbg: TDBGrid);
    procedure BtnPesquisarClick(Sender: TObject);
    procedure BtnExportarClick(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmIcmsST: TFrmIcmsST;

implementation

{$R *.dfm}

uses DmRel;

procedure TFrmIcmsST.BtnExportarClick(Sender: TObject);
Var
linha, coluna: integer;
planilha: variant;
valorCampo: string;
begin
  Screen.Cursor := crHourglass;
  with DataModule1 do
    Begin
     planilha:= CreateOleObject('Excel.Application');
     planilha.Workbooks.add(1);
     planilha.Cells.Select;
     planilha.Selection.NumberFormat := '@';
     planilha.caption:= 'Exporta��o de dados para o excel';
     planilha.visible:= true;
     QryIcmsST.First;
     for linha:= 0 to QryIcmsST.RecordCount-1 do
     begin
       for coluna:= 1 to QryIcmsST.FieldCount do
        begin
           valorCampo:= QryIcmsST.Fields[coluna-1].AsString;
           planilha.cells[linha+2,coluna]:= valorCampo;
        end;

       QryIcmsST.Next;

     end;
     for coluna:=1 to QryIcmsST.FieldCount do
     begin
        valorCampo:= QryIcmsST.Fields[coluna-1].DisplayLabel;
        planilha.cells[1,coluna]:= valorCampo;
     end;
     planilha.columns.AutoFit;
     planilha.WorkSheets[1].Name:='NF com ICMSST';
    End;
    Screen.Cursor := crDefault;
end;

procedure TFrmIcmsST.BtnLimparClick(Sender: TObject);
begin
      with DataModule1 do
    begin
      QryIcmsST.Close;
    end;
end;

procedure TFrmIcmsST.BtnPesquisarClick(Sender: TObject);
begin
  Screen.Cursor := crHourglass;
  with DataModule1.QryIcmsST do
  begin
      Close;
      ParamByName('inicio').Value := DatetoStr(DateTimePicker1.Date);
      ParamByName('fim').Value := DatetoStr(DateTimePicker2.Date);
      Open;
  end;

  DimensionarGrid( GridIcmsST );
  Screen.Cursor := crDefault;
end;

procedure TFrmIcmsST.BtnSairClick(Sender: TObject);
begin
    with DataModule1 do
    Begin
      QryIcmsST.Close;
      FrmIcmsST.Close;
    End;
end;

procedure TFrmIcmsST.FormShow(Sender: TObject);
begin
  datetimepicker1.date:= now;
  datetimepicker2.date:= now;
  BtnPesquisar.SetFocus;
end;


procedure TFrmIcmsST.DimensionarGrid(dbg: TDBGrid);
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
