program ProjetoColaborativo;

uses
  Vcl.Forms,
  uPrincipal in 'uPrincipal.pas' {Form1},
  uDmConexaoFB in 'uDmConexaoFB.pas' {DmConexaoFB: TDataModule},
  uItensVendidosPorDia in 'uItensVendidosPorDia.pas' {frmItensVendidosPorDia},
  uDmItensVendidosPorDia in 'uDmItensVendidosPorDia.pas' {DmItensVendidosPorDia: TDataModule},
  uVersoesExe in 'uVersoesExe.pas' {frmVersoesExe},
  uDmVersoesExe in 'uDmVersoesExe.pas' {dmVersoes: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TDmConexaoFB, DmConexaoFB);
  Application.CreateForm(TfrmItensVendidosPorDia, frmItensVendidosPorDia);
  Application.CreateForm(TDmItensVendidosPorDia, DmItensVendidosPorDia);
  Application.CreateForm(TfrmVersoesExe, frmVersoesExe);
  Application.CreateForm(TdmVersoes, dmVersoes);
  Application.Run;
end.
