object FrmFornecedor: TFrmFornecedor
  Left = 0
  Top = 0
  Caption = 'Fornecedor'
  ClientHeight = 299
  ClientWidth = 502
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object lbl_Busca: TLabel
    Left = 8
    Top = 29
    Width = 151
    Height = 13
    Caption = 'Busca por nome do fornecedor:'
  end
  object lbl_qtdRegistros: TLabel
    Left = 352
    Top = 69
    Width = 58
    Height = 13
    Caption = 'Registros: 0'
  end
  object Grid_Fornecedor: TDBGrid
    Left = 8
    Top = 88
    Width = 489
    Height = 208
    DataSource = dmFornecedor.ds_Fornecedr
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object edt_BuscaFornedr: TEdit
    Left = 8
    Top = 48
    Width = 201
    Height = 21
    TabOrder = 1
    OnChange = edt_BuscaFornedrChange
  end
  object tmr_Busca_Forncedr: TTimer
    Enabled = False
    Interval = 1700
    OnTimer = tmr_Busca_ForncedrTimer
    Left = 296
    Top = 16
  end
end
