unit uFrmTransportadora;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, uDmTransportadora, uFrmListaTransportadora,
  ACBrBase, ACBrValidador;

type
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
    procedure btnSalvarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure edtCnpjExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure LimparFormulario();
    procedure ValidaCpfCnpj();

  end;

var
  FrmTransportadora: TFrmTransportadora;

implementation

{$R *.dfm}

procedure TFrmTransportadora.btnCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmTransportadora.btnSalvarClick(Sender: TObject);
var
  i: Integer;
begin
    for i := 0 to ComponentCount - 1 do
    begin
      if Components[I] is TEdit then
        if TEdit( Components[I] ).Text = '' then
        begin
          ShowMessage('Existem campos em branco, verifique!');
           TEdit( Components[I] ).SetFocus;
          exit
        end;

      if Components[I] is TComboBox then
        if TComboBox( Components[I] ).Text = '' then
        begin
          ShowMessage('A UF está em branco, verifique!');
          TComboBox( Components[I] ).SetFocus;
          exit
        end;

    end;


    try
      DmTransportadora.Cadastrar(edtNome.Text,edtEndereco.Text,edtCidade.Text,cbxUF.Text,edtTelefone.Text,edtEmail.Text,edtCnpj.Text,edtRntrc.Text);
      ShowMessage('Transportadora cadastrado com sucesso!');
      LimparFormulario();
      // Atualizando a Label REGISTROS, e atualizando o grid com a transportadora nova
      DmTransportadora.CarregarTransportadora;
      frmListaTransportadora.lbl_qtdRegistros.Caption := 'Registros: '+ IntToStr(DmTransportadora.qrTransportadora.RecordCount);
    Except on E: Exception do
      begin
        ShowMessage('Houve erros na gravação dos dados: '+E.Message);
      end;
    end;


end;

procedure TFrmTransportadora.edtCnpjExit(Sender: TObject);
begin
  ValidaCpfCnpj();
end;

procedure TFrmTransportadora.FormShow(Sender: TObject);
begin
 LimparFormulario();
end;

procedure TFrmTransportadora.LimparFormulario;
var
  i: Integer;
begin
  for i := 0 to ComponentCount -1 do
    begin
      if Components[i] is TEdit then
      TEdit(Components[i]).Text := '';

    end;

  cbxUF.ItemIndex := -1;

end;


procedure TFrmTransportadora.ValidaCpfCnpj;
var cnpjCpf : string;
begin
cnpjCpf := edtCnpj.Text;
   if Length(cnpjCpf)>11 then
   begin
    acbrvldr1.Documento := edtCnpj.Text;
    acbrvldr1.TipoDocto:= docCNPJ;
      if not acbrvldr1.Validar then
      begin
        ShowMessage('CNPJ inválido!');
        edtCnpj.SetFocus;
      end;
      if cnpjCpf.Length = 14 then
      edtCnpj.Text := acbrvldr1.Formatar;

  end
  else
   begin

    acbrvldr1.TipoDocto := docCPF;
    acbrvldr1.Documento := cnpjCpf;


   if not acbrvldr1.Validar then
    begin
      ShowMessage('CPF inválido!');
      edtCnpj.SetFocus;
    end;
    if cnpjCpf.Length = 11 then
    edtCnpj.Text := acbrvldr1.Formatar;

  end;

end;

end.
