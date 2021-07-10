object frmEstoque: TfrmEstoque
  Left = 0
  Top = 0
  Caption = 'frmEstoque'
  ClientHeight = 390
  ClientWidth = 676
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
  object pnlTela: TPanel
    Left = 0
    Top = 73
    Width = 676
    Height = 317
    Align = alBottom
    TabOrder = 0
  end
  object pnlOpcoes: TPanel
    Left = 0
    Top = 0
    Width = 676
    Height = 65
    Align = alTop
    TabOrder = 1
    object btnListagem: TButton
      Left = 31
      Top = 21
      Width = 75
      Height = 25
      Caption = 'Listagem'
      TabOrder = 0
      OnClick = btnListagemClick
    end
    object btnCadastro: TButton
      Left = 136
      Top = 21
      Width = 75
      Height = 25
      Caption = 'Cadastrar'
      TabOrder = 1
    end
  end
end
