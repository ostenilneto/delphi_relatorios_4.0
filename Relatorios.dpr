program Relatorios;

uses
  Vcl.Forms,
  Principal in 'Principal.pas' {Menu_pri},
  DmRel in 'DmRel.pas' {DataModule1: TDataModule},
  Amaro in 'Amaro.pas' {FrmAmaro},
  NFDifal in 'NFDifal.pas' {FrmNFDifal},
  VeicFaturados in 'VeicFaturados.pas' {FrmVeicFaturados},
  Obsoleto in 'Obsoleto.pas' {FrmObsoleto},
  FinanceiroClientes in 'FinanceiroClientes.pas' {FrmFinanceiroClientes},
  VeicVendPerdidas in 'VeicVendPerdidas.pas' {FrmVeicVendPerdidas},
  VeicLeads in 'VeicLeads.pas' {FrmVeicLeads},
  Vcl.Themes,
  Vcl.Styles,
  Sobre in 'Sobre.pas' {FrmSobre},
  CopiaXML in 'CopiaXML.pas' {FrmCopiaXML},
  Placar in 'Placar.pas' {FrmPlacar},
  VeicFluxoLoja in 'VeicFluxoLoja.pas' {FrmFluxoLoja},
  ICMSST in 'ICMSST.pas' {FrmIcmsST},
  AcoesCRM in 'AcoesCRM.pas' {FrmVeicCRM},
  Estatisticas in 'Estatisticas.pas' {FrmEstatisticas},
  PisCofinsCons in 'PisCofinsCons.pas' {FrmPisCofinsCons},
  VendedorUnit in 'VendedorUnit.pas',
  PainelVendas in 'PainelVendas.pas' {FrmPainelVendas},
  Versao in 'Versao.pas' {FrmVersao};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Amethyst Kamri');
  Application.CreateForm(TMenu_pri, Menu_pri);
  Application.CreateForm(TDataModule1, DataModule1);
  Application.CreateForm(TFrmAmaro, FrmAmaro);
  Application.CreateForm(TFrmNFDifal, FrmNFDifal);
  Application.CreateForm(TFrmVeicFaturados, FrmVeicFaturados);
  Application.CreateForm(TFrmObsoleto, FrmObsoleto);
  Application.CreateForm(TFrmFinanceiroClientes, FrmFinanceiroClientes);
  Application.CreateForm(TFrmVeicVendPerdidas, FrmVeicVendPerdidas);
  Application.CreateForm(TFrmVeicLeads, FrmVeicLeads);
  Application.CreateForm(TFrmSobre, FrmSobre);
  Application.CreateForm(TFrmCopiaXML, FrmCopiaXML);
  Application.CreateForm(TFrmPlacar, FrmPlacar);
  Application.CreateForm(TFrmFluxoLoja, FrmFluxoLoja);
  Application.CreateForm(TFrmIcmsST, FrmIcmsST);
  Application.CreateForm(TFrmVeicCRM, FrmVeicCRM);
  Application.CreateForm(TFrmEstatisticas, FrmEstatisticas);
  Application.CreateForm(TFrmPisCofinsCons, FrmPisCofinsCons);
  Application.CreateForm(TFrmVersao, FrmVersao);
  Application.CreateForm(TFrmPainelVendas, FrmPainelVendas);
  Application.Run;
end.
