unit AcoesCRM;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids, DateUtils, ComObj,
  Vcl.StdCtrls, Vcl.DBCtrls, Vcl.ComCtrls, Vcl.Buttons, Vcl.ExtCtrls;

type
  TFrmVeicCRM = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Relatório: TLabel;
    Label6: TLabel;
    BtnPesquisar: TBitBtn;
    BtnExportar: TBitBtn;
    BtnSair: TBitBtn;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    BtnLimpar: TBitBtn;
    DBLookupComboBox1: TDBLookupComboBox;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    GridResult: TDBGrid;
    procedure FormShow(Sender: TObject);
    procedure BtnLimparClick(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure BtnPesquisarClick(Sender: TObject);
    procedure BtnExportarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmVeicCRM: TFrmVeicCRM;

implementation

{$R *.dfm}

uses DmRel;

procedure TFrmVeicCRM.BtnExportarClick(Sender: TObject);
Var
linha, coluna: integer;
planilha: variant;
valorCampo : string;
begin
  Screen.Cursor := crHourglass;
  with DataModule1 do
    Begin
      if ComboBox1.ItemIndex = 0 then
        begin
          planilha:= CreateOleObject('Excel.Application');
          planilha.Workbooks.add(1);
          planilha.Cells.Select;
          planilha.Selection.NumberFormat := '@';
          planilha.caption:= 'Exportação de dados para o excel';
          planilha.visible:= true;
          QryAnivers.First;
          for linha:= 0 to QryAnivers.RecordCount-1 do
            begin
              for coluna:= 1 to QryAnivers.FieldCount do
                begin
                  valorCampo:= QryAnivers.Fields[coluna-1].AsString;
                  planilha.cells[linha+2,coluna]:= valorCampo;
                end;

              QryAnivers.Next;

            end;
          for coluna:=1 to QryAnivers.FieldCount do
            begin
              valorCampo:= QryAnivers.Fields[coluna-1].DisplayLabel;
              planilha.cells[1,coluna]:= valorCampo;
          end;
          planilha.columns.AutoFit;
          planilha.WorkSheets[1].Name:='Clientes aniversariantes';
        end
      else if ComboBox1.ItemIndex = 1 then
        begin
          planilha:= CreateOleObject('Excel.Application');
          planilha.Workbooks.add(1);
          planilha.Cells.Select;
          planilha.Selection.NumberFormat := '@';
          planilha.caption:= 'Exportação de dados para o excel';
          planilha.visible:= true;
          QryCRMVeicModelo.First;
          for linha:= 0 to QryCRMVeicModelo.RecordCount-1 do
            begin
              for coluna:= 1 to QryCRMVeicModelo.FieldCount do
                begin
                  valorCampo:= QryCRMVeicModelo.Fields[coluna-1].AsString;
                  planilha.cells[linha+2,coluna]:= valorCampo;
                end;

              QryCRMVeicModelo.Next;

            end;
          for coluna:=1 to QryCRMVeicModelo.FieldCount do
            begin
              valorCampo:= QryCRMVeicModelo.Fields[coluna-1].DisplayLabel;
              planilha.cells[1,coluna]:= valorCampo;
          end;
          planilha.columns.AutoFit;
          planilha.WorkSheets[1].Name:='Vendas por Familia|Modelo';
        end
      else
        begin
          planilha:= CreateOleObject('Excel.Application');
          planilha.Workbooks.add(1);
          planilha.Cells.Select;
          planilha.Selection.NumberFormat := '@';
          planilha.caption:= 'Exportação de dados para o excel';
          planilha.visible:= true;
          QryCRMVeic.First;
          for linha:= 0 to QryCRMVeic.RecordCount-1 do
            begin
              for coluna:= 1 to QryCRMVeic.FieldCount do
                begin
                  valorCampo:= QryCRMVeic.Fields[coluna-1].AsString;
                  planilha.cells[linha+2,coluna]:= valorCampo;
                end;

              QryCRMVeic.Next;

            end;
          for coluna:=1 to QryCRMVeic.FieldCount do
            begin
              valorCampo:= QryCRMVeic.Fields[coluna-1].DisplayLabel;
              planilha.cells[1,coluna]:= valorCampo;
          end;
          planilha.columns.AutoFit;
          planilha.WorkSheets[1].Name:='Vendas por Departamento';
        end;
    End;
    Screen.Cursor := crDefault;
end;

procedure TFrmVeicCRM.BtnLimparClick(Sender: TObject);
begin
  with DataModule1 do
  Begin
    QryAnivers.Close;
    QryCRMVeic.Close;
    QryCRMVeicModelo.Close;
  End;
end;

procedure TFrmVeicCRM.BtnPesquisarClick(Sender: TObject);
begin
  Screen.Cursor := crHourglass;
  with DataModule1 do
  Begin
    QryAnivers.Close;
    QryCRMVeic.Close;
    QryCRMVeicModelo.Close;
    if ComboBox1.ItemIndex = 0 then
      begin
        DtsCRM.DataSet := QryAnivers;
        QryAnivers.ParamByName('DtIni').Value := DayOf(DateTimePicker1.Date);
        QryAnivers.ParamByName('DtFim').Value := DayOf(DateTimePicker2.Date);
        QryAnivers.ParamByName('MsIni').Value := MonthOf(DateTimePicker1.Date);
        QryAnivers.ParamByName('MsFim').Value := MonthOf(DateTimePicker2.Date);
        QryAnivers.Open;
      end
      else if ComboBox1.ItemIndex = 1 then
      begin
        DtsCRM.DataSet := QryCRMVeicModelo;
        QryCRMVeicModelo.ParamByName('inicio').Value := DatetoStr(DateTimePicker1.Date);
        QryCRMVeicModelo.ParamByName('fim').Value := DatetoStr(DateTimePicker2.Date);
        QryCRMVeicModelo.ParamByName('familia').Value := DBLookupComboBox1.KeyValue;
        QryCRMVeicModelo.Open;
      end
    else
      begin
        DtsCRM.DataSet := QryCRMVeic;
        QryCRMVeic.ParamByName('inicio').Value := DatetoStr(DateTimePicker1.Date);
        QryCRMVeic.ParamByName('fim').Value := DatetoStr(DateTimePicker2.Date);
        if ComboBox2.ItemIndex = 0 then
        begin
          QryCRMVeic.ParamByName('dep').Value := 'N'
        end
        else
        begin
          QryCRMVeic.ParamByName('dep').Value := 'U'
        end;

          QryCRMVeic.Open;
      end;
  End;
  Screen.Cursor := crDefault;
end;

procedure TFrmVeicCRM.BtnSairClick(Sender: TObject);
begin
  with DataModule1 do
  Begin
    QryAnivers.Close;
    QryCRMVeic.Close;
    QryCRMVeicModelo.Close;
    FrmVeicCRM.Close;
  End;
end;

procedure TFrmVeicCRM.ComboBox1Change(Sender: TObject);
begin
  if ComboBox1.ItemIndex = 0 then
    begin
      with DataModule1 do
      Begin
        QryAnivers.Close;
        QryCRMVeic.Close;
        QryCRMVeicModelo.Close;
        ComboBox2.Enabled := False;
        ComboBox2.Visible := False;
        DtsCRM.DataSet := QryAnivers;
        DBLookupComboBox1.Enabled := False;
        DBLookupComboBox1.Visible := False;
        Label6.Visible := False;
        //QryAnivers.Open;
      End;
    end
    else if ComboBox1.ItemIndex = 1 then
    begin
      with DataModule1 do
      Begin
        QryAnivers.Close;
        QryCRMVeic.Close;
        QryCRMVeicModelo.Close;
        ComboBox2.Enabled := False;
        ComboBox2.Visible := False;
        Label6.Caption := 'Familia/Modelo:';
        DBLookupComboBox1.Enabled := True;
        DBLookupComboBox1.Visible := True;
        Label6.Visible := True;
        DtsCRM.DataSet := QryCRMVeicModelo;
        //QryCRMVeicModelo.Open;
        DBLookupComboBox1.KeyValue:= 4;
      End;
    end
    else
    begin
      with DataModule1 do
      Begin
        QryAnivers.Close;
        QryCRMVeic.Close;
        QryCRMVeicModelo.Close;
        DBLookupComboBox1.Enabled := False;
        DBLookupComboBox1.Visible := False;
        ComboBox2.Enabled := True;
        ComboBox2.Visible := True;
        Label6.Caption := 'Departamento:';
        Label1.Visible := True;
        DtsCRM.DataSet := QryCRMVeic;
        Label6.Visible := True;
        //QryCRMVeicModelo.Open;
        DBLookupComboBox1.KeyValue:= 4;
      End;
    end;
end;

procedure TFrmVeicCRM.FormShow(Sender: TObject);
begin
  datetimepicker1.date:= StartOfTheMonth(now);
  datetimepicker2.date:= EndOfTheMonth(now);
  ComboBox1.ItemIndex := 0;
  DBLookupComboBox1.Enabled := False;
  DBLookupComboBox1.Visible := False;
  Label6.Visible := False;
  ComboBox2.Enabled := False;
  ComboBox2.Visible := False;
end;

end.
