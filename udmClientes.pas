unit udmClientes;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, uDmConexaoFB, uClienteClasse;

type
  TDmclientes = class(TDataModule)
    dsClientes: TDataSource;
    qrClientes: TFDQuery;
    qrInsertClientes: TFDQuery;
  private
    { Private declarations }
  public
    procedure buscarclientes(_cliente: TCliente);
    procedure cadastrarCliente(_cliente: TCliente);
    procedure carregarClientes();
    function getClienteById(codigo: integer): TCliente;
  end;

var
  Dmclientes: TDmclientes;

implementation

{ %CLASSGROUP 'Vcl.Controls.TControl' }

{$R *.dfm}
{ TDataModule1 }

procedure TDmclientes.buscarclientes(_cliente: TCliente);

begin
  if not DmConexaoFB.Conexao.Connected then
    DmConexaoFB.conectarBanco();

  qrClientes.Close();
  qrClientes.SQL.Clear();

  qrClientes.SQL.Add('select nome from cliente ');
  qrClientes.SQL.Add('where nome containing :nome');

  qrClientes.ParamByName('nome').AsString := _cliente.nome;
  qrClientes.Open();

end;

procedure TDmclientes.cadastrarCliente(_cliente: TCliente);
begin
  if not DmConexaoFB.Conexao.Connected then
    DmConexaoFB.conectarBanco();

  // Limpando e fechando a Query
  qrInsertClientes.Close;
  qrInsertClientes.SQL.Clear;

  // Iniciando o SQL
  qrInsertClientes.SQL.Add('Insert into cliente (codigo, nome, cadastro)');
  qrInsertClientes.SQL.Add
    ('values (cast((select count(cliente.codigo) from cliente) as VARCHAR(6)), :nome, :cadastro);');
  qrInsertClientes.ParamByName('nome').AsString := _cliente.nome;
  qrInsertClientes.ParamByName('cadastro').AsString := _cliente.dataCadastro;
  qrInsertClientes.ExecSQL;

end;

procedure TDmclientes.carregarClientes;
begin
  qrClientes.Close();
  qrClientes.SQL.Clear();
  qrClientes.Open('select * from cliente');
end;

function TDmclientes.getClienteById(codigo: integer): TCliente;
var
  _cliente: TCliente;

begin
  qrClientes.SQL.Clear();
  qrClientes.SQL.Add('select * from cliente where codigo = :codigo');
  qrClientes.ParamByName('codigo').AsString := inttostr(codigo).PadLeft(6, '0');
  qrClientes.Open();

  if qrClientes.RecordCount = 0 then
    raise Exception.Create('Nenhum cliente encontrado');

  _cliente := TCliente.Create();
  _cliente.nome := qrClientes.FieldByName('nome').AsString;
  _cliente.cpf := qrClientes.FieldByName('cnpj_cnpf').AsString;
  _cliente.dataCadastro := qrClientes.FieldByName('cadastro').AsString;

  Result := _cliente;
end;

end.
