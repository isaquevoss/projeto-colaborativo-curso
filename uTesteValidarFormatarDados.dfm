object FrmValidarFormatarDados: TFrmValidarFormatarDados
  Left = 0
  Top = 0
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
  object Label1: TLabel
    Left = 33
    Top = 27
    Width = 22
    Height = 13
    BiDiMode = bdRightToLeft
    Caption = 'Cnpj'
    ParentBiDiMode = False
  end
  object imgerro: TImage
    Left = 575
    Top = 195
    Width = 105
    Height = 105
    Visible = False
  end
  object imgok: TImage
    Left = 575
    Top = 99
    Width = 105
    Height = 105
    Visible = False
  end
  object img: TImage
    Left = 215
    Top = 16
    Width = 33
    Height = 29
    Proportional = True
    Stretch = True
  end
  object Label2: TLabel
    Left = 14
    Top = 83
    Width = 41
    Height = 13
    BiDiMode = bdRightToLeft
    Caption = 'Cnpj/cpf'
    ParentBiDiMode = False
  end
  object Edit1: TEdit
    Left = 88
    Top = 24
    Width = 121
    Height = 21
    TabOrder = 0
    OnChange = Edit1Change
  end
  object edCnpjCpf: TEdit
    Left = 79
    Top = 80
    Width = 169
    Height = 21
    TabOrder = 1
    OnChange = edCnpjCpfChange
    OnExit = edCnpjCpfExit
  end
  object ComboBox1: TComboBox
    Left = 288
    Top = 80
    Width = 57
    Height = 21
    Style = csDropDownList
    ItemIndex = 1
    TabOrder = 2
    Text = 'cnpj'
    Items.Strings = (
      'cpf'
      'cnpj')
  end
  object ACBrValidador1: TACBrValidador
    IgnorarChar = './-'
    Left = 528
    Top = 32
  end
end
