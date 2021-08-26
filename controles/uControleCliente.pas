unit uControleCliente;

interface
uses
  uControle, uCliente, System.Generics.Collections, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, uConexao;

type
  TControleCliente = class(TControle)
  private
  public
    function getClientesQry(): TFDQuery;
  end;


implementation

{ TControleCliente }

function TControleCliente.getClientesQry: TFDQuery;
var
  Sqr: TFDQuery;
begin
  Sqr := TFDQuery.Create(nil);
  Sqr.Connection := conexao.cn;
  Sqr.Open('select * from cliente');
  Result := Sqr;

end;

end.
