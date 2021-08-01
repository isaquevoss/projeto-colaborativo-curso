unit uDmTransportadora;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, uDmConexaoFB,uTransportadoraClasse;

type
  TDmTransportadora = class(TDataModule)
    qrInsertUpdate: TFDQuery;
    qrTransportadora: TFDQuery;
    dsTransportadora: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
      procedure Cadastrar(_transportadora :TTransportadora);
      procedure CarregarTransportadora();
      procedure BuscarTransp(_razao:string);
  end;

var
  DmTransportadora: TDmTransportadora;

implementation


{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TDataModule1 }

procedure TDmTransportadora.BuscarTransp(_razao: string);
begin
  if not DmConexaoFB.Conexao.Connected then
      DmConexaoFB.conectarBanco();

  qrTransportadora.Close();
  qrTransportadora.SQL.Clear();
  qrTransportadora.SQL.Add('select * from transporte where upper(razao_social) like upper(:razao);');
  qrTransportadora.ParamByName('razao').AsString := '%'+ _razao +'%';
  qrTransportadora.Open();


end;

procedure TDmTransportadora.Cadastrar( _transportadora : TTransportadora);
begin
  if not DmConexaoFB.Conexao.Connected then
      DmConexaoFB.conectarBanco();

  qrInsertUpdate.Close();
  qrInsertUpdate.SQL.Clear();
  qrInsertUpdate.SQL.Add('INSERT INTO TRANSPORTE (CODIGO, RAZAO_SOCIAL, ENDERECO, CIDADE, UF, TELEFONE, EMAIL, CNPJ, RNTRC)');
  qrInsertUpdate.SQL.Add('VALUES');
  qrInsertUpdate.SQL.Add('((select case when max(transporte.codigo) is null then 1 else max(transporte.codigo)+1 end from transporte)'+
  #13 + ',:RAZAO_SOCIAL, :ENDERECO, :CIDADE, :UF, :TELEFONE, :EMAIL, :CNPJ, :RNTRC)');
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

end.
