object frmCadastroEstoque: TfrmCadastroEstoque
  Left = 0
  Top = 0
  Align = alClient
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'frmCadastroEstoque'
  ClientHeight = 236
  ClientWidth = 413
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lblCodigo: TLabel
    Left = 16
    Top = 10
    Width = 33
    Height = 13
    Caption = 'C'#243'digo'
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
  object edtDescricao: TEdit
    Left = 16
    Top = 80
    Width = 265
    Height = 21
    TabOrder = 1
  end
  object edtQtd: TEdit
    Left = 16
    Top = 128
    Width = 89
    Height = 21
    NumbersOnly = True
    TabOrder = 2
  end
  object edtprecoVenda: TEdit
    Left = 160
    Top = 128
    Width = 121
    Height = 21
    NumbersOnly = True
    TabOrder = 3
  end
  object edtCodigo: TEdit
    Left = 16
    Top = 29
    Width = 89
    Height = 21
    Enabled = False
    TabOrder = 0
  end
  object btnGravar: TButton
    Left = 16
    Top = 184
    Width = 75
    Height = 25
    Caption = 'Gravar'
    TabOrder = 4
    OnClick = btnGravarClick
  end
  object btnCancelar: TButton
    Left = 206
    Top = 184
    Width = 75
    Height = 25
    Caption = 'Cancelar'
    TabOrder = 5
    OnClick = btnCancelarClick
  end
end
