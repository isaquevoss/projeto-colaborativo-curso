object FrmFornecedor: TFrmFornecedor
  Left = 0
  Top = 0
  Caption = 'Fornecedor'
  ClientHeight = 343
  ClientWidth = 667
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
  object lbl_Busca: TLabel
    Left = 8
    Top = 58
    Width = 151
    Height = 13
    Caption = 'Busca por nome do fornecedor:'
  end
  object lbl_qtdRegistros: TLabel
    Left = 593
    Top = 80
    Width = 58
    Height = 13
    Caption = 'Registros: 0'
  end
  object Grid_Fornecedor: TDBGrid
    Left = 0
    Top = 104
    Width = 667
    Height = 239
    TabStop = False
    Align = alBottom
    DataSource = dmFornecedor.ds_Fornecedr
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object edt_BuscaFornedr: TEdit
    Left = 8
    Top = 77
    Width = 217
    Height = 21
    TabOrder = 0
    OnChange = edt_BuscaFornedrChange
  end
  object btnNovoFornecedr: TButton
    Left = 8
    Top = 8
    Width = 97
    Height = 25
    Caption = 'Novo Fornecedor'
    TabOrder = 1
    OnClick = btnNovoFornecedrClick
  end
  object tmr_Busca_Forncedr: TTimer
    Enabled = False
    Interval = 1500
    OnTimer = tmr_Busca_ForncedrTimer
    Left = 208
    Top = 208
  end
end
