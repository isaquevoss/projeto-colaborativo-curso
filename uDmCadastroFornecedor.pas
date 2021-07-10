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
    procedure cadastrarFornecedor(_nomeForn: string; _fantasiaForn: string; _cnpj_cpfForn: string; _ie_rgForn: string; enderecoForn : string);
  end;

var
  dmCadastroFornecedr: TdmCadastroFornecedr;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TdmCadastroFornecedr }

procedure TdmCadastroFornecedr.cadastrarFornecedor(_nomeForn, _fantasiaForn,
  _cnpj_cpfForn, _ie_rgForn, enderecoForn: string);
begin
  //Limpando e fechando a Query
  qrInsertFornecedr.Close;
  qrInsertFornecedr.SQL.Clear;

  //Iniciando o SQL
  qrInsertFornecedr.SQL.Add('Insert into fornecedor (nome, fantasia, cnpj_cnpf, ie_rg, endereco)');
  qrInsertFornecedr.SQL.Add('values ();');





end;

end.
