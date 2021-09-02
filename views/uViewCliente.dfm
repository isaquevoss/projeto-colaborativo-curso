object viewClientes: TviewClientes
  Left = 0
  Top = 0
  Caption = 'View Clientes'
  ClientHeight = 263
  ClientWidth = 525
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object btCarregarClient: TButton
    Left = 8
    Top = 24
    Width = 145
    Height = 25
    Caption = 'Carregar'
    TabOrder = 0
    OnClick = btCarregarClientClick
  end
  object gridClientes: TDBGrid
    Left = 8
    Top = 72
    Width = 509
    Height = 177
    DataSource = dsCliente
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object dsCliente: TDataSource
    Left = 472
    Top = 16
  end
end
