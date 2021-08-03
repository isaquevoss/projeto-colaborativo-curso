unit uUsuarioClasse;

interface

type
  TUsuario = class
  private
    Fusuario: string;
    Fsenha: string;
  public
    property usuario: string read Fusuario write Fusuario;
    property senha: string read Fsenha write Fsenha;
  end;

implementation

end.
