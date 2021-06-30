object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
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
  object Button1: TButton
    Left = 32
    Top = 24
    Width = 169
    Height = 25
    Caption = 'Produtos Vendidos por dia'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 32
    Top = 200
    Width = 169
    Height = 25
    Caption = 'Estoque'
    TabOrder = 1
  end
  object Button3: TButton
    Left = 32
    Top = 65
    Width = 169
    Height = 25
    Caption = 'Versoes Exe'
    TabOrder = 2
  end
  object Button4: TButton
    Left = 32
    Top = 112
    Width = 169
    Height = 25
    Caption = 'Clientes'
    TabOrder = 3
    OnClick = Button4Click
  end
  object Button5: TButton
    Left = 32
    Top = 152
    Width = 169
    Height = 25
    Caption = 'Vendas'
    TabOrder = 4
    OnClick = Button5Click
  end
end
