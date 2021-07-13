unit uDmEstoque;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, uDmConexaoFB;

type
  TDmEstoque = class(TDataModule)
    qrEstoque: TFDQuery;
    dsEstoque: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure buscarEstoque(_descricao: string = '');
    procedure carregarEstoque();
    procedure cadastrarEstoque(_codigo: Integer; _descricao: string; _qtd: Double; _precoVenda: Double);
    procedure proximoCodigo(var _proxCodigo: string);
  end;

var
  DmEstoque: TDmEstoque;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TDmEstoque }

procedure TDmEstoque.buscarEstoque(_descricao: string);
begin
  if not DmConexaoFB.Conexao.Connected then
    DmConexaoFB.conectarBanco();

    qrEstoque.Close();
    qrEstoque.SQL.Clear();
    qrEstoque.SQL.Add('select codigo,');
    qrEstoque.SQL.Add('       barras,');
    qrEstoque.SQL.Add('       descricao,');
    qrEstoque.SQL.Add('       und,');
    qrEstoque.SQL.Add('       und_compra,');
    qrEstoque.SQL.Add('       qtd,');
    qrEstoque.SQL.Add('       preco_custo,');
    qrEstoque.SQL.Add('       preco_venda');
    qrEstoque.SQL.Add('from estoque e');
    qrEstoque.SQL.Add('where upper(descricao) containing upper(:descricao)');
    qrEstoque.ParamByName('descricao').AsString := _descricao;
    qrEstoque.Open();
    qrEstoque.FetchAll();
end;


procedure TDmEstoque.cadastrarEstoque(_codigo: Integer; _descricao: string; _qtd,
  _precoVenda: Double);
begin
  if not DmConexaoFB.Conexao.Connected then
    DmConexaoFB.conectarBanco();

  qrEstoque.Close();
  qrEstoque.SQL.Clear();
  qrEstoque.SQL.Add('insert into estoque (codigo, descricao, qtd, preco_venda)');
  qrEstoque.SQL.Add('values(:codigo, :descricao, :qtd, :precoVenda)');

  qrEstoque.ParamByName('codigo').AsInteger := _codigo;
  qrEstoque.ParamByName('descricao').AsString := _descricao;
  qrEstoque.ParamByName('qtd').AsFloat := _qtd;
  qrEstoque.ParamByName('precoVenda').AsFloat := _precoVenda;

  qrEstoque.ExecSQL();

end;

procedure TDmEstoque.carregarEstoque();
begin
  qrEstoque.Close();
  qrEstoque.Open('select * from estoque');
end;

procedure TDmEstoque.proximoCodigo(var _proxCodigo : string);
begin
  qrEstoque.Close();
  qrEstoque.SQL.Clear();
  qrEstoque.SQL.Add('select count(estoque.codigo) +1 as "proxcod" from estoque');
  qrEstoque.Open();

  _proxCodigo := qrEstoque.FieldByName('proxcod').AsString;
end;

end.
