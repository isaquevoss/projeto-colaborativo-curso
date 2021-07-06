unit uVendasPorCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.ComCtrls,
  Vcl.Grids, Vcl.DBGrids,uDmVendasPorCliente, Vcl.ExtCtrls;

type
  TfrmVendasPorCliente = class(TForm)
    dbgrdVendasPorCliente: TDBGrid;
    dtpEmisaoInicial: TDateTimePicker;
    edtCliente: TEdit;
    btnBuscar: TButton;
    dtEmissaoFinal: TDateTimePicker;
    TimerBusca: TTimer;
    lblResultBusca: TLabel;
    procedure btnBuscarClick(Sender: TObject);
    procedure lblValorDblClick(Sender: TObject);
    procedure edtClienteChange(Sender: TObject);
    procedure TimerBuscaTimer(Sender: TObject);

  private
    { Private declarations }
  public
  procedure Buscar();

    { Public declarations }
  end;

var
  frmVendasPorCliente: TfrmVendasPorCliente;

implementation

{$R *.dfm}

procedure TfrmVendasPorCliente.btnBuscarClick(Sender: TObject);
begin
  Buscar();


end;

procedure TfrmVendasPorCliente.Buscar;
begin
  TimerBusca.Enabled := False;
  dmVendasPorCliente.buscarVendas(edtCliente.Text,dtpEmisaoInicial.DateTime,dtEmissaoFinal.DateTime);
end;

procedure TfrmVendasPorCliente.edtClienteChange(Sender: TObject);
begin
  TimerBusca.Enabled := False;
  TimerBusca.Enabled := True;
end;

procedure TfrmVendasPorCliente.lblValorDblClick(Sender: TObject);
begin
//ShowMessage('Você clicou no registro: ' + dmVendasPorCliente.qrVendas.FieldByName('CODIGO').AsString + ' ' + dmVendasPorCliente.qrVendas.FieldByName('DESCRICAO').AsString + ' R$ ' + DmItensVendidosPorDia.qrProdutos.FieldByName('VALOR_TOTAL').AsString);
end;



procedure TfrmVendasPorCliente.TimerBuscaTimer(Sender: TObject);
begin
Buscar();
end;

end.
