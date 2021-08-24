unit uControleVendedor;

interface

uses
  uControle, uVendedor, System.Generics.Collections, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, uConexao;

type
  TControleVendedor = class(TControle)
  private
  public
    function getVendedores(): TList<TVendedor>;
    function getVendedoresQry(): TFDQuery;
  end;

var
  controleVendedor: TControleVendedor;

implementation

{ TControleVendedor }

function TControleVendedor.getVendedores: TList<TVendedor>;
begin
  //
end;

function TControleVendedor.getVendedoresQry: TFDQuery;
var
  Sqr: TFDQuery;
begin
  Sqr := TFDQuery.Create(nil);
  Sqr.Connection := conexao.cn;

  Sqr.Open('select * from vendedor');

  RESULT := Sqr;

end;

end.

