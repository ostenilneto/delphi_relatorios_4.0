unit PainelVendas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons,
  System.Generics.Collections, Vcl.Imaging.jpeg, VendedorUnit, DateUtils, Vcl.Styles, Vcl.Themes,
  Vcl.ComCtrls, Data.DB, FireDAC.Comp.Client;

type
  TFrmPainelVendas = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    BtnSair: TBitBtn;
    ScrollBoxVendedores: TScrollBox;
    Timer1: TTimer;
    ProgressBar1: TProgressBar;
    DataSource1: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure ExibirVendedores(Vendedores: TList<TVendedor>);
    procedure BtnSairClick(Sender: TObject);
    procedure vendedor(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure ConfigurarDataset(Dataset: TFDQuery; inicio, fim: TDate);
    procedure PreencherListaVendedores(Dataset: TDataSet; Vendedores: TList<TVendedor>);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPainelVendas: TFrmPainelVendas;

implementation

{$R *.dfm}

uses DmRel;

//uses VendedorUnit;

 procedure TFrmPainelVendas.BtnSairClick(Sender: TObject);
begin
  FrmPainelVendas.Close;
end;

procedure TFrmPainelVendas.ExibirVendedores(Vendedores: TList<TVendedor>);
var
  i, Row, Col: Integer;
  VendedorPanel, RiscoPanel1, RiscoPanel2: TPanel;
  NomeLabel, AtendimentosLabel, AtivosLabel, ReceptivosLabel, LeadsLabel, VendasPerdidasLabel, VendasLabel, VendaLojaLabel, VendaDiretaLabel: TLabel;
  FotoVendedor: TImage;
  LeftPosition: Integer;
  PanelWidth, PanelHeight: Integer;
begin
  // Limpar os componentes antigos antes de recriar
  for i := ScrollBoxVendedores.ControlCount - 1 downto 0 do
  begin
    ScrollBoxVendedores.Controls[i].Free;
  end;

  // Definindo a largura e altura dos pain�is
  PanelWidth := 255;  // Largura de cada painel
  PanelHeight := 310; // Altura de cada painel

  for i := 0 to Vendedores.Count - 1 do
  begin
    // Calcular a linha e a coluna
    Row := i div 5;  // 5 registros por linha
    Col := i mod 5;  // Coluna atual (0 a 5)

    // Criar um painel para cada vendedor
    VendedorPanel := TPanel.Create(ScrollBoxVendedores);
    if Assigned(VendedorPanel) then
    begin
      if i < 5 then
      begin
        VendedorPanel.Parent := ScrollBoxVendedores;
        VendedorPanel.ParentBackground := False; // Desativa o fundo do pai
        VendedorPanel.Width := PanelWidth;
        VendedorPanel.Height := PanelHeight;
        VendedorPanel.Left := Col * PanelWidth + 15 * (Col + 1);
        VendedorPanel.Top := Row * PanelHeight + 10;
        VendedorPanel.BevelOuter := bvNone; // Remove a borda padr�o
        VendedorPanel.BorderStyle := bsSingle;
        end
      else
      begin
        VendedorPanel.Parent := ScrollBoxVendedores;
        VendedorPanel.ParentBackground := False; // Desativa o fundo do pai
        VendedorPanel.Width := PanelWidth;
        VendedorPanel.Height := PanelHeight;
        VendedorPanel.Left := Col * PanelWidth + 15 * (Col + 1);
        VendedorPanel.Top := Row * PanelHeight + 10 * (Row + 1);
        VendedorPanel.BevelOuter := bvRaised; // Remove a borda padr�o
        VendedorPanel.BorderStyle := bsSingle;
      end;
    end;

        // Criar TImage para a foto do vendedor
    FotoVendedor := TImage.Create(VendedorPanel);
    if Assigned(FotoVendedor) then
    begin
      FotoVendedor.Parent := VendedorPanel;
      FotoVendedor.Left := ((VendedorPanel.Width - FotoVendedor.Width) div 2); // Centraliza horizontalmente;
      FotoVendedor.Top := 10;
      FotoVendedor.Width := 50;
      FotoVendedor.Height := 50;
      FotoVendedor.Stretch := True; // Ajusta a imagem ao tamanho definido
      FotoVendedor.Proportional := True;
      FotoVendedor.Align := AlTop;
      FotoVendedor.Center := True;
    end;

    // Criar Label para o Nome do Vendedor
    NomeLabel := TLabel.Create(VendedorPanel);
    if Assigned(NomeLabel) then
    begin
      NomeLabel.Parent := VendedorPanel;
      NomeLabel.Caption := Vendedores[i].Nome;
      NomeLabel.Left := ((NomeLabel.Width - VendedorPanel.Width) div 2);
      NomeLabel.Top := 50;
      NomeLabel.Font.Size := 20;
      NomeLabel.Font.Style := [fsBold];
      NomeLabel.Align := AlTop;
      NomeLabel.Alignment := taCenter;
    end;

    // Criar Label para o Total de Atendimentos
    AtendimentosLabel := TLabel.Create(VendedorPanel);
    if Assigned(AtendimentosLabel) then
    begin
      AtendimentosLabel.Parent := VendedorPanel;
      AtendimentosLabel.Caption := 'Atendimentos: ' + IntToStr(Vendedores[i].Atendimentos);
      AtendimentosLabel.Left := 10;
      AtendimentosLabel.Top := 110;
      AtendimentosLabel.Font.Size := 12;
    end;

        // Criar Label para o Total de Atendimentos - Ativos
    AtivosLabel := TLabel.Create(VendedorPanel);
    if Assigned(AtivosLabel) then
    begin
      AtivosLabel.Parent := VendedorPanel;
      AtivosLabel.Caption := 'Ativos: ' + IntToStr(Vendedores[i].Ativos);
      AtivosLabel.Left := VendedorPanel.Width - AtivosLabel.Width - 10;
      AtivosLabel.Alignment := taRightJustify;
      AtivosLabel.Top := 125;
      AtivosLabel.Font.Size := 12;
    end;

        // Criar Label para o Total de Atendimentos - Receptivos
    ReceptivosLabel := TLabel.Create(VendedorPanel);
    if Assigned(ReceptivosLabel) then
    begin
      ReceptivosLabel.Parent := VendedorPanel;
      ReceptivosLabel.Caption := 'Receptivos: ' + IntToStr(Vendedores[i].Receptivos);
      ReceptivosLabel.Left := VendedorPanel.Width - ReceptivosLabel.Width - 10;
      ReceptivosLabel.Alignment := taRightJustify;
      ReceptivosLabel.Top := 140;
      ReceptivosLabel.Font.Size := 12;
    end;

    RiscoPanel1 := TPanel.Create(VendedorPanel);
    if Assigned(RiscoPanel1) then
    begin
      RiscoPanel1.Caption := '';          // Sem texto
      RiscoPanel1.Top := 165;
      RiscoPanel1.Height := 2;            // Altura m�nima para parecer uma linha
      RiscoPanel1.Width := 240;           // Defina o comprimento desejado
      RiscoPanel1.Parent := VendedorPanel;
      RiscoPanel1.Color := clBlack;
      RiscoPanel1.Left := (VendedorPanel.Width div 2) - (RiscoPanel1.Width div 2);
    end;

        // Criar Label para o Total de LeadsLabel,
    LeadsLabel := TLabel.Create(VendedorPanel);
    if Assigned(LeadsLabel) then
    begin
      LeadsLabel.Parent := VendedorPanel;
      LeadsLabel.Caption := 'Leads: ' + IntToStr(Vendedores[i].Leads);
      LeadsLabel.Left := 10;
      LeadsLabel.Top := 170;
      LeadsLabel.Font.Size := 12;
    end;

        // Criar Label para o Total de Vendas Perdidas
    VendasPerdidasLabel := TLabel.Create(VendedorPanel);
    if Assigned(VendasPerdidasLabel) then
    begin
      VendasPerdidasLabel.Parent := VendedorPanel;
      VendasPerdidasLabel.Caption := 'Vendas Perdidas: ' + IntToStr(Vendedores[i].VendasPerdidas);
      VendasPerdidasLabel.Left := 10;
      VendasPerdidasLabel.Top := 190;
      VendasPerdidasLabel.Font.Size := 12;
    end;

    RiscoPanel2 := TPanel.Create(VendedorPanel);
    if Assigned(RiscoPanel2) then
    begin
      RiscoPanel2.Caption := '';          // Sem texto
      RiscoPanel2.Top := 215;
      RiscoPanel2.Height := 2;            // Altura m�nima para parecer uma linha
      RiscoPanel2.Width := 240;           // Defina o comprimento desejado
      RiscoPanel2.Parent := VendedorPanel;
      RiscoPanel2.Color := clBlack;
      RiscoPanel2.Left := (VendedorPanel.Width div 2) - (RiscoPanel2.Width div 2);
    end;

        // Criar Label para o Total de Vendas
    VendasLabel := TLabel.Create(VendedorPanel);
    if Assigned(VendasLabel) then
    begin
      VendasLabel.Parent := VendedorPanel;
      VendasLabel.Caption := 'Vendas: ' + IntToStr(Vendedores[i].Vendas);
      VendasLabel.Left := 10;
      VendasLabel.Top := 220;
      VendasLabel.Font.Size := 12;
    end;

        // Criar Label para o Total de Vendas Loja
    VendaLojaLabel := TLabel.Create(VendedorPanel);
    if Assigned(VendaLojaLabel) then
    begin
      VendaLojaLabel.Parent := VendedorPanel;
      VendaLojaLabel.Caption := 'Venda Loja: ' + IntToStr(Vendedores[i].VendaLoja);
      VendaLojaLabel.Left := VendedorPanel.Width - VendaLojaLabel.Width - 10;
      VendaLojaLabel.Alignment := taRightJustify;
      VendaLojaLabel.Top := 235;
      VendaLojaLabel.Font.Size := 12;
    end;

        // Criar Label para o Total de Vendas Direta
    VendaDiretaLabel := TLabel.Create(VendedorPanel);
    if Assigned(VendaDiretaLabel) then
    begin
      VendaDiretaLabel.Parent := VendedorPanel;
      VendaDiretaLabel.Caption := 'Venda Direta: ' + IntToStr(Vendedores[i].VendaDireta);
      VendaDiretaLabel.Left := VendedorPanel.Width - VendaDiretaLabel.Width - 10;
      VendaDiretaLabel.Alignment := taRightJustify;
      VendaDiretaLabel.Top := 250;
      VendaDiretaLabel.Font.Size := 12;
    end;



    // Carregar a foto do vendedor, se existir
    if FileExists(Vendedores[i].FotoPath) then
      try
        FotoVendedor.Picture.LoadFromFile(Vendedores[i].FotoPath);
      except
        on E: Exception do
          FotoVendedor.Picture := nil; // Caso ocorra erro, n�o carrega a imagem
      end
    else
      FotoVendedor.Picture := nil; // Sem imagem dispon�vel

    ScrollBoxVendedores.Height := ((Vendedores.Count div 6) + 1) * PanelHeight;
    // Atualizar a posi��o para o pr�ximo painel
    //LeftPosition := LeftPosition + VendedorPanel.Width + 10;
  end;
end;

procedure TFrmPainelVendas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Timer1.Enabled := False;
end;

procedure TFrmPainelVendas.FormCreate(Sender: TObject);
begin
  TStyleManager.SetStyle('Windows');
end;

procedure TFrmPainelVendas.FormShow(Sender: TObject);
begin
  vendedor(Sender);

  ProgressBar1.Max := 400;
  ProgressBar1.Position := 0;
  Timer1.Interval := 50;
  //Panel1.Caption := 'Ve�culos Usados';
  Timer1.Enabled := True;
end;

procedure TFrmPainelVendas.Timer1Timer(Sender: TObject);
begin
  if ProgressBar1.Position < ProgressBar1.Max then
  begin
    ProgressBar1.Position := ProgressBar1.Position + 1;
  end
  else
  begin
    ProgressBar1.Position := 0;
    vendedor(Sender);
  end;

end;

procedure TFrmPainelVendas.vendedor(Sender: TObject);
var
  Vendedores: TList<TVendedor>;
  inicio, fim: TDate;
begin
  inicio := StartOfTheMonth(now);
  fim := EndOfTheMonth(now);
  Vendedores := TList<TVendedor>.Create;
  try
    if Panel1.Caption = 'Ve�culos Novos' then
    begin
      DataSource1.DataSet := DataModule1.QryPainelVendasVU;
      Panel1.Caption := 'Ve�culos Usados';
      ConfigurarDataset(DataModule1.QryPainelVendasVU, inicio, fim);
      PreencherListaVendedores(DataModule1.QryPainelVendasVU, Vendedores);
    end
    else
    begin
      DataSource1.DataSet := DataModule1.QryPainelVendasVN;
      Panel1.Caption := 'Ve�culos Novos';
      ConfigurarDataset(DataModule1.QryPainelVendasVN, inicio, fim);
      PreencherListaVendedores(DataModule1.QryPainelVendasVN, Vendedores);
    end;

    // Exibir os vendedores no dashboard
    ExibirVendedores(Vendedores);

  finally
    // Liberar os objetos Vendedor
    for var Vendedor in Vendedores do
      Vendedor.Free;
    Vendedores.Free;
  end;
end;

procedure TFrmPainelVendas.ConfigurarDataset(Dataset: TFDQuery; inicio, fim: TDate);
var
  i: Integer;
begin
  Dataset.Close;
  for i := 0 to 10 do
  begin
    Dataset.ParamByName('inicio' + i.ToString).Value := DateToStr(inicio);
    Dataset.ParamByName('fim' + i.ToString).Value := DateToStr(fim);
  end;
  Dataset.Open;
end;


procedure TFrmPainelVendas.PreencherListaVendedores(Dataset: TDataSet; Vendedores: TList<TVendedor>);
var
  Nome: String;
  Atendimentos, Ativos, Receptivos, Leads, VendasPerdidas, Vendas, VendaLoja, VendaDireta: Integer;
begin
  while not Dataset.Eof do
  begin
    Nome := Dataset.FieldByName('Vendedor').AsString;
    Atendimentos := Dataset.FieldByName('Total Atendimentos').AsInteger;
    Ativos := Dataset.FieldByName('Ativos').AsInteger;
    Receptivos := Dataset.FieldByName('Receptivos').AsInteger;
    Leads := Dataset.FieldByName('Lead').AsInteger;
    VendasPerdidas := Dataset.FieldByName('Vendas Perdidas').AsInteger;
    Vendas := Dataset.FieldByName('Total Vendas').AsInteger;
    VendaLoja := Dataset.FieldByName('Venda Loja').AsInteger;
    VendaDireta := Dataset.FieldByName('Venda Direta').AsInteger;
    Vendedores.Add(TVendedor.Create(Nome, Atendimentos, Ativos, Receptivos, Leads, VendasPerdidas, Vendas, VendaLoja, VendaDireta, 'C:\On_Distrive\images\CRM.png'));
    Dataset.Next;
  end;
end;


end.
