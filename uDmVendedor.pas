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
    procedure cadastrar(nome: string; pComissaoAVista: Double; pComissaoAPrazo: Double; pMaxDesconto: double);
  end;

var
  DmVendedor: TDmVendedor;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TDmVendedor }

procedure TDmVendedor.cadastrar(nome: string; pComissaoAVista, pComissaoAPrazo, pMaxDesconto: double);
begin

  qrInsertVendedor.Close();
  qrInsertVendedor.SQL.Clear();
  qrInsertVendedor.SQL.Add('insert into vendedor (nome, comissaov, comissaop, desconto_max) ');
  qrInsertVendedor.SQL.Add('values(:nome, :pcomissao_a_vista, :pcomissao_a_prazo, :pdesconto_max);');

  qrInsertVendedor.ParamByName('nome').AsString := nome;

  qrInsertVendedor.ParamByName('pcomissao_a_vista').AsFloat := pComissaoAVista;
  qrInsertVendedor.ParamByName('pcomissao_a_prazo').AsFloat := pComissaoAPrazo;
  qrInsertVendedor.ParamByName('pdesconto_max').AsFloat := pMaxDesconto;

  qrInsertVendedor.ExecSQL();
end;

procedure TDmVendedor.carregarVendedores;
begin
  qrVendedores.Close();
  qrVendedores.Open('select * from vendedor order by id desc');
end;

end.

