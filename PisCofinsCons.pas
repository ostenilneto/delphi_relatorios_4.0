unit PisCofinsCons;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids, DateUtils,
  Vcl.ComCtrls, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, frxDBSet, frxClass, frxTableObject;

type
  TFrmPisCofinsCons = class(TForm)
    BtnPesquisar: TBitBtn;
    BtnSair: TBitBtn;
    DateTimePicker2: TDateTimePicker;
    Label1: TLabel;
    DateTimePicker1: TDateTimePicker;
    Label2: TLabel;
    ComboBox1: TComboBox;
    Label3: TLabel;
    Panel1: TPanel;
    frxReport1: TfrxReport;
    procedure BtnSairClick(Sender: TObject);
    procedure BtnPesquisarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPisCofinsCons: TFrmPisCofinsCons;

implementation

{$R *.dfm}

procedure TFrmPisCofinsCons.BtnPesquisarClick(Sender: TObject);
begin
  try
      // Exibe o relatório na tela
      frxReport1.ShowReport;
    except
      on E: Exception do
        ShowMessage('Erro ao carregar o relatório: ' + E.Message);
    end;
end;

procedure TFrmPisCofinsCons.BtnSairClick(Sender: TObject);
begin
  FrmPisCofinsCons.Close;
end;

procedure TFrmPisCofinsCons.FormShow(Sender: TObject);
begin
  datetimepicker1.date:= StartOfTheMonth(now);
  datetimepicker2.DateTime:= now;
end;

end.
