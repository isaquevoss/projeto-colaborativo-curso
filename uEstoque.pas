unit uEstoque;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, uListagemEstoque;

type
  TfrmEstoque = class(TForm)
    pnlTela: TPanel;
    pnlOpcoes: TPanel;
    btnListagem: TButton;
    btnCadastro: TButton;
    procedure btnListagemClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEstoque: TfrmEstoque;

implementation

{$R *.dfm}

procedure TfrmEstoque.btnListagemClick(Sender: TObject);
begin
    FrmListagemEstoque.Parent := pnlTela;
    FrmListagemEstoque.Show();
end;


end.
