unit uDmTransportadora;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, uDmConexaoFB, uTransportadoraClasse;

type
  TDmTransportadora = class(TDataModule)
    qrInsertUpdate: TFDQuery;
    qrTransportadora: TFDQuery;
    dsTransportadora: TDataSource;
    qrBuscarTransportadora: TFDQuery;
  private
    { Private declarations }
    transportadora : string;
  public
    { Public declarations }
    procedure Cadastrar(_transportadora: TTransportadora);
    procedure Atualizar(_transportadora : TTransportadora);
    procedure CarregarTransportadora();
    procedure BuscarTransp(_razao: string);
    function getTransportadoraByCod(codigo: Integer):TTransportadora;

  end;

var
  DmTransportadora: TDmTransportadora;

implementation


{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TDataModule1 }

procedure TDmTransportadora.Atualizar(_transportadora: TTransportadora);
begin
  if not DmConexaoFB.Conexao.Connected then
    DmConexaoFB.conectarBanco();
    qrInsertUpdate.Close();
    qrInsertUpdate.SQL.Clear();
    qrInsertUpdate.SQL.Add('UPDATE TRANSPORTE SET');
    qrInsertUpdate.SQL.Add('RAZAO_SOCIAL = :razao_social, ENDERECO = :ENDERECO,CIDADE = :CIDADE,');
    qrInsertUpdate.SQL.Add('UF = :UF, TELEFONE = :TELEFONE,EMAIL = :EMAIL,');
    qrInsertUpdate.SQL.Add('CNPJ = :CNPJ,RNTRC= :RNTRC');
    qrInsertUpdate.SQL.Add('WHERE CODIGO = :CODIGO');
    qrInsertUpdate.ParamByName('RAZAO_SOCIAL').Value := _transportadora.razao;
    qrInsertUpdate.ParamByName('ENDERECO').AsString := _transportadora.endereco;
    qrInsertUpdate.ParamByName('CIDADE').AsString := _transportadora.cidade;
    qrInsertUpdate.ParamByName('UF').AsString := _transportadora.UF;
    qrInsertUpdate.ParamByName('TELEFONE').AsString := _transportadora.telefone;
    qrInsertUpdate.ParamByName('EMAIL').AsString := _transportadora.email;
    qrInsertUpdate.ParamByName('CNPJ').AsString := _transportadora.CNPJ;
    qrInsertUpdate.ParamByName('RNTRC').AsString := _transportadora.RNTRC;
    qrInsertUpdate.ParamByName('CODIGO').AsInteger := _transportadora.codigo;

    qrInsertUpdate.ExecSQL();


end;

procedure TDmTransportadora.BuscarTransp(_razao: string);
begin
  if not DmConexaoFB.Conexao.Connected then
    DmConexaoFB.conectarBanco();

  qrTransportadora.Close();
  qrTransportadora.SQL.Clear();
  qrTransportadora.SQL.Add('select * from transporte where upper(razao_social) like upper(:razao);');
  qrTransportadora.ParamByName('razao').AsString := '%' + _razao + '%';
  qrTransportadora.Open();

end;

procedure TDmTransportadora.Cadastrar(_transportadora: TTransportadora);
begin
  if not DmConexaoFB.Conexao.Connected then
    DmConexaoFB.conectarBanco();

  qrInsertUpdate.Close();
  qrInsertUpdate.SQL.Clear();
  qrInsertUpdate.SQL.Add('INSERT INTO TRANSPORTE ');
  qrInsertUpdate.SQL.Add('(CODIGO, RAZAO_SOCIAL, ENDERECO, CIDADE, UF, TELEFONE, EMAIL, CNPJ, RNTRC)');
  qrInsertUpdate.SQL.Add('VALUES');
  qrInsertUpdate.SQL.Add('((select case when max(transporte.codigo) is null then 1');
  qrInsertUpdate.SQL.Add(' else max(transporte.codigo)+1 end from transporte)');
  qrInsertUpdate.SQL.Add(',:RAZAO_SOCIAL, :ENDERECO, :CIDADE, :UF, :TELEFONE, :EMAIL, :CNPJ, :RNTRC)');
  qrInsertUpdate.ParamByName('RAZAO_SOCIAL').AsString := _transportadora.razao;
  qrInsertUpdate.ParamByName('ENDERECO').AsString := _transportadora.endereco;
  qrInsertUpdate.ParamByName('CIDADE').AsString := _transportadora.cidade;
  qrInsertUpdate.ParamByName('UF').AsString := _transportadora.UF;
  qrInsertUpdate.ParamByName('TELEFONE').AsString := _transportadora.telefone;
  qrInsertUpdate.ParamByName('EMAIL').AsString := _transportadora.email;
  qrInsertUpdate.ParamByName('CNPJ').AsString := _transportadora.CNPJ;
  qrInsertUpdate.ParamByName('RNTRC').AsString := _transportadora.RNTRC;

  qrInsertUpdate.ExecSQL();
end;

procedure TDmTransportadora.CarregarTransportadora;
begin
  if not DmConexaoFB.Conexao.Connected then
    DmConexaoFB.conectarBanco();

  qrTransportadora.Close();
  qrTransportadora.SQL.Clear();
  qrTransportadora.Open('Select * from transporte');
end;

function TDmTransportadora.getTransportadoraByCod(codigo: Integer): TTransportadora;
  var _transportadora : TTransportadora;
begin
  qrBuscarTransportadora.SQL.Clear();
  qrBuscarTransportadora.SQL.Add('select * from transporte where codigo = :codigo');
  qrBuscarTransportadora.ParamByName('codigo').AsInteger := codigo;
  qrBuscarTransportadora.Open();

  if qrBuscarTransportadora.RecordCount = 0 then
    raise Exception.Create('Nenhuma transportadora encontrada!');

    _transportadora := TTransportadora.Create();
    _transportadora.codigo := qrBuscarTransportadora.FieldByName('codigo').AsInteger;
    _transportadora.razao := qrBuscarTransportadora.FieldByName('RAZAO_SOCIAL').AsString;
    _transportadora.endereco := qrBuscarTransportadora.FieldByName('ENDERECO').AsString;
    _transportadora.cidade := qrBuscarTransportadora.FieldByName('CIDADE').AsString;
    _transportadora.UF := qrBuscarTransportadora.FieldByName('UF').AsString;
    _transportadora.telefone := qrBuscarTransportadora.FieldByName('TELEFONE').AsString;
    _transportadora.email := qrBuscarTransportadora.FieldByName('EMAIL').AsString;
    _transportadora.CNPJ := qrBuscarTransportadora.FieldByName('CNPJ').AsString;
    _transportadora.RNTRC := qrBuscarTransportadora.FieldByName('RNTRC').AsString;

    Result:= _transportadora;

end;

end.

