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
    Top = 21
    Width = 41
    Height = 16
    Caption = 'Nome'
  end
  object lblEndereco: TLabel
    Left = 10
    Top = 74
    Width = 45
    Height = 13
    Caption = 'Endereco'
  end
  object lblCidade: TLabel
    Left = 10
    Top = 98
    Width = 33
    Height = 15
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
    Top = 153
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
    Top = 48
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
    Text = 'edtCnpj'
  end
  object edtEndereco: TEdit
    Left = 64
    Top = 75
    Width = 305
    Height = 21
    TabOrder = 2
    Text = 'edtEndereco'
  end
end
