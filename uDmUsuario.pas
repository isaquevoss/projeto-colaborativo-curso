unit uDmUsuario;

interface

uses
  System.SysUtils, System.Classes, uDmConexaoFB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TdmUsuario = class(TDataModule)
    dsUsuario: TDataSource;
    qrUsuario: TFDQuery;
    qrLogin: TFDQuery;
  private
    { Private declarations }
  public
    procedure carregarUsuarios();
    procedure carregarNomeUsuario(var _nomeUsuario : TStringList);
    procedure validarLogin(_nome, _senha : string);
  end;

var
  dmUsuario: TdmUsuario;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TDataModule1 }

procedure TdmUsuario.carregarNomeUsuario(var _nomeUsuario : TStringList);
begin
  if not DmConexaoFB.Conexao.Connected then
    DmConexaoFB.conectarBanco();

  qrUsuario.Close();
  qrUsuario.SQL.Clear();
  qrUsuario.SQL.Add('select usuario from usuarios');
  qrUsuario.Open();
  while not qrUsuario.Eof do
  begin
    _nomeUsuario.Add(qrUsuario.FieldByName('usuario').AsString);
    qrUsuario.Next;
  end;

end;

procedure
 TdmUsuario.carregarUsuarios();
begin
  qrUsuario.SQL.Clear;
  qrUsuario.SQL.Add('select * from usuarios');
  qrUsuario.Open();
end;



procedure TdmUsuario.validarLogin(_nome, _senha: string);
begin
  qrLogin.Close();
  qrLogin.SQL.Clear();
  qrLogin.SQL.Add('select * from usuarios where usuario = :_nome and senha = :_senha');
  qrLogin.ParamByName('_nome').AsString := _nome;
  qrLogin.ParamByName('_senha').AsString := _senha;
  qrLogin.Open();
end;

end.
