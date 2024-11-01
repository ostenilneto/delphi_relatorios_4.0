unit Amaro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, ExcelXP,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.Buttons, Vcl.ExtCtrls, OleServer,
  ADODB, ComObj, Mask;

type
  TFrmAmaro = class(TForm)
    GridAmaro: TDBGrid;
    Panel1: TPanel;
    BtnPesquisar: TBitBtn;
    BtnExportar: TBitBtn;
    BtnSair: TBitBtn;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    BtnLimpar: TBitBtn;
    procedure FormShow(Sender: TObject);
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
  FrmAmaro: TFrmAmaro;

implementation

{$R *.dfm}

uses DmRel, Principal;

procedure TFrmAmaro.BtnExportarClick(Sender: TObject);
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
     planilha.caption:= 'Exportação de dados para o excel';
     planilha.visible:= true;
     QryAmaro.First;
     for linha:= 0 to QryAmaro.RecordCount-1 do
     begin
       for coluna:= 1 to QryAmaro.FieldCount do
        begin
           valorCampo:= QryAmaro.Fields[coluna-1].AsString;
           planilha.cells[linha+2,coluna]:= valorCampo;
        end;

       QryAmaro.Next;

     end;
     for coluna:=1 to QryAmaro.FieldCount do
     begin
        valorCampo:= QryAmaro.Fields[coluna-1].DisplayLabel;
        planilha.cells[1,coluna]:= valorCampo;
     end;
     planilha.columns.AutoFit;
     planilha.WorkSheets[1].Name:='Amaro';
    End;
    Screen.Cursor := crDefault;
end;

procedure TFrmAmaro.BtnLimparClick(Sender: TObject);
begin
    with DataModule1 do
    begin
      QryAmaro.Close;
    end;
end;

procedure TFrmAmaro.BtnPesquisarClick(Sender: TObject);
begin
  Screen.Cursor := crHourglass;
  with DataModule1.QryAmaro do
  begin
      Close;
      ParamByName('inicio').Value := DatetoStr(DateTimePicker1.Date);
      ParamByName('fim').Value := DatetoStr(DateTimePicker2.Date);
      Open;
  end;
  Screen.Cursor := crDefault;
end;

procedure TFrmAmaro.BtnSairClick(Sender: TObject);
begin
  with DataModule1 do
    Begin
          QryAmaro.Close;
          FrmAmaro.Close;
    End;
end;

procedure TFrmAmaro.FormShow(Sender: TObject);
begin
    datetimepicker1.date:= now-1;
    datetimepicker2.date:= now-1;
    BtnPesquisar.SetFocus;
end;

end.
