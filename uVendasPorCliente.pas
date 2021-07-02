unit uVendasPorCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.ComCtrls,
  Vcl.Grids, Vcl.DBGrids,uDmVendasPorCliente;

type
  TfrmVendasPorCliente = class(TForm)
    dbgrdVendasPorCliente: TDBGrid;
    dtpEmisaoInicial: TDateTimePicker;
    edtCliente: TEdit;
    btnBuscar: TButton;
    dtEmissaoFinal: TDateTimePicker;
    lblDescValor: TLabel;
    lblValor: TLabel;
    procedure btnBuscarClick(Sender: TObject);
    procedure lblValorDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmVendasPorCliente: TfrmVendasPorCliente;

implementation

{$R *.dfm}

procedure TfrmVendasPorCliente.btnBuscarClick(Sender: TObject);
begin

  dmVendasPorCliente.buscarVendas(edtCliente.Text,dtpEmisaoInicial.DateTime,dtEmissaoFinal.DateTime);


end;

procedure TfrmVendasPorCliente.lblValorDblClick(Sender: TObject);
begin
//ShowMessage('Você clicou no registro: ' + dmVendasPorCliente.qrVendas.FieldByName('CODIGO').AsString + ' ' + dmVendasPorCliente.qrVendas.FieldByName('DESCRICAO').AsString + ' R$ ' + DmItensVendidosPorDia.qrProdutos.FieldByName('VALOR_TOTAL').AsString);
end;

end.
