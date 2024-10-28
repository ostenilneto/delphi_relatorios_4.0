unit Obsoleto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, ComObj, ExcelXP;

type
  TFrmObsoleto = class(TForm)
    Panel1: TPanel;
    GridObsoleto: TDBGrid;
    BtnPesquisar: TBitBtn;
    BtnExportar: TBitBtn;
    BtnSair: TBitBtn;
    procedure BtnSairClick(Sender: TObject);
    procedure BtnPesquisarClick(Sender: TObject);
    procedure GridObsoletoTitleClick(Column: TColumn);
    procedure BtnExportarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmObsoleto: TFrmObsoleto;

implementation

{$R *.dfm}

uses DmRel;

procedure TFrmObsoleto.BtnExportarClick(Sender: TObject);
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
     QryObsoleto.First;
     for linha:= 0 to QryObsoleto.RecordCount-1 do
     begin
       for coluna:= 1 to QryObsoleto.FieldCount do
        begin
           valorCampo:= QryObsoleto.Fields[coluna-1].AsString;
           planilha.cells[linha+2,coluna]:= valorCampo;
        end;

       QryObsoleto.Next;

     end;
     for coluna:=1 to QryObsoleto.FieldCount do
     begin
        valorCampo:= QryObsoleto.Fields[coluna-1].DisplayLabel;
        planilha.cells[1,coluna]:= valorCampo;
     end;
     planilha.columns.AutoFit;
     planilha.WorkSheets[1].Name:='Peças Obsoletas';
    End;
    Screen.Cursor := crDefault;
end;

procedure TFrmObsoleto.BtnPesquisarClick(Sender: TObject);
begin
  Screen.Cursor := crHourglass;
  with DataModule1.QryObsoleto do
  begin
      Close;
      Open;
  end;
  Screen.Cursor := crDefault;
end;

procedure TFrmObsoleto.BtnSairClick(Sender: TObject);
begin
  with DataModule1 do
    Begin
          QryObsoleto.Close;
          FrmObsoleto.Close;
    End;
end;

procedure TFrmObsoleto.GridObsoletoTitleClick(Column: TColumn);  // Ordenação
var
i ,col:integer;
begin
  Screen.Cursor := crHourglass;
  with DataModule1.QryObsoleto do
  Begin
        If IndexFieldNames = Column.FieldName + ':D' then
          IndexFieldNames := Column.FieldName + ':A'  //crescente
        else
          IndexFieldNames := Column.FieldName + ':D'; // decrescente
        End;
  Screen.Cursor := crDefault;
end;

end.
