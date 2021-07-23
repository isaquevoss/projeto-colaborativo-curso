 unit uFrmValidarFormulario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls, Vcl.ComCtrls;

type
  TfrmValidarFormulario = class(TForm)
    EdNome: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    ComboBox1: TComboBox;
    DateTimePicker1: TDateTimePicker;
    Button1: TButton;
    lbvalidNome: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure EditisChange(Sender: TObject);
  private
    function formValido(): Boolean;
    function validarNome(): Boolean;
  public
    procedure limparFormulario();
    procedure gravar();
  end;

var
  frmValidarFormulario: TfrmValidarFormulario;

implementation

{$R *.dfm}

{ TfrmValidarFormulario }

procedure TfrmValidarFormulario.Button1Click(Sender: TObject);
begin
  gravar();
end;

procedure TfrmValidarFormulario.EditisChange(Sender: TObject);
begin
  formValido;
end;

function TfrmValidarFormulario.formValido: Boolean;
var
  teste: Boolean;
begin
  Result := True;

  if not validarNome then
    Result := false;

  if Edit2.Text = '' then
    Result := False;

  if ComboBox1.ItemIndex < 0 then
    Result := False;

end;

procedure TfrmValidarFormulario.gravar;
begin
  if not formValido then
  begin
    ShowMessage('formulário inválido');
    exit;
  end;

  ShowMessage('formulário válido');
end;

procedure TfrmValidarFormulario.limparFormulario;
var
  i: integer;
begin
  for i := 0 to Components.ComponentCount - 1 do


end;

function TfrmValidarFormulario.validarNome: Boolean;
begin
  Result := true;
  EdNome.Hint := '';
  lbvalidNome.Visible := False;

  if not (Length(EdNome.Text) > 3) then
  begin
    Result := false;
    EdNome.Hint := 'NOME DEVE CONTER MAIS QUE 3 CARACTERES';
//    ShowMessage('not Length( EdNome.Text ) > 3 ');
  end;

  if not (Pos(' ', EdNome.Text) > 0) then
  begin
    Result := false;
    EdNome.Hint := EdNome.Hint + 'DEVE INFORMAR NOME COMPLETO';
//    ShowMessage('not Pos(" ", EdNome.Text) > 1');
  end;

  if not (Pos(' ', EdNome.Text) < Length(EdNome.text)) then
  begin
    Result := false;
    EdNome.Hint := EdNome.Hint + 'DEVE INFORMAR NOME COMPLETO';
  end;

  if EdNome.Hint <> '' then
  begin
    EdNome.ShowHint := true;
    lbvalidNome.Caption := EdNome.Hint;
    lbvalidNome.Font.Color := clRed;
    lbvalidNome.Visible := true;

  end;
//    EdNome.ShowHint := TRUE;

end;

end.

