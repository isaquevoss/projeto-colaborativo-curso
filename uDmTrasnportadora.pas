unit uDmTrasnportadora;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TDmTrasnportadora = class(TDataModule)
    qrUpdateInsert: TFDQuery;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure SalvarTrasnportadora( _codigo : Integer;_razao:string; _endereco :string; _cidade : string; _uf : string; _telefone :string; _email: string; _cnpj: string; _rntrc:string; );
  end;

var
  DmTrasnportadora: TDmTrasnportadora;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TDmTrasnportadora }

procedure TDmTrasnportadora.SalvarTrasnportadora( _codigo : Integer;_razao:string; _endereco :string; _cidade : string; _uf : string; _telefone :string; _email: string; _cnpj: string; _rntrc:string;);
begin
  qrUpdateInsert.SQL.Clear();
  qrUpdateInsert.SQL.Add('INSERT INTO TRANSPORTE (CODIGO, RAZAO_SOCIAL, ENDERECO, CIDADE, UF, TELEFONE, EMAIL, CNPJ, IE, PLACA, UFV, RNTRC)');
  qrUpdateInsert.SQL.Add('VALUES');
  qrUpdateInsert.SQL.Add(':CODIGO,:RAZAO_SOCIAL, :ENDERECO, :CIDADE, :UF, :TELEFONE, :EMAIL, :CNPJ, :RNTRC');
  qrUpdateInsert.ParamByName('CODIGO').AsInteger := _codigo;
  qrUpdateInsert.ParamByName('RAZAO_SOCIAL').AsString := _razao;
  qrUpdateInsert.ParamByName('ENDERECO').AsString := _endereco;
  qrUpdateInsert.ParamByName('CIDADE').AsString := _cidade;
  qrUpdateInsert.ParamByName('UF').AsString := _uf;
  qrUpdateInsert.ParamByName('TELEFONE').AsString := _telefone;
  qrUpdateInsert.ParamByName('EMAIL').AsString := _email;
  qrUpdateInsert.ParamByName('CNPJ').AsString := _cnpj;
  qrUpdateInsert.ParamByName('RNTRC').AsString := _rntrc;
  qrUpdateInsert.ExecSQL();
end;

end.
