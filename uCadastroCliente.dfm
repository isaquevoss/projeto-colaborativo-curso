object frmCadastroCliente: TfrmCadastroCliente
  Left = 0
  Top = 0
  Caption = 'Cadastro de Cliente'
  ClientHeight = 283
  ClientWidth = 297
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
  object Lbl_nomeCliente: TLabel
    Left = 18
    Top = 27
    Width = 31
    Height = 13
    Caption = 'Nome:'
  end
  object lbl_dataCadastro: TLabel
    Left = 20
    Top = 128
    Width = 89
    Height = 13
    Caption = 'Data de Cadastro:'
  end
  object Label2: TLabel
    Left = 18
    Top = 75
    Width = 91
    Height = 13
    Caption = 'Digite o CPF/CNPJ:'
  end
  object Edit_nomeCliente: TEdit
    Left = 18
    Top = 46
    Width = 156
    Height = 21
    TabOrder = 0
  end
  object Edit_CpfCnpj: TEdit
    Left = 18
    Top = 94
    Width = 156
    Height = 21
    NumbersOnly = True
    TabOrder = 1
    OnExit = Edit_CpfCnpjExit
  end
  object btn_CadastrarCliente: TButton
    Left = 18
    Top = 192
    Width = 263
    Height = 25
    Caption = 'Cadastrar'
    TabOrder = 3
    OnClick = btn_CadastrarClienteClick
  end
  object btn_VoltarCliente: TButton
    Left = 18
    Top = 232
    Width = 263
    Height = 25
    Caption = 'Voltar'
    TabOrder = 4
    OnClick = btn_VoltarClienteClick
  end
  object Edit_DataCadastro: TEdit
    Left = 18
    Top = 147
    Width = 156
    Height = 21
    TabOrder = 2
  end
  object ACBrValidador: TACBrValidador
    IgnorarChar = './-'
    Left = 200
    Top = 16
  end
end
