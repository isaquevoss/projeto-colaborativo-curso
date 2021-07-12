unit uEstoque;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, uListagemEstoque, uCadastroEstoque, uDmEstoque;

type
  TfrmEstoque = class(TForm)
    pnlTela: TPanel;
    pnlOpcoes: TPanel;
    btnListagem: TButton;
    btnCadastro: TButton;
    procedure btnListagemClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnCadastroClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    procedure mostrarListagem();
    procedure mostrarCadastro();
  public
    { Public declarations }
  end;

var
  frmEstoque: TfrmEstoque;

implementation

{$R *.dfm}

procedure TfrmEstoque.btnCadastroClick(Sender: TObject);
begin
  mostrarCadastro();
end;

procedure TfrmEstoque.btnListagemClick(Sender: TObject);
begin
  if frmCadastroEstoque.Visible then
    frmCadastroEstoque.Close();

  mostrarListagem();
end;


procedure TfrmEstoque.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if frmCadastroEstoque.Visible then
  begin
    frmCadastroEstoque.Close();
  end;
end;

procedure TfrmEstoque.FormShow(Sender: TObject);
begin
  mostrarListagem();
end;

procedure TfrmEstoque.mostrarCadastro;
begin
  frmCadastroEstoque.Parent := pnlTela;
  frmCadastroEstoque.Show();
end;

procedure TfrmEstoque.mostrarListagem;
begin
  DmEstoque.qrEstoque.Close();
  FrmListagemEstoque.Parent := pnlTela;
  FrmListagemEstoque.Show();
end;

end.
