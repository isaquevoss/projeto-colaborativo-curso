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
    cbxCpfCnpj: TComboBox;
    ACBrValidador: TACBrValidador;
    Label1: TLabel;
    Label2: TLabel;
    procedure btn_CadastrarClienteClick(Sender: TObject);
    procedure btn_VoltarClienteClick(Sender: TObject);
    procedure cbxCpfCnpjSelect(Sender: TObject);
    procedure Edit_CpfCnpjChange(Sender: TObject);
    procedure Edit_CpfCnpjExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadastroCliente: TfrmCadastroCliente;

implementation

{$R *.dfm}

procedure TfrmCadastroCliente.btn_CadastrarClienteClick(Sender: TObject);
begin
  Dmclientes.cadastrarCliente(Edit_nomeCliente.Text, Edit_DataCadastro.Text);
end;

procedure TfrmCadastroCliente.btn_VoltarClienteClick(Sender: TObject);
begin
  close();
end;

procedure TfrmCadastroCliente.cbxCpfCnpjSelect(Sender: TObject);
begin
  if cbxCpfCnpj.ItemIndex = -1 then
    Edit_CpfCnpj.Enabled := False
  else
    Edit_CpfCnpj.Enabled := true;

  Edit_CpfCnpj.Text := '';
end;

procedure TfrmCadastroCliente.Edit_CpfCnpjChange(Sender: TObject);
begin
  if cbxCpfCnpj.ItemIndex = 0 then
  begin
    Edit_CpfCnpj.MaxLength := 14;

    if length(Edit_CpfCnpj.Text) = 3 then
    begin
      Edit_CpfCnpj.Text := Edit_CpfCnpj.Text + '.';
      Edit_CpfCnpj.SelStart := length(Edit_CpfCnpj.Text);
    end;

    if length(Edit_CpfCnpj.Text) = 7 then
    begin
      Edit_CpfCnpj.Text := Edit_CpfCnpj.Text + '.';
      Edit_CpfCnpj.SelStart := length(Edit_CpfCnpj.Text);
    end;

    if length(Edit_CpfCnpj.Text) = 11 then
    begin
      Edit_CpfCnpj.Text := Edit_CpfCnpj.Text + '-';
      Edit_CpfCnpj.SelStart := length(Edit_CpfCnpj.Text);
    end;
  end;

  if cbxCpfCnpj.ItemIndex = 1 then
  begin
    Edit_CpfCnpj.MaxLength := 18;

    if length(Edit_CpfCnpj.Text) = 2 then
    begin
      Edit_CpfCnpj.Text := Edit_CpfCnpj.Text + '.';
      Edit_CpfCnpj.SelStart := length(Edit_CpfCnpj.Text);
    end;

    if length(Edit_CpfCnpj.Text) = 6 then
    begin
      Edit_CpfCnpj.Text := Edit_CpfCnpj.Text + '.';
      Edit_CpfCnpj.SelStart := length(Edit_CpfCnpj.Text);
    end;

    if length(Edit_CpfCnpj.Text) = 10 then
    begin
      Edit_CpfCnpj.Text := Edit_CpfCnpj.Text + '/';
      Edit_CpfCnpj.SelStart := length(Edit_CpfCnpj.Text);
    end;

    if length(Edit_CpfCnpj.Text) = 15 then
    begin
      Edit_CpfCnpj.Text := Edit_CpfCnpj.Text + '-';
      Edit_CpfCnpj.SelStart := length(Edit_CpfCnpj.Text);
    end;
  end;
end;

procedure TfrmCadastroCliente.Edit_CpfCnpjExit(Sender: TObject);
begin
  if length(Edit_CpfCnpj.Text) = 18 then
  begin
    ACBrValidador.Documento := Edit_CpfCnpj.Text;
    ACBrValidador.TipoDocto := docCNPJ;

    if not ACBrValidador.Validar then
    begin
      ShowMessage('CNPJ inválido!');
      Edit_CpfCnpj.SetFocus;
    end;
  end;

  if length(Edit_CpfCnpj.Text) = 14 then
  begin
    ACBrValidador.Documento := Edit_CpfCnpj.Text;
    ACBrValidador.TipoDocto := docCPF;

    if not ACBrValidador.Validar then
    begin
      ShowMessage('CPF inválido!');
      Edit_CpfCnpj.SetFocus;
    end;
  end;
end;

end.
