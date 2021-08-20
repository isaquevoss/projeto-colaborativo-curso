object viewVendedor: TviewVendedor
  Left = 0
  Top = 0
  Caption = 'viewVendedor'
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
  object StringGrid1: TStringGrid
    Left = 0
    Top = 168
    Width = 635
    Height = 131
    Align = alBottom
    TabOrder = 0
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 42
    Width = 521
    Height = 120
    DataSource = DataSource1
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object Button1: TButton
    Left = 535
    Top = 96
    Width = 75
    Height = 25
    Caption = 'Carregar'
    TabOrder = 2
    OnClick = Button1Click
  end
  object DataSource1: TDataSource
    Left = 368
    Top = 16
  end
end
