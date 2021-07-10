unit ufrmCadastroFornecedor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

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
    Edit1: TEdit;
    lbl_EnderFornecedr: TLabel;
    Edit2: TEdit;
    btn_SalvaFornecedr: TButton;
    btn_CancelarFornecedr: TButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadastroFornecedr: TfrmCadastroFornecedr;

implementation

{$R *.dfm}



end.
