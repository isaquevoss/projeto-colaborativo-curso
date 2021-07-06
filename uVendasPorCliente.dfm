object frmVendasPorCliente: TfrmVendasPorCliente
  Left = 0
  Top = 0
  Caption = 'frmVendasPorCliente'
  ClientHeight = 299
  ClientWidth = 609
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object lblResultBusca: TLabel
    Left = 340
    Top = 141
    Width = 196
    Height = 13
  end
  object dbgrdVendasPorCliente: TDBGrid
    Left = 0
    Top = 160
    Width = 609
    Height = 139
    Align = alBottom
    DataSource = dmVendasPorCliente.dsVendasPorCliente
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object dtpEmisaoInicial: TDateTimePicker
    Left = 423
    Top = 56
    Width = 114
    Height = 21
    Date = 44376.845717511580000000
    Time = 44376.845717511580000000
    TabOrder = 1
  end
  object edtCliente: TEdit
    Left = 32
    Top = 48
    Width = 233
    Height = 21
    TabOrder = 2
    Text = 'edtCliente'
    OnChange = edtClienteChange
  end
  object btnBuscar: TButton
    Left = 296
    Top = 46
    Width = 75
    Height = 25
    Caption = 'Buscar'
    TabOrder = 3
    OnClick = btnBuscarClick
  end
  object dtEmissaoFinal: TDateTimePicker
    Left = 423
    Top = 104
    Width = 113
    Height = 21
    Date = 44378.872751307870000000
    Time = 44378.872751307870000000
    TabOrder = 4
  end
  object TimerBusca: TTimer
    Enabled = False
    Interval = 1500
    OnTimer = TimerBuscaTimer
    Left = 456
    Top = 8
  end
end
