unit uDmItensVendidosPorDia;

interface

uses
  System.SysUtils, System.Classes, uDmConexaoFB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TDmItensVendidosPorDia = class(TDataModule)
    qrProdutos: TFDQuery;
    dsProdutos: TDataSource;
  private
    { Private declarations }
  public
    procedure buscarProdutos(_descricao: string = '');
  end;

var
  DmItensVendidosPorDia: TDmItensVendidosPorDia;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TDataModule1 }

procedure TDmItensVendidosPorDia.buscarProdutos(_descricao: string);
begin
  if not DmConexaoFB.Conexao.Connected then
    DmConexaoFB.conectarBanco();

  qrProdutos.Close();
  qrProdutos.SQL.Clear();
  qrProdutos.SQL.Add('select ');
  qrProdutos.SQL.Add('      cast( itevendas.data_emissao as date) data_emissao');
  qrProdutos.SQL.Add('     , itevendas.codigo');
  qrProdutos.SQL.Add('     , itevendas.descricao');
  qrProdutos.SQL.Add('     , sum(itevendas.valor_total)');
  qrProdutos.SQL.Add('     from itevendas');
  qrProdutos.SQL.Add('   where upper(descricao) containing upper(:descricao)');
  qrProdutos.SQL.Add('  group by 1,2,3');
  qrProdutos.ParamByName('descricao').AsString := _descricao;
  qrProdutos.Open();

end;

end.

