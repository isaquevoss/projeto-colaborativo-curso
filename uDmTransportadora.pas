unit uDmTransportadora;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, uDmConexaoFB;

type
  TDataModule1 = class(TDataModule)
    qrInsertUpdate: TFDQuery;
    qrTransportadora: TFDQuery;
    dsTransportadora: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
      procedure Cadastrar( _codigo : Integer;_razao:string; _endereco :string; _cidade : string; _uf : string; _telefone :string; _email: string; _cnpj: string; _rntrc:string );
  end;

var
  DataModule1: TDataModule1;

implementation


{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TDataModule1 }

procedure TDataModule1.Cadastrar(_codigo: Integer; _razao, _endereco, _cidade,
  _uf, _telefone, _email, _cnpj, _rntrc: string);
begin
  qrInsertUpdate.SQL.Clear();
  qrInsertUpdate.SQL.Add('INSERT INTO TRANSPORTE (CODIGO, RAZAO_SOCIAL, ENDERECO, CIDADE, UF, TELEFONE, EMAIL, CNPJ, IE, PLACA, UFV, RNTRC)');
  qrInsertUpdate.SQL.Add('VALUES');
  qrInsertUpdate.SQL.Add(':CODIGO,:RAZAO_SOCIAL, :ENDERECO, :CIDADE, :UF, :TELEFONE, :EMAIL, :CNPJ, :RNTRC');
  qrInsertUpdate.ParamByName('CODIGO').AsInteger := _codigo;
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

end.
