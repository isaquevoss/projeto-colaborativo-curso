unit uDmVendasPorCliente;

interface

uses
  System.SysUtils, System.Classes,uDmConexaoFB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TdmVendasPorCliente = class(TDataModule)
    qrVendas: TFDQuery;
    dsVendasPorCliente: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure buscarVendas(_nome : string =''; _dataEmissao : TDateTime = 0);

  end;

var
  dmVendasPorCliente: TdmVendasPorCliente;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TdmVendasPorCliente }

procedure TdmVendasPorCliente.buscarVendas(_nome: string ; _dataEmissao : TDateTime );
begin
 if not DmConexaoFB.Conexao.Connected then
DmConexaoFB.conectarBanco();
qrVendas.SQL.Add('select cliente.codigo');
qrVendas.SQL.Add('      ,sum(vendas.valor_tot_pro)' );
qrVendas.SQL.Add('      from vendas');
qrVendas.SQL.Add('      , cliente.nome');
qrVendas.SQL.Add('      left join cliente on vendas.cliente = cliente.codigo' );
qrVendas.SQL.Add('      where upper(nome) containing upper(:nome) and data_emissao=  :data');
qrVendas.SQL.Add('      group by 1,2');
qrVendas.ParamByName('nome').AsString :=_nome;
qrVendas.ParamByName('data').AsDate:= _dataEmissao;
qrVendas.Open();
end;

end.
