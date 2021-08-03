unit uEstoqueClasse;

interface

type
  TEstoque = class
  private
    Fcodigo: Integer;
    Fdescricao: string;
    Fqtd: double;
    FpVenda: Double;

  public
    property codigo: Integer read Fcodigo write Fcodigo;
    property descricao: string read Fdescricao write Fdescricao;
    property qtd: double read Fqtd write Fqtd;
    property pVenda: Double read FpVenda write FpVenda;
  end;

implementation

{ TEstoque }

end.
