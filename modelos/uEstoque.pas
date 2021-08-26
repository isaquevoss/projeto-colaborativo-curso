unit uEstoque;

interface

uses
  uModelo;

type
  TEstoque = class(TModelo)
    private
    Fcodigo: Integer;
    Fdescricao: string;
    Fqtd: Double;
    FpVenda: Double;

    public
      property codigo: Integer read Fcodigo write Fcodigo;
      property descricao: string read Fdescricao write Fdescricao;
      property qtd: Double read Fqtd write Fqtd;
      property pVenda: Double read FpVenda write FpVenda;

  end;
implementation

end.
