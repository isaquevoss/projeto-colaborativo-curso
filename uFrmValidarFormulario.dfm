object frmValidarFormulario: TfrmValidarFormulario
  Left = 0
  Top = 0
  Caption = 'frmValidarFormulario'
  ClientHeight = 200
  ClientWidth = 398
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object lbvalidNome: TLabel
    Left = 40
    Top = 35
    Width = 57
    Height = 13
    Caption = 'lbvalidNome'
    Color = clBtnFace
    ParentColor = False
    Visible = False
  end
  object EdNome: TEdit
    Left = 40
    Top = 8
    Width = 121
    Height = 21
    TabOrder = 0
    Text = 'EdNome'
    OnChange = EditisChange
  end
  object Edit2: TEdit
    Left = 40
    Top = 64
    Width = 121
    Height = 21
    TabOrder = 1
    Text = 'Edit1'
    OnChange = EditisChange
  end
  object Edit3: TEdit
    Left = 40
    Top = 91
    Width = 121
    Height = 21
    TabOrder = 2
    Text = 'Edit1'
    OnChange = EditisChange
  end
  object Edit4: TEdit
    Left = 40
    Top = 118
    Width = 121
    Height = 21
    TabOrder = 3
    Text = 'Edit1'
    OnChange = EditisChange
  end
  object ComboBox1: TComboBox
    Left = 208
    Top = 64
    Width = 145
    Height = 21
    TabOrder = 4
    Text = 'ComboBox1'
    OnChange = EditisChange
    Items.Strings = (
      'item 1 '
      'item 2')
  end
  object DateTimePicker1: TDateTimePicker
    Left = 208
    Top = 91
    Width = 145
    Height = 21
    Date = 44400.818729606480000000
    Time = 44400.818729606480000000
    TabOrder = 5
    OnChange = EditisChange
  end
  object Button1: TButton
    Left = 144
    Top = 167
    Width = 75
    Height = 25
    Caption = 'Gravar'
    TabOrder = 6
    OnClick = Button1Click
  end
end
