unit uControleTransportadora;

interface
  uses
  uControle,uTransportadora, System.Classes, System.Generics.Collections,uConexao,
  FireDAC.Comp.Client;

  type
    TControleTransportadora = class(TControle)
      private
      public
        function getTransportadora() : TList<TTransportadora>;
        function getTransportadoraQry() : TFDQuery;

    end;

  var
    controleTransportadora : TControleTransportadora;

implementation


{ TControleTransportadora }

function TControleTransportadora.getTransportadora: TList<TTransportadora>;
begin
 //
end;

function TControleTransportadora.getTransportadoraQry: TFDQuery;
var
  Sqr : TFDQuery;
begin
  Sqr := TFDQuery.Create(nil);
  Sqr.Connection := conexao.cn;
  Sqr.Open('select * from transporte');
  Result := sqr;

end;

end.
