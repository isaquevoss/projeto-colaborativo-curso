object frmCadastroVendedor: TfrmCadastroVendedor
  Left = 0
  Top = 0
  Caption = 'frmCadastroVendedor'
  ClientHeight = 246
  ClientWidth = 506
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
  object lbCodigo: TLabel
    Left = 346
    Top = 24
    Width = 46
    Height = 13
    Caption = 'C'#243'digo: 0'
  end
  object Label2: TLabel
    Left = 42
    Top = 67
    Width = 31
    Height = 13
    Caption = 'Nome:'
  end
  object Label3: TLabel
    Left = 26
    Top = 104
    Width = 84
    Height = 13
    Caption = 'Comiss'#227'o '#224' vista:'
  end
  object Label4: TLabel
    Left = 252
    Top = 104
    Width = 88
    Height = 13
    Caption = 'Comiss'#227'o a prazo:'
  end
  object Label5: TLabel
    Left = 210
    Top = 150
    Width = 116
    Height = 13
    Caption = '% M'#225'ximo de desconto:'
  end
  object Button1: TButton
    Left = 392
    Top = 202
    Width = 75
    Height = 25
    Caption = 'Gravar'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 26
    Top = 202
    Width = 75
    Height = 25
    Caption = 'Cancelar'
    TabOrder = 1
    OnClick = Button2Click
  end
  object edNome: TEdit
    Left = 112
    Top = 64
    Width = 355
    Height = 21
    TabOrder = 2
    Text = 'edNome'
  end
  object EdComissaoAPrazo: TEdit
    Left = 346
    Top = 101
    Width = 121
    Height = 21
    TabOrder = 3
    Text = 'Edit1'
  end
  object edComissaoAVista: TEdit
    Left = 112
    Top = 101
    Width = 121
    Height = 21
    TabOrder = 4
    Text = 'Edit1'
  end
  object EdMaxDesconto: TEdit
    Left = 346
    Top = 147
    Width = 121
    Height = 21
    TabOrder = 5
    Text = 'Edit1'
  end
end
