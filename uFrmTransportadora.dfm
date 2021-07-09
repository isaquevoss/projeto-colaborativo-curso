object FrmTransportadora: TFrmTransportadora
  Left = 0
  Top = 0
  Caption = 'FrmTransportadora'
  ClientHeight = 299
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object lblNome: TLabel
    Left = 10
    Top = 16
    Width = 27
    Height = 13
    Caption = 'Nome'
  end
  object lblEndereco: TLabel
    Left = 10
    Top = 73
    Width = 45
    Height = 13
    Caption = 'Endereco'
  end
  object lblCidade: TLabel
    Left = 10
    Top = 100
    Width = 33
    Height = 13
    Caption = 'Cidade'
  end
  object lblUF: TLabel
    Left = 10
    Top = 128
    Width = 13
    Height = 13
    Caption = 'UF'
  end
  object lblTelefone: TLabel
    Left = 10
    Top = 154
    Width = 42
    Height = 13
    Caption = 'Telefone'
  end
  object lblEmail: TLabel
    Left = 10
    Top = 182
    Width = 24
    Height = 13
    Caption = 'Email'
  end
  object lblRntrc: TLabel
    Left = 10
    Top = 213
    Width = 34
    Height = 13
    Caption = 'RNTRC'
  end
  object lblCnpj: TLabel
    Left = 10
    Top = 46
    Width = 22
    Height = 13
    Caption = 'Cnpj'
  end
  object edtNome: TEdit
    Left = 63
    Top = 16
    Width = 305
    Height = 21
    TabOrder = 0
  end
  object edtCnpj: TEdit
    Left = 63
    Top = 46
    Width = 157
    Height = 21
    TabOrder = 1
  end
  object edtEndereco: TEdit
    Left = 63
    Top = 73
    Width = 305
    Height = 21
    TabOrder = 2
  end
  object edtCidade: TEdit
    Left = 63
    Top = 100
    Width = 121
    Height = 21
    TabOrder = 3
  end
  object cbxUF: TComboBox
    Left = 63
    Top = 128
    Width = 53
    Height = 21
    TabOrder = 4
    Text = 'cbxUF'
    Items.Strings = (
      'AC'
      'AL'
      'AM'
      'AP'
      'BA'
      'CE'
      'DF'
      'ES'
      'EX'
      'GO'
      'MA'
      'MG'
      'MS'
      'MT'
      'PA'
      'PB'
      'PE'
      'PI'
      'PR'
      'RJ'
      'RN'
      'RO'
      'RR'
      'RS'
      'SC'
      'SE'
      'SP'
      'TO')
  end
  object edtTelefone: TEdit
    Left = 63
    Top = 155
    Width = 121
    Height = 21
    TabOrder = 5
  end
  object edtEmail: TEdit
    Left = 63
    Top = 182
    Width = 305
    Height = 21
    TabOrder = 6
  end
  object edtRntrc: TEdit
    Left = 63
    Top = 213
    Width = 121
    Height = 21
    TabOrder = 7
  end
  object btnSalvar: TButton
    Left = 384
    Top = 232
    Width = 75
    Height = 25
    Caption = 'Salvar'
    TabOrder = 8
  end
end
