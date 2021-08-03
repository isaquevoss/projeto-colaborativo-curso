object frmLogin: TfrmLogin
  Left = 0
  Top = 0
  Caption = 'Login'
  ClientHeight = 234
  ClientWidth = 417
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lblUsuario: TLabel
    Left = 128
    Top = 45
    Width = 36
    Height = 13
    Caption = 'Usu'#225'rio'
  end
  object lblSenha: TLabel
    Left = 128
    Top = 89
    Width = 30
    Height = 13
    Caption = 'Senha'
  end
  object lblNovoUsuario: TLabel
    Left = 200
    Top = 213
    Width = 214
    Height = 13
    Caption = 'Clique aqui para cadastrar um usu'#225'rio'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = lblNovoUsuarioClick
  end
  object cbbUsuario: TComboBox
    Left = 128
    Top = 62
    Width = 145
    Height = 21
    Style = csDropDownList
    TabOrder = 0
    OnKeyDown = cbbUsuarioKeyDown
  end
  object edtSenha: TEdit
    Left = 128
    Top = 104
    Width = 145
    Height = 21
    PasswordChar = '*'
    TabOrder = 1
    OnKeyDown = edtSenhaKeyDown
    OnKeyPress = edtSenhaKeyPress
  end
  object btnEntrar: TButton
    Left = 96
    Top = 143
    Width = 75
    Height = 25
    Caption = 'Entrar'
    TabOrder = 2
    OnClick = btnEntrarClick
  end
  object btnCancelar: TButton
    Left = 248
    Top = 143
    Width = 75
    Height = 25
    Caption = 'Cancelar'
    TabOrder = 3
    OnClick = btnCancelarClick
  end
end
