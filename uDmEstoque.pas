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
    qrEstoque.SQL.Add('select e.codigo,');
    qrEstoque.SQL.Add('       e.barras,');
    qrEstoque.SQL.Add('       e.descricao,');
    qrEstoque.SQL.Add('       e.und,');
    qrEstoque.SQL.Add('       e.und_compra,');
    qrEstoque.SQL.Add('       e.qtd,');
    qrEstoque.SQL.Add('       e.preco_custo,');
    qrEstoque.SQL.Add('       e.preco_venda');
    qrEstoque.SQL.Add('from estoque e');
    qrEstoque.SQL.Add('where upper(e.descricao) containing upper(:descricao)');
    qrEstoque.ParamByName('descricao').AsString = _descricao;
    qrEstoque.Open();

end;

end.
