object frmCadastroCliente: TfrmCadastroCliente
  Left = 0
  Top = 0
  Caption = 'Cadastro de Cliente'
  ClientHeight = 331
  ClientWidth = 312
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
    Left = 18
    Top = 160
    Width = 89
    Height = 13
    Caption = 'Data de Cadastro:'
  end
  object Label2: TLabel
    Left = 18
    Top = 99
    Width = 91
    Height = 13
    Caption = 'Digite o CPF/CNPJ:'
  end
  object lbValidaNome: TLabel
    Left = 18
    Top = 72
    Width = 63
    Height = 13
    Caption = 'lbValidaNome'
  end
  object Edit_nomeCliente: TEdit
    Left = 18
    Top = 46
    Width = 263
    Height = 21
    TabOrder = 0
  end
  object Edit_CpfCnpj: TEdit
    Left = 18
    Top = 118
    Width = 263
    Height = 21
    NumbersOnly = True
    TabOrder = 1
    OnExit = Edit_CpfCnpjExit
  end
  object btn_CadastrarCliente: TButton
    Left = 18
    Top = 224
    Width = 263
    Height = 25
    Caption = 'Cadastrar'
    TabOrder = 3
    OnClick = btn_CadastrarClienteClick
  end
  object btn_VoltarCliente: TButton
    Left = 18
    Top = 288
    Width = 263
    Height = 25
    Caption = 'Voltar'
    TabOrder = 4
    OnClick = btn_VoltarClienteClick
  end
  object Edit_DataCadastro: TEdit
    Left = 18
    Top = 179
    Width = 263
    Height = 21
    TabOrder = 2
  end
  object btn_LimparForm: TButton
    Left = 18
    Top = 257
    Width = 263
    Height = 25
    Caption = 'Limpar Formulario'
    TabOrder = 5
    OnClick = btn_LimparFormClick
  end
  object ACBrValidador: TACBrValidador
    IgnorarChar = './-'
    Left = 96
  end
end
