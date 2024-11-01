unit Versao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, IniFiles;

type
  TFrmVersao = class(TForm)
    LabelVersion: TLabel;
    BtnSair: TBitBtn;
    MemoChanges: TMemo;
    Panel1: TPanel;
    Panel2: TPanel;
    ComboBoxVersions: TComboBox;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure ComboBoxVersionsChange(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
  private
    function GetAppVersion: string;
  public
    { Public declarations }
  end;

var
  FrmVersao: TFrmVersao;

implementation

{$R *.dfm}

procedure TFrmVersao.FormCreate(Sender: TObject);
var
  Ini: TIniFile;
  Sections: TStringList;
  I: Integer;
  FilePath, VersaoInfo: string;
begin
  LabelVersion.Caption := 'Vers�o Atual: ' + GetAppVersion;

  MemoChanges.Lines.Clear;  // Limpa o Memo antes de carregar novo conte�do

  // Caminho do arquivo INI (pode ser ajustado conforme necess�rio)
  FilePath := ExtractFilePath(Application.ExeName) + 'Changelog.ini';

  // Cria uma inst�ncia do TIniFile
  Ini := TIniFile.Create(FilePath);
  Sections := TStringList.Create;

  try
    // Obt�m as chaves (vers�es) da se��o "Versao"
    Ini.ReadSection('Versao', Sections);

    // Popula o ComboBox com as vers�es e suas descri��es
    for i := 0 to Sections.Count - 1 do
    begin
      ComboBoxVersions.Items.Add(Sections[i]);
    end;

     // Seleciona a primeira vers�o por padr�o (opcional)
    if ComboBoxVersions.Items.Count > 0 then
      ComboBoxVersions.ItemIndex := 0;

    // Chama o evento para atualizar o Memo com a descri��o da primeira vers�o
    ComboBoxVersionsChange(ComboBoxVersions);

  finally
    // Libera mem�ria
    Ini.Free;
    Sections.Free;
  end;
end;


procedure TFrmVersao.ComboBoxVersionsChange(Sender: TObject);
var
  Ini: TIniFile;
  FilePath, Versao, Descricao: string;
begin
  // Caminho do arquivo INI (ajuste conforme necess�rio)
  FilePath := ExtractFilePath(Application.ExeName) + 'Changelog.ini';

  // Verifica se uma vers�o foi selecionada no ComboBox
  if ComboBoxVersions.ItemIndex = -1 then Exit;

  // Obt�m a vers�o selecionada
  Versao := ComboBoxVersions.Items[ComboBoxVersions.ItemIndex];

  // Cria uma inst�ncia do TIniFile
  Ini := TIniFile.Create(FilePath);

  try
    MemoChanges.Clear;
    Descricao := Ini.ReadString('Versao', Versao, 'Descri��o n�o encontrada');

    // Substitui o caractere "|" por quebras de linha reais
    Descricao := StringReplace(Descricao, '|', #13#10, [rfReplaceAll]);

    // Exibe todo o texto da descri��o no MemoChanges
    MemoChanges.Lines.Add(Descricao);
    MemoChanges.Lines.Add('');  // Adiciona uma linha em branco para pular linha
    MemoChanges.ReadOnly := True;
    MemoChanges.Enabled := False;
  finally
    Ini.Free;
  end;
end;

procedure TFrmVersao.BtnSairClick(Sender: TObject);
begin
  FrmVersao.Close;
end;

function TFrmVersao.GetAppVersion: string;
var
  FileName: string;
  InfoSize, VerSize: DWORD;
  VerInfo: Pointer;
  VerValue: PVSFixedFileInfo;
  Dummy: DWORD;
  Major, Minor, Release, Build: Word;
begin
  // Obt�m o nome do arquivo execut�vel
  FileName := ParamStr(0);

  // Obt�m o tamanho da informa��o de vers�o
  InfoSize := GetFileVersionInfoSize(PChar(FileName), Dummy);

  if InfoSize = 0 then
  begin
    Result := 'Vers�o n�o dispon�vel';
    Exit;
  end;

  // Aloca mem�ria para armazenar a informa��o de vers�o
  GetMem(VerInfo, InfoSize);
  try
    // Obt�m a informa��o de vers�o do arquivo
    if GetFileVersionInfo(PChar(FileName), 0, InfoSize, VerInfo) then
    begin
      // Obt�m o valor da vers�o
      if VerQueryValue(VerInfo, '\', Pointer(VerValue), VerSize) then
      begin
        // Extrai os n�meros de vers�o: Major.Minor.Release.Build
        Major := HiWord(VerValue.dwFileVersionMS);
        Minor := LoWord(VerValue.dwFileVersionMS);
        //Release := HiWord(VerValue.dwFileVersionLS);
        //Build := LoWord(VerValue.dwFileVersionLS);

        // Formata a string da vers�o
        Result := Format('%d.%d', [Major, Minor{, Release, Build}]);
      end
      else
        Result := 'Erro ao obter a vers�o';
    end
    else
      Result := 'Erro ao obter a vers�o';
  finally
    // Libera a mem�ria alocada
    FreeMem(VerInfo, InfoSize);
  end;
end;


end.
