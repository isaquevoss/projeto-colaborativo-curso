object frmVersoesExe: TfrmVersoesExe
  Left = 0
  Top = 0
  Caption = 'Vers'#245'es'
  ClientHeight = 235
  ClientWidth = 466
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Grid_Exes: TDBGrid
    Left = 0
    Top = 97
    Width = 466
    Height = 138
    Align = alBottom
    DataSource = dmVersoes.dsVersoes
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object btn_Carregar: TButton
    Left = 8
    Top = 16
    Width = 129
    Height = 25
    Caption = 'Carregar'
    TabOrder = 1
    OnClick = btn_CarregarClick
  end
  object Nav_Versoes: TDBNavigator
    Left = 8
    Top = 66
    Width = 240
    Height = 25
    DataSource = dmVersoes.dsVersoes
    TabOrder = 2
  end
end
