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
    procedure buscarVendas(_nome : string =''; _dataEmissaoIni : TDateTime = 0; _dataEmissaoFin:TDateTime =0 );

  end;

var
  dmVendasPorCliente: TdmVendasPorCliente;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TdmVendasPorCliente }

procedure TdmVendasPorCliente.buscarVendas(_nome: string ; _dataEmissaoIni : TDateTime;_dataEmissaoFin : TDateTime );
begin
 if not DmConexaoFB.Conexao.Connected then
DmConexaoFB.conectarBanco();
qrVendas.Close;
qrVendas.SQL.Clear();
qrVendas.SQL.Add('select vendas.modelo');
qrVendas.SQL.Add('      ,cliente.codigo');
qrVendas.SQL.Add('      , cliente.nome');
qrVendas.SQL.Add('      ,sum(vendas.valor_tot_pro) as Valor' );
qrVendas.SQL.Add('      from vendas');
qrVendas.SQL.Add('      left join cliente on vendas.cliente = cliente.codigo' );
qrVendas.SQL.Add('      where upper(nome) containing upper(:nome)');
qrVendas.SQL.Add(' and data_emissao>=  (:dataIni) and data_emissao <= (:dataFin)');
qrVendas.SQL.Add('      group by 1,2,3');
qrVendas.ParamByName('nome').AsString :=_nome;
qrVendas.ParamByName('dataIni').AsDate:= _dataEmissaoIni;
qrVendas.ParamByName('dataFin').AsDate:= _dataEmissaoFin;
qrVendas.Open();
qrVendas.FetchAll;
end;

end.
