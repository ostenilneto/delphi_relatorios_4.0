unit VendedorUnit;

interface

uses
  System.Generics.Collections, System.SysUtils;

type
  TVendedor = class
  private
    FNome: String;
    FAtendimentos, FAtivos, FReceptivos, FLeads, FVendasPerdidas, FVendas, FVendaLoja, FVendaDireta: Integer;
    FFotoPath: String;
  public
    constructor Create(const Nome: String; Atendimentos, Ativos, Receptivos, Leads, VendasPerdidas, Vendas, VendaLoja, VendaDireta: Integer; const FotoPath: String);
    property Nome: String read FNome write FNome;
    property Atendimentos: Integer read FAtendimentos write FAtendimentos;
    property Ativos: Integer read FAtivos write FAtivos;
    property Receptivos: Integer read FReceptivos write FReceptivos;
    property Leads: Integer read FLeads write FLeads;
    property VendasPerdidas: Integer read FVendasPerdidas write FVendasPerdidas;
    property Vendas: Integer read FVendas write FVendas;
    property VendaLoja: Integer read FVendaLoja write FVendaLoja;
    property VendaDireta: Integer read FVendaDireta write FVendaDireta;
    property FotoPath: String read FFotoPath write FFotoPath;
  end;

implementation

constructor TVendedor.Create(const Nome: String; Atendimentos, Ativos, Receptivos, Leads, VendasPerdidas, Vendas, VendaLoja, VendaDireta: Integer; const FotoPath: String);
begin
  FNome := Nome;
  FVendas := Vendas;
  FAtendimentos := Atendimentos;
  FAtivos := Ativos;
  FReceptivos := Receptivos;
  FLeads := Leads;
  FVendasPerdidas := VendasPerdidas;
  FVendas := Vendas;
  FVendaLoja := VendaLoja;
  FVendaDireta := VendaDireta;
  FFotoPath := FotoPath;
end;


end.
