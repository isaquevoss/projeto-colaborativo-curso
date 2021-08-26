program ProjetoColaborativo;



uses
  Vcl.Forms,
  uLogin in 'uLogin.pas' {frmLogin},
  uDmUsuario in 'uDmUsuario.pas' {dmUsuario: TDataModule},
  uPrincipal in 'uPrincipal.pas' {Form1},
  uDmConexaoFB in 'uDmConexaoFB.pas' {DmConexaoFB: TDataModule},
  uItensVendidosPorDia in 'uItensVendidosPorDia.pas' {frmItensVendidosPorDia},
  uDmItensVendidosPorDia in 'uDmItensVendidosPorDia.pas' {DmItensVendidosPorDia: TDataModule},
  uVersoesExe in 'uVersoesExe.pas' {frmVersoesExe},
  uDmVersoesExe in 'uDmVersoesExe.pas' {dmVersoes: TDataModule},
  uDmEstoque in 'uDmEstoque.pas' {DmEstoque: TDataModule},
  uListagemEstoque in 'uListagemEstoque.pas' {FrmListagemEstoque},
  uClientes in 'uClientes.pas' {frmBuscaClientes},
  udmClientes in 'udmClientes.pas' {Dmclientes: TDataModule},
  uDmVendasPorCliente in 'uDmVendasPorCliente.pas' {dmVendasPorCliente: TDataModule},
  uVendasPorCliente in 'uVendasPorCliente.pas' {frmVendasPorCliente},
  uFrmFornecedor in 'uFrmFornecedor.pas' {FrmFornecedor},
  uFrmTransportadora in 'uFrmTransportadora.pas' {FrmTransportadora},
  uDmFornecedor in 'uDmFornecedor.pas' {dmFornecedor: TDataModule},
  ufrmVendedores in 'ufrmVendedores.pas' {frmVendedores},
  ufrmCadastroVendedor in 'ufrmCadastroVendedor.pas' {frmCadastroVendedor},
  uDmVendedor in 'uDmVendedor.pas' {DmVendedor: TDataModule},
  uFrmListaTransportadora in 'uFrmListaTransportadora.pas' {frmListaTransportadora},
  uDmTransportadora in 'uDmTransportadora.pas' {DmTransportadora: TDataModule},
  uEstoque in 'uEstoque.pas' {frmEstoque},
  uCadastroEstoque in 'uCadastroEstoque.pas' {frmCadastroEstoque},
  ufrmCadastroFornecedor in 'ufrmCadastroFornecedor.pas' {frmCadastroFornecedr},
  uDmCadastroFornecedor in 'uDmCadastroFornecedor.pas' {dmCadastroFornecedr: TDataModule},
  uFrmValidarFormulario in 'uFrmValidarFormulario.pas' {frmValidarFormulario},
  uCadastroCliente in 'uCadastroCliente.pas' {frmCadastroCliente},
  uTesteValidarFormatarDados in 'uTesteValidarFormatarDados.pas' {FrmValidarFormatarDados},
  System.UITypes {FrmValidarFormatarDados},
  uVendedorClasse in 'classes\uVendedorClasse.pas',
  uTransportadoraClasse in 'classes\uTransportadoraClasse.pas',
  uEstoqueClasse in 'classes\uEstoqueClasse.pas',
  uClienteClasse in 'classes\uClienteClasse.pas',
  uUsuarioClasse in 'classes\uUsuarioClasse.pas',
  uCadastroUsuario in 'uCadastroUsuario.pas' {CadastroUsuario},
  uControle in 'controles\uControle.pas',
  uModelo in 'modelos\uModelo.pas',
  uConexao in 'database\uConexao.pas',
  uControleVendedor in 'controles\uControleVendedor.pas',
  uVendedor in 'modelos\uVendedor.pas',
  uViewVendedor in 'views\uViewVendedor.pas' {viewVendedor},
  uControlleApp in 'controles\uControlleApp.pas',
  uViewTransportadora in 'views\uViewTransportadora.pas' {viewTransportadora};

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
  Application.CreateForm(TDmEstoque, DmEstoque);
  Application.CreateForm(TFrmListagemEstoque, FrmListagemEstoque);
  Application.CreateForm(TfrmBuscaClientes, frmBuscaClientes);
  Application.CreateForm(TDmclientes, Dmclientes);
  Application.CreateForm(TdmVendasPorCliente, dmVendasPorCliente);
  Application.CreateForm(TfrmVendasPorCliente, frmVendasPorCliente);
  Application.CreateForm(TFrmFornecedor, FrmFornecedor);
  Application.CreateForm(TFrmTransportadora, FrmTransportadora);
  Application.CreateForm(TdmFornecedor, dmFornecedor);
  Application.CreateForm(TfrmVendedores, frmVendedores);
  Application.CreateForm(TfrmCadastroVendedor, frmCadastroVendedor);
  Application.CreateForm(TDmVendedor, DmVendedor);
  Application.CreateForm(TfrmListaTransportadora, frmListaTransportadora);
  Application.CreateForm(TDmTransportadora, DmTransportadora);
  Application.CreateForm(TfrmEstoque, frmEstoque);
  Application.CreateForm(TfrmCadastroEstoque, frmCadastroEstoque);
  Application.CreateForm(TfrmCadastroFornecedr, frmCadastroFornecedr);
  Application.CreateForm(TdmCadastroFornecedr, dmCadastroFornecedr);
  Application.CreateForm(TfrmEstoque, frmEstoque);
  Application.CreateForm(TfrmCadastroCliente, frmCadastroCliente);
  Application.CreateForm(TFrmValidarFormatarDados, FrmValidarFormatarDados);
  Application.CreateForm(TfrmValidarFormulario, frmValidarFormulario);
  Application.CreateForm(TfrmLogin, frmLogin);
  Application.CreateForm(TdmUsuario, dmUsuario);
  Application.CreateForm(TCadastroUsuario, CadastroUsuario);
  Application.CreateForm(TviewVendedor, viewVendedor);
  Application.CreateForm(TviewTransportadora, viewTransportadora);
  if frmLogin.ShowModal <> mrOk then
    Application.Terminate;

  controleApp := TControleApp.Create();
  conexao := TConexao.Create();
  conexao.cn := DmConexaoFB.Conexao;
  controleVendedor := TControleVendedor.Create();


  Application.Run;
end.
