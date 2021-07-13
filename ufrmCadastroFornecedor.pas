unit ufrmCadastroFornecedor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, uDmCadastroFornecedor, uFrmFornecedor;

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
    procedure FormShow(Sender: TObject);
    procedure btn_SalvaFornecedrClick(Sender: TObject);
    procedure btn_limparFrmFornecedrClick(Sender: TObject);

  private
    { Private declarations }
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

    try
      dmCadastroFornecedr.cadastrarFornecedor(edt_NomeFornecedr.Text, edt_FantasiaFornecedr.Text, edt_CnpjFornecedr.Text, edt_IeRgFornecedr.Text, edt_EnderFornecedr.Text);
      ShowMessage('Fornecedor cadastrado com sucesso!');
    Except on E: Exception do
      begin
        ShowMessage('Houve erros na gravação dos dados: '+E.Message);
      end;
    end;
end;

procedure TfrmCadastroFornecedr.FormShow(Sender: TObject);
begin
  limparFrmFornecedr();
end;

procedure TfrmCadastroFornecedr.limparFrmFornecedr;
var
  i: Integer;
begin
  for i := 0 to ComponentCount - 1 do
  begin
    if Components[I] is TEdit then
      TEdit( Components[I] ).Text := '';
  end;
end;

end.
