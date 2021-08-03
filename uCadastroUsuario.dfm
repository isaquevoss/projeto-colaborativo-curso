object CadastroUsuario: TCadastroUsuario
  Left = 0
  Top = 0
  Caption = 'CadastroUsuario'
  ClientHeight = 211
  ClientWidth = 232
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object lblUsuario: TLabel
    Left = 53
    Top = 21
    Width = 36
    Height = 13
    Caption = 'Usuario'
  end
  object lblSenha: TLabel
    Left = 53
    Top = 80
    Width = 30
    Height = 13
    Caption = 'Senha'
  end
  object edtUsuario: TEdit
    Left = 53
    Top = 40
    Width = 121
    Height = 21
    TabOrder = 0
  end
  object edtSenha: TEdit
    Left = 53
    Top = 99
    Width = 121
    Height = 21
    PasswordChar = '*'
    TabOrder = 1
  end
  object btnGravar: TButton
    Left = 24
    Top = 160
    Width = 75
    Height = 25
    Caption = 'Gravar'
    TabOrder = 2
    OnClick = btnGravarClick
  end
  object btnCancelar: TButton
    Left = 136
    Top = 160
    Width = 75
    Height = 25
    Caption = 'Cancelar'
    TabOrder = 3
    OnClick = btnCancelarClick
  end
end
