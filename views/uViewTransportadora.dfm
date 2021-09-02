object viewTransportadora: TviewTransportadora
  Left = 0
  Top = 0
  Caption = 'viewTransportadora'
  ClientHeight = 328
  ClientWidth = 617
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
    Top = 58
    Width = 617
    Height = 120
    DataSource = DsTrasportadora
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object btnCarregar: TButton
    Left = 519
    Top = 27
    Width = 75
    Height = 25
    Caption = 'Carregar'
    TabOrder = 1
    OnClick = btnCarregarClick
  end
  object strTransportadora: TStringGrid
    Left = 0
    Top = 184
    Width = 617
    Height = 144
    Align = alBottom
    TabOrder = 2
  end
  object DsTrasportadora: TDataSource
    Left = 312
    Top = 16
  end
end
