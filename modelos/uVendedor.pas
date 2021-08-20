unit uVendedor;

interface

uses
  uModelo;

type
  TVendedor = class(TModelo)
    FpComissaoAPrazo: Double;
    FpDescontoMaximo: Double;
    Fcodigo: integer;
    FpComissaoAVista: Double;
    Fnome: string;
  public
    property codigo: integer read Fcodigo write Fcodigo;
    property nome: string read Fnome write Fnome;
    property pComissaoAVista: Double read FpComissaoAVista write FpComissaoAVista;
    property pComissaoAPrazo: Double read FpComissaoAPrazo write FpComissaoAPrazo;
    property pDescontoMaximo: Double read FpDescontoMaximo write FpDescontoMaximo;
  end;

implementation

end.

