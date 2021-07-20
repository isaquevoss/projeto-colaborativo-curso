object frmCadastroCliente: TfrmCadastroCliente
  Left = 0
  Top = 0
  Caption = 'Cadastro de Cliente'
  ClientHeight = 335
  ClientWidth = 297
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Lbl_nomeCliente: TLabel
    Left = 16
    Top = 27
    Width = 31
    Height = 13
    Caption = 'Nome:'
  end
  object lbl_dataCadastro: TLabel
    Left = 18
    Top = 176
    Width = 89
    Height = 13
    Caption = 'Data de Cadastro:'
  end
  object Label1: TLabel
    Left = 16
    Top = 77
    Width = 104
    Height = 13
    Caption = 'Selecione uma op'#231#227'o:'
  end
  object Label2: TLabel
    Left = 16
    Top = 123
    Width = 91
    Height = 13
    Caption = 'Digite o CPF/CNPJ:'
  end
  object Edit_nomeCliente: TEdit
    Left = 16
    Top = 46
    Width = 156
    Height = 21
    TabOrder = 0
  end
  object Edit_CpfCnpj: TEdit
    Left = 16
    Top = 142
    Width = 156
    Height = 21
    NumbersOnly = True
    TabOrder = 2
    OnChange = Edit_CpfCnpjChange
    OnExit = Edit_CpfCnpjExit
  end
  object btn_CadastrarCliente: TButton
    Left = 18
    Top = 240
    Width = 263
    Height = 25
    Caption = 'Cadastrar'
    TabOrder = 4
    OnClick = btn_CadastrarClienteClick
  end
  object btn_VoltarCliente: TButton
    Left = 18
    Top = 280
    Width = 263
    Height = 25
    Caption = 'Voltar'
    TabOrder = 5
    OnClick = btn_VoltarClienteClick
  end
  object Edit_DataCadastro: TEdit
    Left = 18
    Top = 195
    Width = 156
    Height = 21
    TabOrder = 3
  end
  object cbxCpfCnpj: TComboBox
    Left = 16
    Top = 96
    Width = 104
    Height = 21
    AutoComplete = False
    Style = csDropDownList
    TabOrder = 1
    OnSelect = cbxCpfCnpjSelect
    Items.Strings = (
      'CPF'
      'CNPJ')
  end
  object ACBrValidador: TACBrValidador
    IgnorarChar = './-'
    Left = 200
    Top = 16
  end
end
