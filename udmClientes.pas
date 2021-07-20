unit udmClientes;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, uDmConexaoFB;

type
  TDmclientes = class(TDataModule)
    dsClientes: TDataSource;
    qrClientes: TFDQuery;
    qrInsertClientes: TFDQuery;
  private
    { Private declarations }
  public
     procedure buscarclientes(_nome: string = '');
     procedure cadastrarCliente(_nomeCliente: string; _dataCadastrCliente: string);
  end;

var
  Dmclientes: tdmclientes;



implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TDataModule1 }

procedure TDmclientes.buscarclientes(_nome: string);

begin
  if not DmConexaoFB.Conexao.Connected then
    DmConexaoFB.conectarBanco();


  qrclientes.Close();
  qrclientes.SQL.Clear();

  qrclientes.SQL.Add('select nome from cliente ');
  qrclientes.SQL.Add('where nome containing :nome');

  qrclientes.ParamByName('nome').AsString := _nome;
  qrclientes.Open();

end;

procedure TDmclientes.cadastrarCliente(_nomeCliente,
  _dataCadastrCliente: string);
begin
  if not DmConexaoFB.Conexao.Connected then
        DmConexaoFB.conectarBanco();

  //Limpando e fechando a Query
  qrInsertClientes.Close;
  qrInsertClientes.SQL.Clear;

  //Iniciando o SQL
  qrInsertClientes.SQL.Add('Insert into cliente (codigo, nome, cadastro)');
  qrInsertClientes.SQL.Add('values (cast((select count(cliente.codigo) from cliente) as VARCHAR(6)), :nome, :cadastro);');
  qrInsertClientes.ParamByName('nome').AsString := _nomeCliente;
  qrInsertClientes.ParamByName('cadastro').AsString := _dataCadastrCliente;
  qrInsertClientes.ExecSQL;

end;

end.
