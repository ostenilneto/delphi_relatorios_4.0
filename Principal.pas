unit Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.ExtCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.VCLUI.Wait, Vcl.Buttons, Data.DB, FireDAC.Comp.Client,
  Vcl.Imaging.jpeg, Vcl.ComCtrls, StdCtrls, Grids, DBGrids, ADODB,ComObj, Mask,
  OleServer, ExcelXP, DBCtrls, Vcl.Imaging.pngimage, Vcl.Themes, Vcl.Styles,
  System.ImageList, Vcl.ImgList;

type
  TMenu_pri = class(TForm)
    MainMenu1: TMainMenu;
    Administrativo: TMenuItem;
    Veículos: TMenuItem;
    PosVendas: TMenuItem;
    TI: TMenuItem;
    Financeiro: TMenuItem;
    FiscalContabil: TMenuItem;
    Atendimentos: TMenuItem;
    AcoesCRM: TMenuItem;
    Leads: TMenuItem;
    VendasPerdidas: TMenuItem;
    Estatisticas: TMenuItem;
    PainelVendas: TMenuItem;
    Faturamentos: TMenuItem;
    NFDifal: TMenuItem;
    ICMSST: TMenuItem;
    Obsoleto: TMenuItem;
    Arquivo: TMenuItem;
    Sobre: TMenuItem;
    NotasVersao: TMenuItem;
    Sair: TMenuItem;
    Panel1: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton10: TSpeedButton;
    SpeedButton8: TSpeedButton;
    SpeedButton7: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SpeedButton11: TSpeedButton;
    Image1: TImage;
    Panel7: TPanel;
    Panel10: TPanel;
    Panel8: TPanel;
    Panel3: TPanel;
    Panel9: TPanel;
    Panel11: TPanel;
    Panel6: TPanel;
    Timer1: TTimer;
    Panel5: TPanel;
    SpeedButton5: TSpeedButton;
    Panel4: TPanel;
    SpeedButton3: TSpeedButton;
    Panel2: TPanel;
    SpeedButton2: TSpeedButton;
    Amaro: TMenuItem;
    N1: TMenuItem;
    Clientes: TMenuItem;
    SpeedButton4: TSpeedButton;
    Panel12: TPanel;
    Panel13: TPanel;
    SpeedButton12: TSpeedButton;
    PisCofinsCst: TMenuItem;
    StatusBar1: TStatusBar;
    SpeedButton9: TSpeedButton;
    Panel14: TPanel;
    SpeedButton13: TSpeedButton;
    Panel15: TPanel;
    PlacarFeiro1: TMenuItem;
    BuscareCopiarXML1: TMenuItem;
    ImageList1: TImageList;
    procedure Timer1Timer(Sender: TObject);
    procedure NFDifalClick(Sender: TObject);
    procedure AmaroClick(Sender: TObject);
    procedure FaturamentosClick(Sender: TObject);
    procedure ObsoletoClick(Sender: TObject);
    procedure ClientesClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SairClick(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure VendasPerdidasClick(Sender: TObject);
    procedure LeadsClick(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
    procedure SpeedButton12Click(Sender: TObject);
    procedure SobreClick(Sender: TObject);
    procedure BuscareCopiarXML1Click(Sender: TObject);
    procedure PlacarFeiro1Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure AtendimentosClick(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure ICMSSTClick(Sender: TObject);
    procedure SpeedButton10Click(Sender: TObject);
    procedure AcoesCRMClick(Sender: TObject);
    procedure SpeedButton11Click(Sender: TObject);
    procedure EstatisticasClick(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure PisCofinsCstClick(Sender: TObject);
    procedure SpeedButton13Click(Sender: TObject);
    procedure NotasVersaoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure PainelVendasClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Menu_pri: TMenu_pri;

implementation

{$R *.dfm}

uses Amaro, NFDifal, VeicFaturados, Obsoleto, FinanceiroClientes, DmRel,
  VeicVendPerdidas, VeicLeads, Sobre, CopiaXML, Placar, VeicFluxoLoja, ICMSST,
  AcoesCRM, Estatisticas, PisCofinsCons, PainelVendas, Versao;

procedure FreeAndNil(var Obj);
var
  Temp: TObject;
begin
  Temp := TObject(Obj);
  Pointer(Obj) := nil;
  Temp.Free;
end;

procedure TMenu_pri.AcoesCRMClick(Sender: TObject);
begin
    try
    FrmVeicCRM.ShowModal;
  finally
    FrmVeicCRM.BtnSair.Click;
  end;
end;

procedure TMenu_pri.AmaroClick(Sender: TObject);
begin
  try
    FrmAmaro.ShowModal;
  finally
    FrmAmaro.BtnSair.Click;
  end;
end;

procedure TMenu_pri.AtendimentosClick(Sender: TObject);
begin
  try
    FrmFluxoLoja.ShowModal;
  finally
    FrmFluxoLoja.BtnSair.Click;
  end;
end;

procedure TMenu_pri.BuscareCopiarXML1Click(Sender: TObject);
begin
  try
    FrmCopiaXML.ShowModal;
  finally
    FrmCopiaXML.BtnSair.Click;
  end;
end;

procedure TMenu_pri.ClientesClick(Sender: TObject);
begin
  try
    FrmFinanceiroClientes.ShowModal;
  finally
    FrmFinanceiroClientes.BtnSair.Click;
  end;
end;

procedure TMenu_pri.EstatisticasClick(Sender: TObject);
begin
  try
    FrmEstatisticas.ShowModal;
  finally
    FrmEstatisticas.BtnSair.Click;
  end;
end;

procedure TMenu_pri.FaturamentosClick(Sender: TObject);
begin
  try
    FrmVeicFaturados.ShowModal;
  finally
    FrmVeicFaturados.BtnSair.Click;
  end;
end;

procedure TMenu_pri.FormCreate(Sender: TObject);
begin
  // Associa a lista de imagens ao menu
  MainMenu1.Images := ImageList1;


  // Define o índice da imagem para cada item do menu
  //Sair.ImageIndex := 0;  // Ícone de "Abrir"
  //MenuItem2.ImageIndex := 1;  // Ícone de "Salvar"
end;

procedure TMenu_pri.ICMSSTClick(Sender: TObject);
begin
  try
    FrmIcmsST.ShowModal;
  finally
    FrmIcmsST.BtnSair.Click;
  end;
end;

procedure TMenu_pri.LeadsClick(Sender: TObject);
begin
  try
    FrmVeicLeads.ShowModal;
  finally
    FrmVeicLeads.BtnSair.Click;
  end;
end;

procedure TMenu_pri.NFDifalClick(Sender: TObject);
begin
  try
    FrmNFDifal.ShowModal;
  finally
    FrmNFDifal.BtnSair.Click;
  end;
end;

procedure TMenu_pri.NotasVersaoClick(Sender: TObject);
begin
  try
    FrmVersao.ShowModal;
  finally
    FrmVersao.BtnSair.Click;
  end;

end;

procedure TMenu_pri.ObsoletoClick(Sender: TObject);
begin
  try
    FrmObsoleto.ShowModal;
  finally
    FrmObsoleto.BtnSair.Click;
  end;
end;

procedure TMenu_pri.PainelVendasClick(Sender: TObject);
begin
  try
    FrmPainelVendas.ShowModal;
  finally
    FrmPainelVendas.BtnSair.Click;
  end;
end;

procedure TMenu_pri.PisCofinsCstClick(Sender: TObject);
begin
  try
    FrmPisCofinsCons.ShowModal;
  finally
    FrmPisCofinsCons.BtnSair.Click;
  end;
end;

procedure TMenu_pri.PlacarFeiro1Click(Sender: TObject);
begin
  FrmPlacar.ShowModal;
end;

procedure TMenu_pri.SairClick(Sender: TObject);
begin
  Menu_pri.Close;
end;

procedure TMenu_pri.SobreClick(Sender: TObject);
begin
    try
    FrmSobre.ShowModal;
  finally
    FrmSobre.BtnSair.Click;
  end;
end;

procedure TMenu_pri.SpeedButton10Click(Sender: TObject);
begin
  try
    FrmVeicCRM.ShowModal;
  finally
    FrmVeicCRM.BtnSair.Click;
  end;
end;

procedure TMenu_pri.SpeedButton11Click(Sender: TObject);
begin
  try
    FrmEstatisticas.ShowModal;
  finally
    FrmEstatisticas.BtnSair.Click;
  end;
end;

procedure TMenu_pri.SpeedButton12Click(Sender: TObject);
begin
  Menu_pri.Close;
end;

procedure TMenu_pri.SpeedButton13Click(Sender: TObject);
begin
  try
    FrmPainelVendas.ShowModal;
  finally
    FrmPainelVendas.BtnSair.Click;
  end;
end;

procedure TMenu_pri.SpeedButton1Click(Sender: TObject);
begin
  try
    FrmFinanceiroClientes.ShowModal;
  finally
    FrmFinanceiroClientes.BtnSair.Click;
  end;
end;

procedure TMenu_pri.SpeedButton2Click(Sender: TObject);
begin
  try
    FrmIcmsST.ShowModal;
  finally
    FrmIcmsST.BtnSair.Click;
  end;
end;

procedure TMenu_pri.SpeedButton3Click(Sender: TObject);
begin
  try
    FrmNFDifal.ShowModal;
  finally
    FrmNFDifal.BtnSair.Click;
  end;
end;

procedure TMenu_pri.SpeedButton4Click(Sender: TObject);
begin
  try
    FrmPisCofinsCons.ShowModal;
  finally
    FrmPisCofinsCons.BtnSair.Click;
  end;

end;

procedure TMenu_pri.SpeedButton5Click(Sender: TObject);
begin
  try
    FrmObsoleto.ShowModal;
  finally
    FrmObsoleto.BtnSair.Click;
  end;
end;

procedure TMenu_pri.SpeedButton6Click(Sender: TObject);
begin
  try
    FrmVeicFaturados.ShowModal;
  finally
    FrmVeicFaturados.BtnSair.Click;
  end;
end;

procedure TMenu_pri.SpeedButton7Click(Sender: TObject);
begin
  try
    FrmFluxoLoja.ShowModal;
  finally
    FrmFluxoLoja.BtnSair.Click;
  end;
end;

procedure TMenu_pri.SpeedButton8Click(Sender: TObject);
begin
  try
    FrmVeicVendPerdidas.ShowModal;
  finally
    FrmVeicVendPerdidas.BtnSair.Click;
  end;

end;

procedure TMenu_pri.SpeedButton9Click(Sender: TObject);
begin
  try
    FrmVeicLeads.ShowModal;
  finally
    FrmVeicLeads.BtnSair.Click;
  end;
end;

procedure TMenu_pri.Timer1Timer(Sender: TObject);
begin
  Menu_Pri.StatusBar1.Panels [0].Text := ' '+datetostr(date);// para data
  Menu_Pri.StatusBar1.Panels [1].Text := ' '+timetostr(now);//para hora
end;

procedure TMenu_pri.VendasPerdidasClick(Sender: TObject);
begin
  try
    FrmVeicVendPerdidas.ShowModal;
  finally
    FrmVeicVendPerdidas.BtnSair.Click;
  end;

end;

end.
