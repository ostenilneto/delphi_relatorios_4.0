unit DmRel;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.ODBC,
  FireDAC.Phys.ODBCDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, FireDAC.Phys.Oracle, FireDAC.Phys.OracleDef, DBGrids;

type
  TDataModule1 = class(TDataModule)
    Bravos: TFDConnection;
    QryAmaro: TFDQuery;
    DtsAmaro: TDataSource;
    QryNFDifal_P: TFDQuery;
    DtsNFDifal_P: TDataSource;
    QryNFDifal_S: TFDQuery;
    DtsNFDifal_S: TDataSource;
    QryNFDifal_V: TFDQuery;
    DtsNFDifal_V: TDataSource;
    QryCad_Vendedor: TFDQuery;
    DtsVFatur: TDataSource;
    QryVFatur_mes: TFDQuery;
    DtsCad_Vendedor: TDataSource;
    QryVFatur: TFDQuery;
    DtsVFatur_mes: TDataSource;
    DtsObsoleto: TDataSource;
    QryObsoleto: TFDQuery;
    DtsClientes1: TDataSource;
    QryClientes1: TFDQuery;
    DtsClientes2: TDataSource;
    QryClientes2: TFDQuery;
    DtsClientes3: TDataSource;
    QryClientes3: TFDQuery;
    DtsClientes4: TDataSource;
    QryClientes4: TFDQuery;
    QryVVendPerd: TFDQuery;
    DtsVVendPerd: TDataSource;
    QryVVendPerd_mes_nov: TFDQuery;
    DtsVVendPerd_mes: TDataSource;
    QryVVendPerd_mes_usa: TFDQuery;
    DtsLeads: TDataSource;
    QryLeads: TFDQuery;
    QryLeads_vendedor: TFDQuery;
    DtsOrigem_Trafego: TDataSource;
    QryOrigem_Trafego: TFDQuery;
    DtsLeads_: TDataSource;
    QryLeads_origem: TFDQuery;
    DtsVAtendimentos_mes: TDataSource;
    QryVAtendimentos_mes_nov: TFDQuery;
    QryVAtendimentos_mes_usa: TFDQuery;
    DtsVAtendimentos: TDataSource;
    QryVAtendimentos: TFDQuery;
    DtsIcmsST: TDataSource;
    QryIcmsST: TFDQuery;
    DtsVeicFamilia: TDataSource;
    QryVeicFamilia: TFDQuery;
    DtsCRM: TDataSource;
    QryAnivers: TFDQuery;
    QryCRMVeic: TFDQuery;
    QryCRMVeicModelo: TFDQuery;
    DtsDepVeic: TDataSource;
    QryDepVeic: TFDQuery;
    DtsEstAtendimento: TDataSource;
    QryEstAtendimento_VN: TFDQuery;
    QryEstAtendimento_VU: TFDQuery;
    DtsEstVendPerdida: TDataSource;
    QryEstVendPerdida_VN: TFDQuery;
    QryEstVendPerdida_VU: TFDQuery;
    DtsEstFaturamento: TDataSource;
    QryEstFaturamento_VN: TFDQuery;
    QryEstFaturamento_VU: TFDQuery;
    DtsEstEstatistica: TDataSource;
    QryEstEstatistica_VN: TFDQuery;
    QryEstEstatistica_VU: TFDQuery;
    DtsEstTotal: TDataSource;
    QryEstTotal: TFDQuery;
    DtsEstVendRealiz: TDataSource;
    QryEstVendRealiz: TFDQuery;
    DtsEstVendPerdid: TDataSource;
    QryEstVendPerdid: TFDQuery;
    DtsEstAtivos: TDataSource;
    QryEstAtivos: TFDQuery;
    DtsEstReceptivos: TDataSource;
    QryEstReceptivos: TFDQuery;
    QryEstTotalTOTAL: TFMTBCDField;
    QryEstVendRealizTotal: TFMTBCDField;
    QryEstVendPerdidTOTAL: TFMTBCDField;
    QryEstAtivosTOTAL: TFMTBCDField;
    QryEstReceptivosTOTAL: TFMTBCDField;
    DtsPainelVendasVU: TDataSource;
    QryPainelVendasVU: TFDQuery;
    DtsPainelVendasVN: TDataSource;
    QryPainelVendasVN: TFDQuery;
    QryPainelVendasVNVendedor: TStringField;
    QryPainelVendasVNTotalAtendimentos: TFMTBCDField;
    QryPainelVendasVNAtivos: TFMTBCDField;
    QryPainelVendasVNReceptivos: TFMTBCDField;
    QryPainelVendasVNShowroom: TFMTBCDField;
    QryPainelVendasVNTelefone: TFMTBCDField;
    QryPainelVendasVNLead: TFMTBCDField;
    QryPainelVendasVNTotalVendas: TFMTBCDField;
    QryPainelVendasVNVendaLoja: TFMTBCDField;
    QryPainelVendasVNVendaDireta: TFMTBCDField;
    QryPainelVendasVNVendasPerdidas: TFMTBCDField;
    QryCad_VendedorUSUARIO: TBCDField;
    QryCad_VendedorNOME: TStringField;

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModule1: TDataModule1;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}


end.
