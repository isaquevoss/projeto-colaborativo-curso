object frmCadastroFornecedr: TfrmCadastroFornecedr
  Left = 0
  Top = 0
  Caption = 'Cadastrar Fornecedor'
  ClientHeight = 371
  ClientWidth = 429
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
    Left = 53
    Top = 56
    Width = 31
    Height = 13
    Caption = 'Nome:'
  end
  object lbl_FantasiaFornecedr: TLabel
    Left = 39
    Top = 96
    Width = 45
    Height = 13
    Caption = 'Fantasia:'
  end
  object lbl_CnpjFornecedr: TLabel
    Left = 39
    Top = 139
    Width = 52
    Height = 13
    Caption = 'CNPJ/CPF:'
  end
  object lbl_IeFornecedr: TLabel
    Left = 39
    Top = 189
    Width = 32
    Height = 13
    Caption = 'IE/RG:'
  end
  object lbl_EnderFornecedr: TLabel
    Left = 39
    Top = 232
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
  object lbnome: TLabel
    Left = 101
    Top = 80
    Width = 34
    Height = 13
    Caption = 'lbnome'
    Color = clBtnFace
    ParentColor = False
    Visible = False
  end
  object edt_NomeFornecedr: TEdit
    Left = 101
    Top = 53
    Width = 252
    Height = 21
    TabOrder = 0
  end
  object edt_FantasiaFornecedr: TEdit
    Left = 101
    Top = 93
    Width = 252
    Height = 21
    TabOrder = 1
  end
  object edt_CnpjFornecedr: TEdit
    Left = 97
    Top = 136
    Width = 124
    Height = 21
    TabOrder = 2
    OnChange = edt_CnpjFornecedrChange
    OnExit = edCnpjCpfExit
  end
  object edt_IeRgFornecedr: TEdit
    Left = 94
    Top = 186
    Width = 124
    Height = 21
    TabOrder = 3
  end
  object edt_EnderFornecedr: TEdit
    Left = 94
    Top = 229
    Width = 252
    Height = 21
    TabOrder = 4
  end
  object btn_SalvaFornecedr: TButton
    Left = 56
    Top = 272
    Width = 313
    Height = 29
    Caption = 'Salvar'
    TabOrder = 5
    OnClick = btn_SalvaFornecedrClick
  end
  object btn_limparFrmFornecedr: TButton
    Left = 56
    Top = 315
    Width = 313
    Height = 31
    Caption = 'Limpar o formulario'
    TabOrder = 6
    OnClick = btn_limparFrmFornecedrClick
  end
  object ComboBox1: TComboBox
    Left = 240
    Top = 136
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
    Left = 384
    Top = 152
  end
end
