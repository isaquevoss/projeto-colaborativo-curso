unit uTransportadora;


interface
  uses
  uModelo;
type
TTransportadora = class(TModelo)

  Fcodigo: Integer;
  Frazao: string;
  Fendereco: string;
  Fcidade: string;
  FUF: string;
  Ftelefone: string;
  Femail: string;
  FCNPJ: string;
  FRNTRC: string;
  public
    property codigo: Integer read Fcodigo write Fcodigo;
    property razao: string read Frazao write Frazao;
    property endereco: string read Fendereco write Fendereco;
    property cidade: string read Fcidade write Fcidade;
    property UF: string read FUF write FUF;
    property telefone: string read Ftelefone write Ftelefone;
    property email: string read Femail write Femail;
    property CNPJ: string read FCNPJ write FCNPJ;
    property RNTRC: string read FRNTRC write FRNTRC;

end;

implementation

end.
