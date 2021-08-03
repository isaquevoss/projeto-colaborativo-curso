object frmVendedores: TfrmVendedores
  Left = 0
  Top = 0
  Caption = 'frmVendedores'
  ClientHeight = 299
  ClientWidth = 635
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
  object Button1: TButton
    Left = 488
    Top = 24
    Width = 121
    Height = 25
    Caption = 'Novo Vendedor'
    TabOrder = 0
    OnClick = Button1Click
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 80
    Width = 635
    Height = 219
    Align = alBottom
    DataSource = DmVendedor.dsVendedores
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object Button2: TButton
    Left = 376
    Top = 24
    Width = 75
    Height = 25
    Caption = 'Editar'
    TabOrder = 2
    OnClick = Button2Click
  end
end
