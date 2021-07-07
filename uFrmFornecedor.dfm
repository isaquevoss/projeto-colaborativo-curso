object FrmFornecedor: TFrmFornecedor
  Left = 0
  Top = 0
  Caption = 'Fornecedor'
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
  object lbl_Busca: TLabel
    Left = 8
    Top = 29
    Width = 80
    Height = 13
    Caption = 'Busca por nome:'
  end
  object Grid_Fornecedor: TDBGrid
    Left = 8
    Top = 88
    Width = 619
    Height = 208
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
  end
  object tmr_Busca_Forncedr: TTimer
    Left = 528
    Top = 24
  end
end
