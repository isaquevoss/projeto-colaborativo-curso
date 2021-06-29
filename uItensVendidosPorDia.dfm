object frmItensVendidosPorDia: TfrmItensVendidosPorDia
  Left = 0
  Top = 0
  Caption = 'frmItensVendidosPorDia'
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
  object Label1: TLabel
    Left = 32
    Top = 32
    Width = 102
    Height = 13
    Caption = 'Descri'#231#227'o do Produto'
  end
  object Grid: TDBGrid
    Left = 0
    Top = 80
    Width = 635
    Height = 219
    Align = alBottom
    DataSource = DmItensVendidosPorDia.dsProdutos
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object EdDescricaoProduto: TEdit
    Left = 152
    Top = 29
    Width = 233
    Height = 21
    TabOrder = 1
    Text = 'EdDescricaoProduto'
  end
  object BtBuscar: TButton
    Left = 440
    Top = 27
    Width = 75
    Height = 25
    Caption = 'Buscar'
    TabOrder = 2
    OnClick = BtBuscarClick
  end
end
