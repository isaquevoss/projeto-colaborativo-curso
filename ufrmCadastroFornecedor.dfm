object frmCadastroFornecedr: TfrmCadastroFornecedr
  Left = 0
  Top = 0
  Caption = 'Cadastrar Fornecedor'
  ClientHeight = 290
  ClientWidth = 360
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lbl_CodigoFornecedr: TLabel
    Left = 77
    Top = 15
    Width = 47
    Height = 19
    Caption = 'NOVO'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lbl_NomeFornecedr: TLabel
    Left = 16
    Top = 56
    Width = 31
    Height = 13
    Caption = 'Nome:'
  end
  object lbl_FantasiaFornecedr: TLabel
    Left = 16
    Top = 88
    Width = 45
    Height = 13
    Caption = 'Fantasia:'
  end
  object lbl_CnpjFornecedr: TLabel
    Left = 16
    Top = 120
    Width = 52
    Height = 13
    Caption = 'CNPJ/CPF:'
  end
  object lbl_IeFornecedr: TLabel
    Left = 16
    Top = 152
    Width = 32
    Height = 13
    Caption = 'IE/RG:'
  end
  object lbl_EnderFornecedr: TLabel
    Left = 16
    Top = 184
    Width = 49
    Height = 13
    Caption = 'Endere'#231'o:'
  end
  object Label1: TLabel
    Left = 16
    Top = 19
    Width = 37
    Height = 13
    Caption = 'C'#243'digo:'
  end
  object edt_NomeFornecedr: TEdit
    Left = 77
    Top = 53
    Width = 252
    Height = 21
    TabOrder = 0
  end
  object edt_FantasiaFornecedr: TEdit
    Left = 77
    Top = 85
    Width = 252
    Height = 21
    TabOrder = 1
  end
  object edt_CnpjFornecedr: TEdit
    Left = 74
    Top = 122
    Width = 124
    Height = 21
    TabOrder = 2
    OnChange = edt_CnpjFornecedrChange
    OnExit = edCnpjCpfExit
  end
  object edt_IeRgFornecedr: TEdit
    Left = 77
    Top = 149
    Width = 124
    Height = 21
    TabOrder = 3
  end
  object edt_EnderFornecedr: TEdit
    Left = 77
    Top = 181
    Width = 252
    Height = 21
    TabOrder = 4
  end
  object btn_SalvaFornecedr: TButton
    Left = 16
    Top = 216
    Width = 313
    Height = 29
    Caption = 'Salvar'
    TabOrder = 5
    OnClick = btn_SalvaFornecedrClick
  end
  object btn_limparFrmFornecedr: TButton
    Left = 16
    Top = 251
    Width = 313
    Height = 31
    Caption = 'Limpar o formulario'
    TabOrder = 6
    OnClick = btn_limparFrmFornecedrClick
  end
  object ComboBox1: TComboBox
    Left = 232
    Top = 122
    Width = 57
    Height = 21
    Style = csDropDownList
    TabOrder = 7
    Items.Strings = (
      'Cpf'
      'Cnpj')
  end
  object ACBrValidador1: TACBrValidador
    IgnorarChar = './-'
    Left = 320
    Top = 112
  end
end
