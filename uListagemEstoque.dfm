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
  object label1: TLabel
    Left = 380
    Top = 60
    Width = 49
    Height = 13
    Caption = 'Registros:'
  end
  object lblNumRegistro: TLabel
    Left = 431
    Top = 60
    Width = 6
    Height = 13
    Caption = '0'
    Visible = False
  end
  object grid: TDBGrid
    Left = 0
    Top = 80
    Width = 505
    Height = 196
    Align = alBottom
    DataSource = DmEstoque.dsEstoque
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDblClick = gridDblClick
    OnTitleClick = gridTitleClick
  end
  object edDescricao: TEdit
    Left = 5
    Top = 26
    Width = 492
    Height = 21
    MaxLength = 120
    TabOrder = 0
    TextHint = 'Digite o nome do Produto'
    OnChange = edDescricaoChange
    OnKeyDown = edDescricaoKeyDown
  end
end
