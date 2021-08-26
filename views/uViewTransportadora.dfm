object viewTransportadora: TviewTransportadora
  Left = 0
  Top = 0
  Caption = 'viewTransportadora'
  ClientHeight = 340
  ClientWidth = 676
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object dbgrdTransportadora: TDBGrid
    Left = 0
    Top = 72
    Width = 513
    Height = 120
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object btnCarregar: TButton
    Left = 544
    Top = 80
    Width = 75
    Height = 25
    Caption = 'Carregar'
    TabOrder = 1
  end
  object DsTrasportadora: TDataSource
    Left = 424
    Top = 24
  end
end
