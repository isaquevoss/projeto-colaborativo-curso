unit uDmCadastroFornecedor;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, uDmConexaoFB;

type
  TdmCadastroFornecedr = class(TDataModule)
    qrInsertFornecedr: TFDQuery;
    ds_CadastrarFornecedr: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure cadastrarFornecedor(_codForn : Integer; _nomeForn: string; _fantasiaForn: string; _cnpj_cpfForn: string; _ie_rgForn: string; _enderecoForn : string);
  end;

var
  dmCadastroFornecedr: TdmCadastroFornecedr;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TdmCadastroFornecedr }

procedure TdmCadastroFornecedr.cadastrarFornecedor(_codForn : Integer; _nomeForn, _fantasiaForn,
  _cnpj_cpfForn, _ie_rgForn, _enderecoForn: string);
begin
  if not DmConexaoFB.Conexao.Connected then
      DmConexaoFB.conectarBanco();

  //Limpando e fechando a Query
  qrInsertFornecedr.Close;
  qrInsertFornecedr.SQL.Clear;

  //Iniciando o SQL
  qrInsertFornecedr.SQL.Add('Insert into fornecedor (codigo, nome, fantasia, cnpj_cnpf, ie_rg, endereco)');
  qrInsertFornecedr.SQL.Add('values (:codigo, :nome, :fantasia, :cnpj_cpf, :ie_rg, :endereco);');
  qrInsertFornecedr.ParamByName('codigo').AsInteger := _codForn;
  qrInsertFornecedr.ParamByName('nome').AsString := _nomeForn;
  qrInsertFornecedr.ParamByName('fantasia').AsString := _fantasiaForn;
  qrInsertFornecedr.ParamByName('cnpj_cpf').AsString := _cnpj_cpfForn;
  qrInsertFornecedr.ParamByName('ie_rg').AsString := _ie_rgForn;
  qrInsertFornecedr.ParamByName('endereco').AsString := _enderecoForn;
  qrInsertFornecedr.ExecSQL;
end;

end.
