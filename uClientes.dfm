object frmBuscaClientes: TfrmBuscaClientes
  Left = 0
  Top = 0
  Caption = 'Busca Clientes'
  ClientHeight = 318
  ClientWidth = 517
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
  object lblCliente: TLabel
    Left = 8
    Top = 14
    Width = 63
    Height = 13
    Caption = 'Nome Cliente'
  end
  object lbqtdclientesencontrados: TLabel
    Left = 363
    Top = 40
    Width = 3
    Height = 13
  end
  object dbgrd1: TDBGrid
    Left = 0
    Top = 144
    Width = 517
    Height = 174
    Align = alBottom
    DataSource = Dmclientes.dsClientes
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnTitleClick = dbgrd1TitleClick
  end
  object btnCliente: TButton
    Left = 8
    Top = 38
    Width = 329
    Height = 25
    Caption = 'Buscar'
    TabOrder = 1
    OnClick = btnClienteClick
  end
  object edtCliente: TEdit
    Left = 77
    Top = 11
    Width = 260
    Height = 21
    TabOrder = 2
    OnChange = edtClienteChange
  end
  object btn_NovoCliente: TButton
    Left = 8
    Top = 69
    Width = 329
    Height = 25
    Caption = 'Novo Cliente'
    TabOrder = 3
    OnClick = btn_NovoClienteClick
  end
  object btnEditar: TButton
    Left = 8
    Top = 100
    Width = 329
    Height = 25
    Caption = 'Editar'
    TabOrder = 4
    OnClick = btnEditarClick
  end
  object TimerBusca: TTimer
    Enabled = False
    Interval = 3000
    OnTimer = TimerBuscaTimer
    Left = 472
    Top = 80
  end
end
