unit ufrmCadastroVendedor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls, uDmVendedor, ACBrBase, ACBrValidador, uVendedorClasse;

type
  TfrmCadastroVendedor = class(TForm)
    btnGravar: TButton;
    btnCancelar: TButton;
    edNome: TEdit;
    EdComissaoAPrazo: TEdit;
    edComissaoAVista: TEdit;
    EdMaxDesconto: TEdit;
    lbCodigo: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    edtcpfcnpj: TEdit;
    lblcpfcnpj: TLabel;
    acbrvldr1: TACBrValidador;
    Button1: TButton;
    Button2: TButton;
    procedure btnGravarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtcpfcnpjExit(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    Fvendedor: TVendedor;
    function getVendedor: TVendedor;

    procedure atualizarDadosTela();
    procedure atualizarClasseVendedor();

    { Private declarations }
  public
    procedure limparFormulario();
    procedure editar(id: Integer);

    property vendedor: TVendedor read Fvendedor write fvendedor;
  end;

var
  frmCadastroVendedor: TfrmCadastroVendedor;

implementation



{$R *.dfm}

procedure TfrmCadastroVendedor.btnGravarClick(Sender: TObject);
begin
  atualizarClasseVendedor();

  DmVendedor.cadastrar(vendedor);

  ModalResult := mrOk;
end;

procedure TfrmCadastroVendedor.Button1Click(Sender: TObject);
begin
  atualizarClasseVendedor();

end;

procedure TfrmCadastroVendedor.Button2Click(Sender: TObject);
begin
  if not Assigned(vendedor) then
  begin
    vendedor := TVendedor.Create;
    vendedor.codigo := 15;
    vendedor.nome := 'meu novo vendedor';
    vendedor.pComissaoAVista := 15;
    vendedor.pComissaoAPrazo := 10;
    vendedor.pDescontoMaximo := 30;
  end;
  atualizarDadosTela();
end;

procedure TfrmCadastroVendedor.atualizarClasseVendedor;
begin
  Fvendedor.nome := edNome.Text;
  Fvendedor.pComissaoAVista := StrToFloat(edComissaoAVista.Text);
  Fvendedor.pComissaoAPrazo := StrToFloat(EdComissaoAPrazo.Text);
  Fvendedor.pDescontoMaximo := StrToFloat(EdMaxDesconto.Text);
end;

procedure TfrmCadastroVendedor.atualizarDadosTela;
begin
  lbCodigo.Caption := 'Codigo ' + inttostr(vendedor.codigo);
  edNome.Text := Fvendedor.nome;
  EdComissaoAPrazo.Text := FloatToStr(Fvendedor.pComissaoAPrazo);
  edComissaoAVista.Text := FloatToStr(Fvendedor.pComissaoAVista);
  EdMaxDesconto.Text := FloatToStr(Fvendedor.pDescontoMaximo);
end;

procedure TfrmCadastroVendedor.btnCancelarClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

function soNumeros(_texto: string): string;
var
  i: Integer;
  letra: string;
begin
  for i := 1 to _texto.Length do
  begin
    letra := Copy(_texto, i, 1);
    if Pos(letra, '1234567890') > 0 then
      Result := Result + Copy(_texto, i, 1);
  end;
end;

procedure TfrmCadastroVendedor.editar(id: Integer);
begin
  vendedor := DmVendedor.getVendedorById(id);
  ShowModal();
end;

procedure TfrmCadastroVendedor.edtcpfcnpjExit(Sender: TObject);
var
  cnpjCpf: string;
begin

  cnpjCpf := soNumeros(edtcpfcnpj.Text);

  if Length(cnpjCpf) > 11 then
  begin

    acbrvldr1.TipoDocto := docCNPJ;
    acbrvldr1.Documento := cnpjCpf;
    if not acbrvldr1.Validar then
    begin
      ShowMessage(acbrvldr1.MsgErro);
    end;
    if cnpjCpf.Length = 14 then
      edtcpfcnpj.Text := acbrvldr1.Formatar;
  end
  else
  begin
    acbrvldr1.TipoDocto := docCPF;
    acbrvldr1.Documento := cnpjCpf;
    if not acbrvldr1.Validar then
    begin
      ShowMessage(acbrvldr1.MsgErro);
    end;
    if cnpjCpf.Length = 11 then
      edtcpfcnpj.Text := acbrvldr1.Formatar;
  end;

end;

procedure TfrmCadastroVendedor.FormShow(Sender: TObject);
begin
  limparFormulario();
  if Assigned(vendedor) then
    atualizarDadosTela();
end;

function TfrmCadastroVendedor.getVendedor: TVendedor;
begin

end;

procedure TfrmCadastroVendedor.limparFormulario;
var
  i: Integer;
begin
  for i := 0 to ComponentCount - 1 do
  begin
    if Components[i] is TEdit then
      TEdit(Components[i]).Text := '';
  end;
end;

end.

