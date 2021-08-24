unit uModelo;

interface

uses
  uConexao;

type
  TModelo = class
  private
    Fconexao: tconexao;
  public
    property conexao: tconexao read Fconexao write Fconexao;
  end;

implementation

end.

