unit uCadastroCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, udmClientes,
  ACBrBase, ACBrValidador;

type
  TfrmCadastroCliente = class(TForm)
    Edit_nomeCliente: TEdit;
    Lbl_nomeCliente: TLabel;
    Edit_CpfCnpj: TEdit;
    lbl_dataCadastro: TLabel;
    btn_CadastrarCliente: TButton;
    btn_VoltarCliente: TButton;
    Edit_DataCadastro: TEdit;
    ACBrValidador: TACBrValidador;
    Label2: TLabel;
    procedure btn_CadastrarClienteClick(Sender: TObject);
    procedure btn_VoltarClienteClick(Sender: TObject);
    procedure Edit_CpfCnpjExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function soNumeros(_texto: string): string;
    procedure limparClientes();
  end;

var
  frmCadastroCliente: TfrmCadastroCliente;

implementation

{$R *.dfm}

procedure TfrmCadastroCliente.btn_CadastrarClienteClick(Sender: TObject);
var
  i: Integer;
begin
  for i := 0 to ComponentCount - 1 do
  begin
    if Components[i] is TEdit then
      if TEdit(Components[i]).Text = '' then
      begin
        ShowMessage('Existem campos em branco, verifique!');
        exit
      end;
  end;

  try
    Dmclientes.cadastrarCliente(Edit_nomeCliente.Text, Edit_DataCadastro.Text);
    ShowMessage('Cadastro efetuado com sucesso!');
    limparClientes();
  except
    on E: Exception do
      ShowMessage('Houve erros na gravação dos dados: ' + E.Message);
  end;

end;

procedure TfrmCadastroCliente.btn_VoltarClienteClick(Sender: TObject);
begin
  close();
end;

procedure TfrmCadastroCliente.Edit_CpfCnpjExit(Sender: TObject);
var
  cnpj_Cpf: string;
begin
  cnpj_Cpf := soNumeros(Edit_CpfCnpj.Text);

  if Length(cnpj_Cpf) > 11 then
  begin

    ACBrValidador.TipoDocto := docCNPJ;
    ACBrValidador.Documento := cnpj_Cpf;
    if not ACBrValidador.Validar then
    begin
      ShowMessage(ACBrValidador.MsgErro);
    end;
    if cnpj_Cpf.Length = 14 then
      Edit_CpfCnpj.Text := ACBrValidador.Formatar;
  end
  else
  begin
    ACBrValidador.TipoDocto := docCPF;
    ACBrValidador.Documento := cnpj_Cpf;
    if not ACBrValidador.Validar then
    begin
      ShowMessage(ACBrValidador.MsgErro);
    end;
    if cnpj_Cpf.Length = 11 then
      Edit_CpfCnpj.Text := ACBrValidador.Formatar;
  end;

end;

procedure TfrmCadastroCliente.FormShow(Sender: TObject);
begin
  limparClientes();
end;

procedure TfrmCadastroCliente.limparClientes;
var
  i: Integer;
begin
  for i := 0 to ComponentCount - 1 do
  begin
    if Components[I] is TEdit then
      TEdit( Components[I] ).Text := '';
  end;
end;

function TfrmCadastroCliente.soNumeros(_texto: string): string;
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

end.
