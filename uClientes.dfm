object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Form2'
  ClientHeight = 253
  ClientWidth = 517
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object lblCliente: TLabel
    Left = 40
    Top = 19
    Width = 63
    Height = 13
    Caption = 'Nome Cliente'
  end
  object dbgrd1: TDBGrid
    Left = 0
    Top = 69
    Width = 517
    Height = 184
    Align = alBottom
    DataSource = Dmclientes.dsClientes
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object btnCliente: TButton
    Left = 344
    Top = 16
    Width = 75
    Height = 25
    Caption = 'Buscar'
    TabOrder = 1
    OnClick = btnClienteClick
  end
  object edtCliente: TEdit
    Left = 176
    Top = 8
    Width = 137
    Height = 21
    TabOrder = 2
    Text = 'edtCliente'
  end
end