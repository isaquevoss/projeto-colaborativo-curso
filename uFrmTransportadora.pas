unit uFrmTransportadora;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls, uDmTransportadora, uFrmListaTransportadora, ACBrBase,
  ACBrValidador, Vcl.ExtCtrls, uTransportadoraClasse;

type
  TFormOperacao = (fmInsert , fmEdit);

  asdkjflçabsolute= (asfd = 595,sdaf= 111,aaaa =12 , fwewer,werwe , dddddd);

  TMoleloDFe = (mdNfe = 55, mdNfce = 65, mdSat = 59);

  TFrmTransportadora = class(TForm)
    edtNome: TEdit;
    lblNome: TLabel;
    lblEndereco: TLabel;
    lblCidade: TLabel;
    lblUF: TLabel;
    lblTelefone: TLabel;
    lblEmail: TLabel;
    lblRntrc: TLabel;
    lblCnpj: TLabel;
    edtCnpj: TEdit;
    edtEndereco: TEdit;
    edtCidade: TEdit;
    cbxUF: TComboBox;
    edtTelefone: TEdit;
    edtEmail: TEdit;
    edtRntrc: TEdit;
    btnSalvar: TButton;
    btnCancelar: TButton;
    acbrvldr1: TACBrValidador;
    imgCheckCNPJ: TImage;
    imgWrongCNPJ: TImage;
    imgValidacao: TImage;
    btnLimpar: TButton;
    lblValidaNome: TLabel;
    lblValidaCpfCnpj: TLabel;
    lblValidaUf: TLabel;
    lblValidaCidade: TLabel;
    lblValidaEndereco: TLabel;
    procedure btnSalvarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure edtCnpjExit(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure edtNomeExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    Ftransportadora: TTransportadora;
    Foperacao: TFormOperacao;
    property operacao: TFormOperacao read Foperacao write Foperacao;
    { Private declarations }
  public
    { Public declarations }
    procedure LimparFormulario();
    procedure ValidaCpfCnpj();
    function validarNome(): Boolean;
    function validaFormulario(): Boolean;
    procedure editar(codigo: Integer);
    procedure novo();
    procedure atualizarDadosTela();
    procedure SalvarNova();
    procedure SalvarEditada();
    procedure validarCampos();
    property transportadora: TTransportadora read Ftransportadora write Ftransportadora;
  end;

var
  FrmTransportadora: TFrmTransportadora;

implementation


{$R *.dfm}

procedure TFrmTransportadora.atualizarDadosTela;
begin
  edtNome.Text := Ftransportadora.razao;
  edtEndereco.Text := Ftransportadora.endereco;
  edtCidade.text := Ftransportadora.cidade;
  cbxUF.Text := Ftransportadora.UF;
  edtTelefone.Text := Ftransportadora.telefone;
  edtEmail.Text := Ftransportadora.email;
  edtCnpj.Text := Ftransportadora.CNPJ;
  edtRntrc.Text := Ftransportadora.RNTRC;

end;

procedure TFrmTransportadora.btnCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmTransportadora.btnLimparClick(Sender: TObject);
begin
  LimparFormulario();
end;

procedure TFrmTransportadora.btnSalvarClick(Sender: TObject);
var
  transportadora: TTransportadora;
begin
  transportadora := TTransportadora.Create();
  if operacao = fmInsert then
  begin
    try
      SalvarEditada();
      DmTransportadora.CarregarTransportadora;

    finally
      transportadora.Free();
    end;
  end;
  if operacao = fmEdit then
  begin
    try
      SalvarNova();
      DmTransportadora.CarregarTransportadora;
      frmListaTransportadora.lbl_qtdRegistros.Caption := 'Registros: ' + IntToStr(DmTransportadora.qrTransportadora.RecordCount);

    finally
      transportadora.Free();
    end;

  end;
       // separar em 3 blocos 3 metodos e chamar cada medoto no if
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

procedure TFrmTransportadora.editar(codigo: Integer);
begin
  transportadora := DmTransportadora.getTransportadoraByCod(codigo);
  Foperacao := fmEdit;
  ShowModal();

end;

procedure TFrmTransportadora.edtCnpjExit(Sender: TObject);
begin
  ValidaCpfCnpj();
end;

procedure TFrmTransportadora.edtNomeExit(Sender: TObject);
begin
  validarNome();
end;

procedure TFrmTransportadora.FormCreate(Sender: TObject);
begin
  Foperacao := fmInsert;
end;

procedure TFrmTransportadora.FormShow(Sender: TObject);
begin

  if operacao = fmEdit then
  begin
    atualizarDadosTela();
  end;
  if operacao = fmInsert then
  begin
    LimparFormulario();
  end;
end;

procedure TFrmTransportadora.LimparFormulario;
var
  i: Integer;
begin
  for i := 0 to ComponentCount - 1 do
  begin
    if Components[i] is TEdit then
      TEdit(Components[i]).Text := '';
    imgValidacao.Picture := nil;
  end;
  for i := 0 to ComponentCount - 1 do
  begin
    if Components[i] is TLabel then
      if Pos('lblValida', Components[i].Name) > 0 then
        TLabel(Components[i]).Visible := False;

  end;

  cbxUF.ItemIndex := -1;

end;

procedure TFrmTransportadora.novo;
begin
  Foperacao := fmInsert;
  ShowModal;
end;

procedure TFrmTransportadora.SalvarEditada;
var
  transportadora: TTransportadora;
begin
  transportadora := TTransportadora.Create;
  transportadora.codigo := DmTransportadora.qrTransportadora.FieldByName('codigo').AsInteger;
  transportadora.razao := edtNome.Text;
  transportadora.endereco := edtEndereco.Text;
  transportadora.cidade := edtCidade.text;
  transportadora.UF := cbxUF.Text;
  transportadora.telefone := edtTelefone.Text;
  transportadora.email := edtEmail.Text;
  transportadora.CNPJ := edtCnpj.Text;
  transportadora.RNTRC := edtRntrc.Text;
  validarCampos();

  if not validaFormulario then
  begin
    ShowMessage('Formulário com dados inválidos verifique');
    Exit;
  end;
  DmTransportadora.Atualizar(transportadora);
  ShowMessage('Transportadora atualizada com sucesso!');
  LimparFormulario();

end;

procedure TFrmTransportadora.SalvarNova;
var
  transportadora: TTransportadora;
begin
  transportadora := TTransportadora.Create;
  transportadora.razao := edtNome.Text;
  transportadora.endereco := edtEndereco.Text;
  transportadora.cidade := edtCidade.text;
  transportadora.UF := cbxUF.Text;
  transportadora.telefone := edtTelefone.Text;
  transportadora.email := edtEmail.Text;
  transportadora.CNPJ := edtCnpj.Text;
  transportadora.RNTRC := edtRntrc.Text;
  validarCampos();

  if not validaFormulario then
  begin
    ShowMessage('Formulário com dados inválidos verifique');
    Exit;
  end;
  DmTransportadora.Cadastrar(transportadora);
  ShowMessage('Transportadora cadastrado com sucesso!');
  LimparFormulario();
end;

procedure TFrmTransportadora.ValidaCpfCnpj;
var
  cnpjCpf: string;
begin
  cnpjCpf := soNumeros(edtCnpj.Text);
  if Length(cnpjCpf) > 11 then
  begin
    acbrvldr1.Documento := edtCnpj.Text;
    acbrvldr1.TipoDocto := docCNPJ;
    if not acbrvldr1.Validar then
    begin
      imgValidacao.Picture := imgWrongCNPJ.Picture;
      lblValidaCpfCnpj.Caption := acbrvldr1.MsgErro;
      lblValidaCpfCnpj.Font.Color := clRed;
      lblValidaCpfCnpj.Visible := True;

    end
    else
      imgValidacao.Picture := imgCheckCNPJ.Picture;
    if cnpjCpf.Length = 14 then
      edtCnpj.Text := acbrvldr1.Formatar;

  end
  else
  begin

    acbrvldr1.TipoDocto := docCPF;
    acbrvldr1.Documento := cnpjCpf;

    if not acbrvldr1.Validar then
    begin
      lblValidaCpfCnpj.Caption := acbrvldr1.MsgErro;
      lblValidaCpfCnpj.Font.Color := clRed;
      lblValidaCpfCnpj.Visible := True;
      imgValidacao.Picture := imgWrongCNPJ.Picture;
    end
    else
      imgValidacao.Picture := imgCheckCNPJ.Picture;
    if cnpjCpf.Length = 11 then
      edtCnpj.Text := acbrvldr1.Formatar;

  end;

end;

function TFrmTransportadora.validaFormulario: Boolean;
begin
  Result := True;
  if not validarNome then
  begin
    Result := False;
  end;
  if not (Length(edtCidade.Text) > 3) then
  begin
    Result := False;
    edtCidade.Hint := 'Informe uma cidade valida';

  end;
  if not (Length(edtEndereco.Text) > 2) then
  begin
    Result := False;
    edtEndereco.Hint := 'Informe um endereco valido';

  end;
  if edtCidade.Hint <> '' then
  begin
    lblValidaCidade.Caption := edtCidade.Hint;
    lblValidaCidade.Font.Color := clRed;
    lblValidaCidade.Visible := True;
  end;

  if edtEndereco.Hint <> '' then
  begin
    lblValidaEndereco.Caption := edtEndereco.Hint;
    lblValidaEndereco.Font.Color := clRed;
    lblValidaEndereco.Visible := True;
  end;

end;

procedure TFrmTransportadora.validarCampos;
var
  i: Integer;
begin
  for i := 0 to ComponentCount - 1 do
  begin
    if Components[i] is TEdit then
      if TEdit(Components[i]).Text = '' then
      begin
        ShowMessage('Existem campos em branco, verifique!');
        TEdit(Components[i]).SetFocus;
        exit
      end;

    if Components[i] is TComboBox then
      if TComboBox(Components[i]).Text = '' then
      begin
        lblValidaUf.Caption := 'Informe a UF';
        lblValidaUf.Font.Color := clRed;
        lblValidaUf.Visible := True;
        exit
      end;

  end;
end;

function TFrmTransportadora.validarNome: Boolean;
begin
  Result := True;
  edtNome.Hint := '';

  if not (Length(edtNome.Text) > 3) then
  begin
    result := False;
    edtNome.Hint := 'O nome deve conter mais de 3 caracteres ';
  end;
  if not (Pos(' ', edtNome.Text) > 0) then
  begin
    Result := False;
    edtNome.Hint := edtNome.Hint + 'deve informar nome completo'#13;
  end;
  if not (Pos(' ', edtNome.Text) < Length(edtNome.Text)) then
  begin
    Result := False;
    edtNome.Hint := edtNome.Hint + ' Deve informar nome e sobrenome!'
  end;

  if edtNome.Hint <> '' then
  begin
    lblValidaNome.Caption := edtNome.Hint;
    lblValidaNome.Font.Color := clRed;
    lblValidaNome.Visible := True;
  end;

end;

end.

