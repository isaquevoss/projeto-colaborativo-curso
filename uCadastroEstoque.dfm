object frmCadastroEstoque: TfrmCadastroEstoque
  Left = 0
  Top = 0
  Align = alClient
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'frmCadastroEstoque'
  ClientHeight = 260
  ClientWidth = 676
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lblCodigo: TLabel
    Left = 16
    Top = 26
    Width = 37
    Height = 13
    Caption = 'C'#243'digo:'
  end
  object lblDescricao: TLabel
    Left = 16
    Top = 61
    Width = 46
    Height = 13
    Caption = 'Descri'#231#227'o'
  end
  object lblQtd: TLabel
    Left = 16
    Top = 109
    Width = 56
    Height = 13
    Caption = 'Quantidade'
  end
  object lblPrecoVenda: TLabel
    Left = 160
    Top = 109
    Width = 75
    Height = 13
    Caption = 'Pre'#231'o de Venda'
  end
  object lblDescricaoIncompleto: TLabel
    Left = 68
    Top = 61
    Width = 82
    Height = 13
    Caption = 'lblCodIncompleto'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    Visible = False
  end
  object lblCodEstoque: TLabel
    Left = 59
    Top = 21
    Width = 47
    Height = 19
    Caption = 'NOVO'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object edtDescricao: TEdit
    Left = 16
    Top = 80
    Width = 265
    Height = 21
    TabOrder = 0
    TextHint = 'Descri'#231#227'o'
  end
  object edtQtd: TEdit
    Left = 16
    Top = 128
    Width = 89
    Height = 21
    NumbersOnly = True
    TabOrder = 1
    TextHint = '0,00'
  end
  object edtprecoVenda: TEdit
    Left = 160
    Top = 128
    Width = 121
    Height = 21
    NumbersOnly = True
    TabOrder = 2
    TextHint = '0,00'
  end
  object btnGravar: TButton
    Left = 16
    Top = 184
    Width = 75
    Height = 25
    Caption = 'Gravar'
    TabOrder = 3
    OnClick = btnGravarClick
  end
  object btnCancelar: TButton
    Left = 206
    Top = 184
    Width = 75
    Height = 25
    Caption = 'Cancelar'
    TabOrder = 4
    OnClick = btnCancelarClick
  end
  object btnLimpar: TButton
    Left = 112
    Top = 216
    Width = 75
    Height = 25
    Caption = 'Limpar'
    TabOrder = 5
    OnClick = btnLimparClick
  end
end
