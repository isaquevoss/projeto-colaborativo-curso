object frmListaTransportadora: TfrmListaTransportadora
  Left = 0
  Top = 0
  Caption = 'Transportadora'
  ClientHeight = 299
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 13
    Width = 118
    Height = 13
    Caption = 'Buscar por Raz'#227'o Social:'
  end
  object lbl_qtdRegistros: TLabel
    Left = 8
    Top = 72
    Width = 58
    Height = 13
    Caption = 'Registros: 0'
  end
  object dbgrdTransportadora: TDBGrid
    Left = 0
    Top = 91
    Width = 635
    Height = 208
    Align = alBottom
    DataSource = DmTransportadora.dsTransportadora
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object btnCadastrar: TButton
    Left = 472
    Top = 8
    Width = 155
    Height = 25
    Caption = 'Nova Transportadora'
    TabOrder = 1
    OnClick = btnCadastrarClick
  end
  object edt_BuscarRzTransp: TEdit
    Left = 8
    Top = 32
    Width = 225
    Height = 21
    TabOrder = 0
    OnChange = edt_BuscarRzTranspChange
  end
  object tmr_BuscaTransp: TTimer
    Interval = 1500
    OnTimer = tmr_BuscaTranspTimer
    Left = 296
    Top = 16
  end
end
