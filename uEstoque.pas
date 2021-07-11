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
  private
    procedure mostrarListagem();
  public
    { Public declarations }
  end;

var
  frmEstoque: TfrmEstoque;

implementation

{$R *.dfm}

procedure TfrmEstoque.btnCadastroClick(Sender: TObject);
begin
  if frmCadastroEstoque.ShowModal = mrOk then
    begin
      DmEstoque.carregarEstoque();
    end;

  if frmCadastroEstoque.ShowModal = mrCancel then
    begin
      DmEstoque.qrEstoque.Close();
    end;
end;

procedure TfrmEstoque.btnListagemClick(Sender: TObject);
begin
  mostrarListagem();
end;


procedure TfrmEstoque.FormShow(Sender: TObject);
begin
  mostrarListagem();
end;

procedure TfrmEstoque.mostrarListagem;
begin
    FrmListagemEstoque.Parent := pnlTela;
    FrmListagemEstoque.Show();
end;

end.
