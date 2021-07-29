object frmCadastroVendedor: TfrmCadastroVendedor
  Left = 0
  Top = 0
  Caption = 'frmCadastroVendedor'
  ClientHeight = 302
  ClientWidth = 319
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
    Left = 252
    Top = 24
    Width = 46
    Height = 13
    Caption = 'C'#243'digo: 0'
  end
  object Label2: TLabel
    Left = 18
    Top = 53
    Width = 31
    Height = 13
    Caption = 'Nome:'
  end
  object Label3: TLabel
    Left = 18
    Top = 106
    Width = 84
    Height = 13
    Caption = 'Comiss'#227'o '#224' vista:'
  end
  object Label4: TLabel
    Left = 177
    Top = 106
    Width = 88
    Height = 13
    Caption = 'Comiss'#227'o a prazo:'
  end
  object Label5: TLabel
    Left = 177
    Top = 160
    Width = 116
    Height = 13
    Caption = '% M'#225'ximo de desconto:'
  end
  object lblcpfcnpj: TLabel
    Left = 18
    Top = 160
    Width = 58
    Height = 13
    Caption = 'CPF / CNPJ:'
  end
  object btnGravar: TButton
    Left = 223
    Top = 258
    Width = 75
    Height = 25
    Caption = 'Gravar'
    TabOrder = 0
    OnClick = btnGravarClick
  end
  object btnCancelar: TButton
    Left = 18
    Top = 258
    Width = 75
    Height = 25
    Caption = 'Cancelar'
    TabOrder = 1
    OnClick = btnCancelarClick
  end
  object edNome: TEdit
    Left = 18
    Top = 72
    Width = 280
    Height = 21
    TabOrder = 2
  end
  object EdComissaoAPrazo: TEdit
    Left = 177
    Top = 125
    Width = 121
    Height = 21
    TabOrder = 3
  end
  object edComissaoAVista: TEdit
    Left = 18
    Top = 125
    Width = 121
    Height = 21
    TabOrder = 4
  end
  object EdMaxDesconto: TEdit
    Left = 177
    Top = 179
    Width = 121
    Height = 21
    TabOrder = 5
  end
  object edtcpfcnpj: TEdit
    Left = 18
    Top = 179
    Width = 121
    Height = 21
    TabOrder = 6
    OnExit = edtcpfcnpjExit
  end
  object acbrvldr1: TACBrValidador
    IgnorarChar = './-'
    Left = 104
    Top = 16
  end
  object acbrvldrcpf: TACBrValidador
    IgnorarChar = './-'
    Left = 432
    Top = 8
  end
end
