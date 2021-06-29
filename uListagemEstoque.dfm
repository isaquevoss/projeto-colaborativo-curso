object FrmListagemEstoque: TFrmListagemEstoque
  Left = 0
  Top = 0
  Caption = 'FrmListagemEstoque'
  ClientHeight = 276
  ClientWidth = 505
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object grid: TDBGrid
    Left = 0
    Top = 80
    Width = 505
    Height = 196
    Align = alBottom
    DataSource = DmEstoque.dsEstoque
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object edDescricao: TEdit
    Left = 8
    Top = 26
    Width = 241
    Height = 21
    TabOrder = 0
    TextHint = 'Digite o nome do Produto'
    OnKeyDown = edDescricaoKeyDown
  end
  object btnBuscar: TButton
    Left = 264
    Top = 24
    Width = 75
    Height = 25
    Caption = 'Buscar'
    TabOrder = 1
    OnClick = btnBuscarClick
  end
end
