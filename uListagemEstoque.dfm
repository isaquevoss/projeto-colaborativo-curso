object FrmListagemEstoque: TFrmListagemEstoque
  Left = 0
  Top = 0
  Align = alClient
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'FrmListagemEstoque'
  ClientHeight = 315
  ClientWidth = 676
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
  object lblRegistros: TLabel
    Left = 380
    Top = 60
    Width = 49
    Height = 13
    Caption = 'Registros:'
    Visible = False
  end
  object lblNumRegistro: TLabel
    Left = 431
    Top = 60
    Width = 6
    Height = 13
    Caption = '0'
    Visible = False
  end
  object lblNenhumProdEncontrado: TLabel
    Left = 8
    Top = 6
    Width = 489
    Height = 13
    Align = alCustom
    Alignment = taCenter
    Caption = 'lblNenhumProdEncontrado'
    Visible = False
  end
  object grid: TDBGrid
    Left = 0
    Top = 79
    Width = 676
    Height = 236
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
  object timerBusca: TTimer
    Enabled = False
    Interval = 1500
    OnTimer = timerBuscaTimer
    Left = 440
    Top = 128
  end
end
