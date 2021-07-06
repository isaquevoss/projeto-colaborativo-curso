object frmVersoesExe: TfrmVersoesExe
  Left = 0
  Top = 0
  Caption = 'Vers'#245'es'
  ClientHeight = 260
  ClientWidth = 544
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object lbl1: TLabel
    Left = 302
    Top = 97
    Width = 36
    Height = 13
    Caption = 'Buscar:'
  end
  object Grid_Exes: TDBGrid
    Left = 0
    Top = 122
    Width = 544
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
    Top = 48
    Width = 129
    Height = 25
    Caption = 'Carregar'
    TabOrder = 1
    OnClick = btn_CarregarClick
  end
  object Nav_Versoes: TDBNavigator
    Left = 8
    Top = 91
    Width = 230
    Height = 25
    DataSource = dmVersoes.dsVersoes
    TabOrder = 2
  end
  object edt_buscar: TEdit
    Left = 344
    Top = 95
    Width = 185
    Height = 21
    TabOrder = 3
    OnChange = edt_buscarChange
  end
  object tmr_Buscar: TTimer
    Enabled = False
    Interval = 1700
    OnTimer = tmr_BuscarTimer
    Left = 16
    Top = 8
  end
end
