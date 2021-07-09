unit uFrmTransportadora;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, uDmTrasnportadora;

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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmTransportadora: TFrmTransportadora;

implementation

{$R *.dfm}

end.
