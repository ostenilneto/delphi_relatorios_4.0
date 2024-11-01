unit FinanceiroClientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids, ExcelXP, ComObj,
  Vcl.ComCtrls, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls;

type
  TFrmFinanceiroClientes = class(TForm)
    Panel1: TPanel;
    BtnPesquisar: TBitBtn;
    BtnExportar: TBitBtn;
    BtnSair: TBitBtn;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    GridClientes1: TDBGrid;
    GridClientes2: TDBGrid;
    GridClientes3: TDBGrid;
    GridClientes4: TDBGrid;
    procedure BtnSairClick(Sender: TObject);
    procedure GridClientes1TitleClick(Column: TColumn);
    procedure GridClientes2TitleClick(Column: TColumn);
    procedure GridClientes3TitleClick(Column: TColumn);
    procedure GridClientes4TitleClick(Column: TColumn);
    procedure BtnPesquisarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnExportarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmFinanceiroClientes: TFrmFinanceiroClientes;

implementation

{$R *.dfm}

uses DmRel;

procedure TFrmFinanceiroClientes.BtnExportarClick(Sender: TObject);
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
      //Aba1
      QryClientes4.First;
      for linha:= 0 to QryClientes4.RecordCount-1 do
      begin
        for coluna:= 1 to QryClientes4.FieldCount do
         begin
           valorCampo:= QryClientes4.Fields[coluna-1].AsString;
           planilha.cells[linha+2,coluna]:= valorCampo;
         end;

        QryClientes4.Next;

      end;
        for coluna:=1 to QryClientes4.FieldCount do
        begin
          valorCampo:= QryClientes4.Fields[coluna-1].DisplayLabel;
          planilha.cells[1,coluna]:= valorCampo;
        end;
      planilha.columns.AutoFit;

      //Aba2
      planilha.Sheets.Add;
      planilha.Cells.Select;
      planilha.Selection.NumberFormat := '@';
      planilha.WorkSheets[2].DisplayPageBreaks:=False;
      QryClientes3.First;
      for linha:= 0 to QryClientes3.RecordCount-1 do
      begin
       for coluna:= 1 to QryClientes3.FieldCount do
         begin
           valorCampo:= QryClientes3.Fields[coluna-1].AsString;
           planilha.cells[linha+2,coluna]:= valorCampo;
        end;

       QryClientes3.Next;

      end;
      for coluna:=1 to QryClientes3.FieldCount do
      begin
        valorCampo:= QryClientes3.Fields[coluna-1].DisplayLabel;
        planilha.cells[1,coluna]:= valorCampo;
      end;
       planilha.columns.AutoFit;

       //Aba3
       planilha.Sheets.Add;
       planilha.Cells.Select;
       planilha.Selection.NumberFormat := '@';
       planilha.WorkSheets[3].DisplayPageBreaks:=False;
       QryClientes2.First;
       for linha:= 0 to QryClientes2.RecordCount-1 do
       begin
         for coluna:= 1 to QryClientes2.FieldCount do
          begin
             valorCampo:= QryClientes2.Fields[coluna-1].AsString;
             planilha.cells[linha+2,coluna]:= valorCampo;
          end;

         QryClientes2.Next;

       end;
       for coluna:=1 to QryClientes2.FieldCount do
       begin
          valorCampo:= QryClientes2.Fields[coluna-1].DisplayLabel;
          planilha.cells[1,coluna]:= valorCampo;
       end;

       //Aba4
       planilha.Sheets.Add;
       planilha.Cells.Select;
       planilha.Selection.NumberFormat := '@';
       planilha.WorkSheets[3].DisplayPageBreaks:=False;
       QryClientes1.First;
       for linha:= 0 to QryClientes1.RecordCount-1 do
       begin
         for coluna:= 1 to QryClientes1.FieldCount do
          begin
             valorCampo:= QryClientes1.Fields[coluna-1].AsString;
             planilha.cells[linha+2,coluna]:= valorCampo;
          end;

         QryClientes1.Next;

       end;
       for coluna:=1 to QryClientes4.FieldCount do
       begin
          valorCampo:= QryClientes4.Fields[coluna-1].DisplayLabel;
          planilha.cells[1,coluna]:= valorCampo;
       end;

      End;
      planilha.columns.AutoFit;
      planilha.WorkSheets[1].Name:='Saldo Ativo';
      planilha.WorkSheets[2].Name:='Limite = 0';
      planilha.WorkSheets[3].Name:='Limite > 0';
      planilha.WorkSheets[4].Name:='Limite < 0';
  Screen.Cursor := crDefault;
end;

procedure TFrmFinanceiroClientes.BtnPesquisarClick(Sender: TObject);
begin
  Screen.Cursor := crHourglass;

  with DataModule1 do
  begin
    QryClientes1.Close;
    QryClientes2.Close;
    QryClientes3.Close;
    QryClientes4.Close;
    QryClientes1.Open;
    QryClientes2.Open;
    QryClientes3.Open;
    QryClientes4.Open;
  end;

  Screen.Cursor := crDefault;
end;

procedure TFrmFinanceiroClientes.BtnSairClick(Sender: TObject);
begin
  with DataModule1 do
    Begin
          QryClientes1.Close;
          QryClientes2.Close;
          QryClientes3.Close;
          QryClientes4.Close;
          FrmFinanceiroClientes.Close;
    End;
end;

procedure TFrmFinanceiroClientes.FormShow(Sender: TObject);
begin
  with DataModule1 do
  Begin
    QryClientes1.Open;
    QryClientes2.Open;
    QryClientes3.Open;
    QryClientes4.Open;
  PageControl1.ActivePage := TabSheet1;
  End;
end;

procedure TFrmFinanceiroClientes.GridClientes1TitleClick(Column: TColumn);
var
i ,col:integer;
begin
  with DataModule1.QryClientes1 do
  Begin
        If IndexFieldNames = Column.FieldName + ':D' then
          IndexFieldNames := Column.FieldName + ':A'  //crescente
        else
          IndexFieldNames := Column.FieldName + ':D'; // decrescente
        End;
end;

procedure TFrmFinanceiroClientes.GridClientes2TitleClick(Column: TColumn);
var
i ,col:integer;
begin
  with DataModule1.QryClientes2 do
  Begin
        If IndexFieldNames = Column.FieldName + ':D' then
          IndexFieldNames := Column.FieldName + ':A'  //crescente
        else
          IndexFieldNames := Column.FieldName + ':D'; // decrescente
        End;
end;

procedure TFrmFinanceiroClientes.GridClientes3TitleClick(Column: TColumn);
var
i ,col:integer;
begin
  with DataModule1.QryClientes3 do
  Begin
        If IndexFieldNames = Column.FieldName + ':D' then
          IndexFieldNames := Column.FieldName + ':A'  //crescente
        else
          IndexFieldNames := Column.FieldName + ':D'; // decrescente
        End;
end;

procedure TFrmFinanceiroClientes.GridClientes4TitleClick(Column: TColumn);
var
i ,col:integer;
begin
  with DataModule1.QryClientes4 do
  Begin
        If IndexFieldNames = Column.FieldName + ':D' then
          IndexFieldNames := Column.FieldName + ':A'  //crescente
        else
          IndexFieldNames := Column.FieldName + ':D'; // decrescente
        End;
end;

end.
