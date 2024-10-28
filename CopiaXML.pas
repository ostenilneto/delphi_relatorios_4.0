unit CopiaXML;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls;

type
  TFrmCopiaXML = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    Button2: TButton;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    BtnPesquisar: TBitBtn;
    BtnSair: TBitBtn;
    Panel1: TPanel;
    procedure Button2Click(Sender: TObject);
    procedure BtnPesquisarClick(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCopiaXML: TFrmCopiaXML;
  var acha2, acha1: string;
  var arq1, arq2 : string;
  var Dir_orig, Dir_dest: String;

implementation

{$R *.dfm}

procedure TFrmCopiaXML.BtnPesquisarClick(Sender: TObject);
begin
  Dir_orig:= 'C:\Arquivos\bravos\xml\1.1\';
  ForceDirectories(Dir_orig);
  arq1 := (edit1.Text+'-nfe.xml');
  arq2 := (edit1.Text+'-can.xml');
  acha1 := FileSearch(arq1 , Dir_orig);
  acha2 := FileSearch(arq2 , Dir_orig);
  if edit1.Text = '' Then Label2.Caption := 'Nome do arquivo em branco.'
  else If acha1 = '' Then Label2.Caption := 'Arquivo não encontrado.'
  Else Label2.Caption := 'Arquivo encontrado!';
  label3.Caption := acha1;
  label4.Caption := acha2;
end;

procedure TFrmCopiaXML.BtnSairClick(Sender: TObject);
begin
  FrmCopiaXML.Close;
end;


procedure TFrmCopiaXML.Button2Click(Sender: TObject);
begin
  Dir_dest:= 'C:\XML\';
  if CopyFile(Pchar(Dir_orig + arq1),
    PChar(Dir_dest + arq1), True) then
     ShowMessage('1º Arquivo copiado com sucesso')
  else
     ShowMessage('#Atenção# - Problema ao copiar o arquivo.');
  if label4.Caption <> '' then
  begin
    if CopyFile(Pchar(Dir_orig + arq2),
    PChar(Dir_dest + arq2), True)
     then
     ShowMessage('2º Arquivo copiado com sucesso')
    else
     ShowMessage('#Atenção# - Problema ao copiar o arquivo.');
  end
  else
end;

procedure TFrmCopiaXML.FormShow(Sender: TObject);
begin
  Showmessage('Para buscar XML, execute este no Servidor NFe(10.11.31.5)!')
end;

end.


