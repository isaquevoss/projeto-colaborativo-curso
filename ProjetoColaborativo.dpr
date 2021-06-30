program ProjetoColaborativo;

uses
  Vcl.Forms,
  uPrincipal in 'uPrincipal.pas' {Form1},
  uDmConexaoFB in 'uDmConexaoFB.pas' {DmConexaoFB: TDataModule},
  uItensVendidosPorDia in 'uItensVendidosPorDia.pas' {frmItensVendidosPorDia},
  uDmItensVendidosPorDia in 'uDmItensVendidosPorDia.pas' {DmItensVendidosPorDia: TDataModule},
  uClientes in 'uClientes.pas' {Form2},
  udmClientes in 'udmClientes.pas' {Dmclientes: TDataModule};
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
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TDmclientes, Dmclientes);
  Application.CreateForm(TdmVendasPorCliente, dmVendasPorCliente);
  Application.CreateForm(TfrmVendasPorCliente, frmVendasPorCliente);
  Application.Run;
end.
