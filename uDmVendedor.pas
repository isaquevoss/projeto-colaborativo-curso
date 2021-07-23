unit uDmVendedor;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, uDmConexaoFB;

type
  TDmVendedor = class(TDataModule)
    qrInsertVendedor: TFDQuery;
    qrVendedores: TFDQuery;
    dsVendedores: TDataSource;
  private
     vendedor: string;
  public
    procedure carregarVendedores();
    procedure cadastrar(_nome: string; _pComissaoAVista: Double; _pComissaoAPrazo: Double; _pMaxDesconto: double ; _cpfcnpj : string);
  end;

var
  DmVendedor: TDmVendedor;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TDmVendedor }

procedure TDmVendedor.cadastrar(_nome: string; _pComissaoAVista, _pComissaoAPrazo, _pMaxDesconto: double; _cpfcnpj : string);
begin

  qrInsertVendedor.Close();
  qrInsertVendedor.SQL.Clear();
  qrInsertVendedor.SQL.Add('insert into vendedor (nome, comissaov, comissaop, desconto_max, cpf_cnpj) ');
  qrInsertVendedor.SQL.Add('values(:nome, :pcomissao_a_vista, :pcomissao_a_prazo, :pdesconto_max, :cpf_cnpj);');

  qrInsertVendedor.ParamByName('nome').AsString := _nome;

  qrInsertVendedor.ParamByName('pcomissao_a_vista').AsFloat := _pComissaoAVista;
  qrInsertVendedor.ParamByName('pcomissao_a_prazo').AsFloat := _pComissaoAPrazo;
  qrInsertVendedor.ParamByName('pdesconto_max').AsFloat := _pMaxDesconto;
  qrInsertVendedor.ParamByName('cpf_cnpj').AsString := _cpfcnpj;

  qrInsertVendedor.ExecSQL();
end;

procedure TDmVendedor.carregarVendedores;
begin
  qrVendedores.Close();
  qrVendedores.Open('select * from vendedor order by id desc');
end;

end.

