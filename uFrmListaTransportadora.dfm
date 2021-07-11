object frmListaTransportadora: TfrmListaTransportadora
  Left = 0
  Top = 0
  Caption = 'Trasnportador'
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
  object dbgrdTransportadora: TDBGrid
    Left = 0
    Top = 80
    Width = 635
    Height = 219
    Align = alBottom
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object btnCadastrar: TButton
    Left = 472
    Top = 8
    Width = 129
    Height = 25
    Caption = 'Nova Transportadora'
    TabOrder = 1
    OnClick = btnCadastrarClick
  end
end
