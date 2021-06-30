program ProjetoColaborativo;

uses
  Vcl.Forms,
  uPrincipal in 'uPrincipal.pas' {Form1},
  uDmConexaoFB in 'uDmConexaoFB.pas' {DmConexaoFB: TDataModule},
  uItensVendidosPorDia in 'uItensVendidosPorDia.pas' {frmItensVendidosPorDia},
  uDmItensVendidosPorDia in 'uDmItensVendidosPorDia.pas' {DmItensVendidosPorDia: TDataModule},
  uDmVendasPorCliente in 'uDmVendasPorCliente.pas' {dmVendasPorCliente: TDataModule},
  uVendasPorCliente in 'uVendasPorCliente.pas' {frmVendasPorCliente};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TDmConexaoFB, DmConexaoFB);
  Application.CreateForm(TfrmItensVendidosPorDia, frmItensVendidosPorDia);
  Application.CreateForm(TDmItensVendidosPorDia, DmItensVendidosPorDia);
  Application.CreateForm(TdmVendasPorCliente, dmVendasPorCliente);
  Application.CreateForm(TfrmVendasPorCliente, frmVendasPorCliente);
  Application.Run;
end.
