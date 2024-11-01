unit NFDifal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids, ExcelXP, ComObj,
  Vcl.ComCtrls, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls;

type
  TFrmNFDifal = class(TForm)
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
    Panel3: TPanel;
    Panel4: TPanel;
    GridPecas: TDBGrid;
    GridServicos: TDBGrid;
    GridVeiculos: TDBGrid;
    Label5: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    procedure FormShow(Sender: TObject);
    procedure BtnPesquisarClick(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure BtnLimparClick(Sender: TObject);
    procedure BtnExportarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmNFDifal: TFrmNFDifal;

implementation

{$R *.dfm}

uses DmRel;

procedure TFrmNFDifal.BtnExportarClick(Sender: TObject);
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
      //VE�CULOS
      QryNFDifal_P.First;
      for linha:= 0 to QryNFDifal_V.RecordCount-1 do
      begin
        for coluna:= 1 to QryNFDifal_V.FieldCount do
         begin
           valorCampo:= QryNFDifal_V.Fields[coluna-1].AsString;
           planilha.cells[linha+2,coluna]:= valorCampo;
         end;

        QryNFDifal_V.Next;

      end;
        for coluna:=1 to QryNFDifal_V.FieldCount do
        begin
          valorCampo:= QryNFDifal_V.Fields[coluna-1].DisplayLabel;
          planilha.cells[1,coluna]:= valorCampo;
        end;
      planilha.columns.AutoFit;

      //SERVI�OS
      planilha.Sheets.Add;
      planilha.Cells.Select;
      planilha.Selection.NumberFormat := '@';
      planilha.WorkSheets[2].DisplayPageBreaks:=False;
      QryNFDifal_S.First;
      for linha:= 0 to QryNFDifal_S.RecordCount-1 do
      begin
       for coluna:= 1 to QryNFDifal_S.FieldCount do
         begin
           valorCampo:= QryNFDifal_S.Fields[coluna-1].AsString;
           planilha.cells[linha+2,coluna]:= valorCampo;
        end;

       QryNFDifal_S.Next;

      end;
      for coluna:=1 to QryNFDifal_S.FieldCount do
      begin
        valorCampo:= QryNFDifal_S.Fields[coluna-1].DisplayLabel;
        planilha.cells[1,coluna]:= valorCampo;
      end;
       planilha.columns.AutoFit;

       //PE�AS
       planilha.Sheets.Add;
       planilha.Cells.Select;
       planilha.Selection.NumberFormat := '@';
       planilha.WorkSheets[3].DisplayPageBreaks:=False;
       QryNFDifal_P.First;
       for linha:= 0 to QryNFDifal_P.RecordCount-1 do
       begin
         for coluna:= 1 to QryNFDifal_P.FieldCount do
          begin
             valorCampo:= QryNFDifal_P.Fields[coluna-1].AsString;
             planilha.cells[linha+2,coluna]:= valorCampo;
          end;

         QryNFDifal_P.Next;

       end;
       for coluna:=1 to QryNFDifal_P.FieldCount do
       begin
          valorCampo:= QryNFDifal_P.Fields[coluna-1].DisplayLabel;
          planilha.cells[1,coluna]:= valorCampo;
       end;

      End;
      planilha.columns.AutoFit;
      planilha.WorkSheets[1].Name:='Pe�as(NF-e)';
      planilha.WorkSheets[2].Name:='Servi�os(NFS-e)';
      planilha.WorkSheets[3].Name:='Ve�culos(NF-e)';
  Screen.Cursor := crDefault;
end;

procedure TFrmNFDifal.BtnLimparClick(Sender: TObject);
begin
  with DataModule1 do
  Begin
        QryNFDifal_P.Close;
        QryNFDifal_S.Close;
        QryNFDifal_V.Close;
  End;
end;

procedure TFrmNFDifal.BtnPesquisarClick(Sender: TObject);
begin
  Screen.Cursor := crHourglass;
  with DataModule1.QryNFDifal_P do
  begin
      Close;
      ParamByName('inicio').Value := DatetoStr(DateTimePicker1.Date);
      ParamByName('fim').Value := DatetoStr(DateTimePicker2.Date);
      Open;
  end;
    with DataModule1.QryNFDifal_S do
  begin
      Close;
      ParamByName('inicio').Value := DatetoStr(DateTimePicker1.Date);
      ParamByName('fim').Value := DatetoStr(DateTimePicker2.Date);
      Open;
  end;
    with DataModule1.QryNFDifal_V do
  begin
      Close;
      ParamByName('inicio').Value := DatetoStr(DateTimePicker1.Date);
      ParamByName('fim').Value := DatetoStr(DateTimePicker2.Date);
      Open;
  end;
  Screen.Cursor := crDefault;
end;

procedure TFrmNFDifal.BtnSairClick(Sender: TObject);
begin
  with DataModule1 do
    Begin
      QryNFDifal_P.Close;
      QryNFDifal_S.Close;
      QryNFDifal_V.Close;
      FrmNFDifal.Close;
    End;

end;

procedure TFrmNFDifal.FormShow(Sender: TObject);
begin
  datetimepicker1.date:= now;
  datetimepicker2.date:= now;
end;

end.
