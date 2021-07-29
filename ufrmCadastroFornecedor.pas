unit ufrmCadastroFornecedor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, uDmCadastroFornecedor, uFrmFornecedor,
  uDmConexaoFB, uDmFornecedor, ACBrBase, ACBrValidador;

type
  TfrmCadastroFornecedr = class(TForm)
    lbl_CodigoFornecedr: TLabel;
    lbl_NomeFornecedr: TLabel;
    edt_NomeFornecedr: TEdit;
    lbl_FantasiaFornecedr: TLabel;
    edt_FantasiaFornecedr: TEdit;
    lbl_CnpjFornecedr: TLabel;
    edt_CnpjFornecedr: TEdit;
    lbl_IeFornecedr: TLabel;
    edt_IeRgFornecedr: TEdit;
    lbl_EnderFornecedr: TLabel;
    edt_EnderFornecedr: TEdit;
    btn_SalvaFornecedr: TButton;
    btn_limparFrmFornecedr: TButton;
    Label1: TLabel;
    ACBrValidador1: TACBrValidador;
    ComboBox1: TComboBox;
    lbnome: TLabel;
    procedure FormShow(Sender: TObject);
    procedure btn_SalvaFornecedrClick(Sender: TObject);
    procedure btn_limparFrmFornecedrClick(Sender: TObject);
    procedure proximoCodigoForn(var proxCodigo : string);
    procedure edt_CnpjFornecedrChange(Sender: TObject);
    procedure edCnpjCpfExit(Sender: TObject);
     private
    function formValido(): Boolean;
    function validarNome(): Boolean;
  public
    { Public declarations }
    procedure limparFrmFornecedr();
  end;

var
  frmCadastroFornecedr: TfrmCadastroFornecedr;

implementation

{$R *.dfm}



procedure TfrmCadastroFornecedr.btn_limparFrmFornecedrClick(Sender: TObject);
begin
  limparFrmFornecedr();
end;

procedure TfrmCadastroFornecedr.btn_SalvaFornecedrClick(Sender: TObject);
var
  i: Integer;
begin
    for i := 0 to ComponentCount - 1 do
    begin
      if Components[I] is TEdit then
        if TEdit( Components[I] ).Text = '' then
        begin   
          ShowMessage('Existem campos em branco, verifique!');
          exit
        end;
    end;
    if not formValido then
begin
  ShowMessage('Formulario com dados inconsistentes');
  Exit
end;
    try
      dmCadastroFornecedr.cadastrarFornecedor(StrToInt(lbl_CodigoFornecedr.Caption), edt_NomeFornecedr.Text, edt_FantasiaFornecedr.Text, edt_CnpjFornecedr.Text, edt_IeRgFornecedr.Text, edt_EnderFornecedr.Text);
      ShowMessage('Fornecedor cadastrado com sucesso!');
    Except on E: Exception do
      begin
        ShowMessage('Houve erros na gravação dos dados: '+E.Message);
      end;
    end;
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

procedure TfrmCadastroFornecedr.edt_CnpjFornecedrChange(Sender: TObject);

begin
  if soNumeros(edt_CnpjFornecedr.Text).Length > 11 then
    ComboBox1.ItemIndex := 1
  else
    ComboBox1.ItemIndex := 0;

end;

procedure TfrmCadastroFornecedr.edCnpjCpfExit(Sender: TObject);

var
  cnpjCpf: string;
begin

//  cnpjCpf := edCnpjCpf.Text;

  cnpjCpf := soNumeros(edt_CnpjFornecedr.Text);

  if Length(cnpjCpf) > 11 then
  begin

    ACBrValidador1.TipoDocto := docCNPJ;
    ACBrValidador1.Documento := cnpjCpf;
    if not ACBrValidador1.Validar then
    begin
      ShowMessage(ACBrValidador1.MsgErro);
    end;
    if cnpjCpf.Length = 14 then
      edt_CnpjFornecedr.Text := ACBrValidador1.Formatar;
  end
  else
  begin
    ACBrValidador1.TipoDocto := docCPF;
    ACBrValidador1.Documento := cnpjCpf;
    if not ACBrValidador1.Validar then
    begin
      ShowMessage(ACBrValidador1.MsgErro);
    end;
    if cnpjCpf.Length = 11 then
      edt_CnpjFornecedr.Text := ACBrValidador1.Formatar;
  end;
end;

procedure TfrmCadastroFornecedr.FormShow(Sender: TObject);
var proxCodigo :string;
begin
  limparFrmFornecedr();
  proximoCodigoForn(proxCodigo);
  lbnome.Visible :=False;
end;

function TfrmCadastroFornecedr.formValido: Boolean;
var
  teste: Boolean;
begin
Result := True;

  if not validarNome then
    Result := false;

  if edt_NomeFornecedr.Text = '' then
    Result := False;

end;


procedure TfrmCadastroFornecedr.limparFrmFornecedr;
var
  i: Integer;
begin
  for i := 0 to ComponentCount - 1 do
  begin
    if Components[I] is TEdit then
      TEdit( Components[I] ).Text := '';
      lbnome.Visible:= False
  end;
end;

procedure TfrmCadastroFornecedr.proximoCodigoForn(var proxCodigo : string);
begin
  if not DmConexaoFB.Conexao.Connected then
    DmConexaoFB.conectarBanco();

  dmFornecedor.proximoCodigo(proxCodigo);
  lbl_CodigoFornecedr.Caption := proxCodigo;
end;

function TfrmCadastroFornecedr.validarNome: Boolean;
begin
 Result := true;
 lbnome.Visible := True;

  if not (Length(edt_NomeFornecedr.Text) > 3) then
  begin
    Result := false;
    lbnome.Caption := 'NOME DEVE CONTER MAIS QUE 3 CARACTERES';
    lbnome.Font.Color :=clRed;
    Exit;

  end;

  if not (Pos(' ', edt_NomeFornecedr.Text) > 0) then
  begin
   Result := false;
    lbnome.caption := 'INFORME O NOME COMPLETO';
    lbnome.Font.Color :=clRed;
    Exit;

  end;
  if edt_NomeFornecedr.hint <> '' then
  begin
    edt_NomeFornecedr.ShowHint := true;
    lbnome.Caption := edt_NomeFornecedr.hint;
    lbnome.Font.Color := clRed;
    lbnome.Visible := true;


    end;

  end;

end.
