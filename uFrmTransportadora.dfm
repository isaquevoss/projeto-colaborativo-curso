object FrmTransportadora: TFrmTransportadora
  Left = 0
  Top = 0
  Caption = 'Cadastro da Transportadora'
  ClientHeight = 398
  ClientWidth = 444
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lblNome: TLabel
    Left = 10
    Top = 13
    Width = 27
    Height = 13
    Caption = 'Nome'
  end
  object lblEndereco: TLabel
    Left = 10
    Top = 98
    Width = 45
    Height = 13
    Caption = 'Endereco'
  end
  object lblCidade: TLabel
    Left = 10
    Top = 137
    Width = 33
    Height = 13
    Caption = 'Cidade'
  end
  object lblUF: TLabel
    Left = 10
    Top = 179
    Width = 13
    Height = 13
    Caption = 'UF'
  end
  object lblTelefone: TLabel
    Left = 10
    Top = 220
    Width = 42
    Height = 13
    Caption = 'Telefone'
  end
  object lblEmail: TLabel
    Left = 10
    Top = 265
    Width = 24
    Height = 13
    Caption = 'Email'
  end
  object lblRntrc: TLabel
    Left = 10
    Top = 306
    Width = 34
    Height = 13
    Caption = 'RNTRC'
  end
  object lblCnpj: TLabel
    Left = 10
    Top = 57
    Width = 22
    Height = 13
    Caption = 'Cnpj'
  end
  object imgCheckCNPJ: TImage
    Left = 263
    Top = 54
    Width = 31
    Height = 27
    Proportional = True
    Stretch = True
    Visible = False
  end
  object imgWrongCNPJ: TImage
    Left = 300
    Top = 54
    Width = 29
    Height = 26
    Proportional = True
    Stretch = True
    Visible = False
  end
  object imgValidacao: TImage
    Left = 226
    Top = 56
    Width = 23
    Height = 24
    Proportional = True
    Stretch = True
  end
  object lblValidaNome: TLabel
    Left = 63
    Top = 33
    Width = 3
    Height = 13
    Visible = False
  end
  object lblValidaCpfCnpj: TLabel
    Left = 63
    Top = 80
    Width = 3
    Height = 13
    Visible = False
  end
  object lblValidaUf: TLabel
    Left = 63
    Top = 205
    Width = 3
    Height = 13
  end
  object lblValidaCidade: TLabel
    Left = 63
    Top = 160
    Width = 3
    Height = 13
    Visible = False
  end
  object lblValidaEndereco: TLabel
    Left = 63
    Top = 120
    Width = 3
    Height = 13
    Visible = False
  end
  object edtNome: TEdit
    Left = 63
    Top = 13
    Width = 305
    Height = 21
    TabOrder = 0
    OnExit = edtNomeExit
  end
  object edtCnpj: TEdit
    Left = 63
    Top = 57
    Width = 157
    Height = 21
    NumbersOnly = True
    TabOrder = 1
    OnExit = edtCnpjExit
  end
  object edtEndereco: TEdit
    Left = 63
    Top = 98
    Width = 305
    Height = 21
    TabOrder = 2
  end
  object edtCidade: TEdit
    Left = 63
    Top = 137
    Width = 121
    Height = 21
    TabOrder = 3
  end
  object cbxUF: TComboBox
    Left = 63
    Top = 179
    Width = 53
    Height = 21
    AutoComplete = False
    Style = csDropDownList
    TabOrder = 4
    Items.Strings = (
      'AC'
      'AL'
      'AM'
      'AP'
      'BA'
      'CE'
      'DF'
      'ES'
      'EX'
      'GO'
      'MA'
      'MG'
      'MS'
      'MT'
      'PA'
      'PB'
      'PE'
      'PI'
      'PR'
      'RJ'
      'RN'
      'RO'
      'RR'
      'RS'
      'SC'
      'SE'
      'SP'
      'TO')
  end
  object edtTelefone: TEdit
    Left = 63
    Top = 221
    Width = 121
    Height = 21
    TabOrder = 5
  end
  object edtEmail: TEdit
    Left = 63
    Top = 265
    Width = 305
    Height = 21
    TabOrder = 6
  end
  object edtRntrc: TEdit
    Left = 63
    Top = 306
    Width = 121
    Height = 21
    TabOrder = 7
  end
  object btnSalvar: TButton
    Left = 255
    Top = 347
    Width = 105
    Height = 25
    Caption = 'Salvar'
    TabOrder = 8
    OnClick = btnSalvarClick
  end
  object btnCancelar: TButton
    Left = 23
    Top = 347
    Width = 105
    Height = 25
    Caption = 'Voltar'
    TabOrder = 9
    OnClick = btnCancelarClick
  end
  object btnLimpar: TButton
    Left = 144
    Top = 347
    Width = 105
    Height = 25
    Caption = 'Limpar'
    TabOrder = 10
    OnClick = btnLimparClick
  end
  object acbrvldr1: TACBrValidador
    IgnorarChar = './-'
    Left = 296
    Top = 112
  end
end
