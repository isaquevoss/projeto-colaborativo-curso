unit uDmVendedor;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, uDmConexaoFB, uVendedorClasse;

type
  TDmVendedor = class(TDataModule)
    qrInsertVendedor: TFDQuery;
    qrVendedores: TFDQuery;
    dsVendedores: TDataSource;
    qrBuscarVendedor: TFDQuery;
  private
    vendedor: string;
  public
    function getVendedorById(codigo: integer): TVendedor;
    procedure carregarVendedores();
    procedure cadastrar(_vendedor: TVendedor);
  end;

var
  DmVendedor: TDmVendedor;

implementation

uses
  Vcl.Dialogs;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TDmVendedor }

procedure TDmVendedor.cadastrar(_vendedor: TVendedor);
begin

  qrInsertVendedor.Close();
  qrInsertVendedor.SQL.Clear();
  qrInsertVendedor.SQL.Add('insert into vendedor (nome, comissaov, comissaop, desconto_max) ');
  qrInsertVendedor.SQL.Add('values(:nome, :pcomissao_a_vista, :pcomissao_a_prazo, :pdesconto_max);');

  qrInsertVendedor.ParamByName('nome').AsString := _vendedor.nome;

  qrInsertVendedor.ParamByName('pcomissao_a_vista').AsFloat := _vendedor.pComissaoAVista;
  qrInsertVendedor.ParamByName('pcomissao_a_prazo').AsFloat := _vendedor.pComissaoAPrazo;
  qrInsertVendedor.ParamByName('pdesconto_max').AsFloat := _vendedor.pDescontoMaximo;

  qrInsertVendedor.ExecSQL();
end;

procedure TDmVendedor.carregarVendedores;
begin
  qrVendedores.Close();
  qrVendedores.Open('select * from vendedor order by id desc');
end;

function TDmVendedor.getVendedorById(codigo: integer): TVendedor;
var
  _vendedor: TVendedor;
begin
  qrBuscarVendedor.SQL.Clear();
  qrBuscarVendedor.SQL.Add('select * from vendedor where id = :id');
  qrBuscarVendedor.ParamByName('id').AsInteger := codigo;
  qrBuscarVendedor.Open();

  if qrBuscarVendedor.RecordCount = 0 then
    raise Exception.Create('Nenhum vendedor encontrado');

  _vendedor := TVendedor.Create();
  _vendedor.codigo := qrBuscarVendedor.FieldByName('id').AsInteger;
  _vendedor.nome := qrBuscarVendedor.FieldByName('nome').AsString;
  _vendedor.pComissaoAVista := qrBuscarVendedor.FieldByName('comissaov').AsFloat;
  _vendedor.pComissaoAPrazo := qrBuscarVendedor.FieldByName('comissaop').AsFloat;
  _vendedor.pDescontoMaximo := qrBuscarVendedor.FieldByName('desconto_max').AsFloat;

  Result := _vendedor;

end;

end.

