unit uDmTransportadora;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, uDmConexaoFB;

type
  TDmTransportadora = class(TDataModule)
    qrInsertUpdate: TFDQuery;
    qrTransportadora: TFDQuery;
    dsTransportadora: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
      procedure Cadastrar(_razao:string; _endereco :string; _cidade : string; _uf : string; _telefone :string; _email: string; _cnpj: string; _rntrc:string );
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

procedure TDmTransportadora.Cadastrar( _razao, _endereco, _cidade, _uf, _telefone, _email, _cnpj, _rntrc: string);
begin
  if not DmConexaoFB.Conexao.Connected then
      DmConexaoFB.conectarBanco();

  qrInsertUpdate.Close();
  qrInsertUpdate.SQL.Clear();
  qrInsertUpdate.SQL.Add('INSERT INTO TRANSPORTE (CODIGO, RAZAO_SOCIAL, ENDERECO, CIDADE, UF, TELEFONE, EMAIL, CNPJ, RNTRC)');
  qrInsertUpdate.SQL.Add('VALUES');
  qrInsertUpdate.SQL.Add('((select max(transporte.codigo)+1 from transporte),:RAZAO_SOCIAL, :ENDERECO, :CIDADE, :UF, :TELEFONE, :EMAIL, :CNPJ, :RNTRC)');
   qrInsertUpdate.ParamByName('RAZAO_SOCIAL').AsString := _razao;
  qrInsertUpdate.ParamByName('ENDERECO').AsString := _endereco;
  qrInsertUpdate.ParamByName('CIDADE').AsString := _cidade;
  qrInsertUpdate.ParamByName('UF').AsString := _uf;
  qrInsertUpdate.ParamByName('TELEFONE').AsString := _telefone;
  qrInsertUpdate.ParamByName('EMAIL').AsString := _email;
  qrInsertUpdate.ParamByName('CNPJ').AsString := _cnpj;
  qrInsertUpdate.ParamByName('RNTRC').AsString := _rntrc;

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
