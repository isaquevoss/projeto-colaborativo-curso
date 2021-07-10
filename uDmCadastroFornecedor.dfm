object dmCadastroFornecedr: TdmCadastroFornecedr
  OldCreateOrder = False
  Height = 210
  Width = 319
  object qrInsertFornecedr: TFDQuery
    Connection = DmConexaoFB.Conexao
    Left = 80
    Top = 64
  end
  object ds_CadastrarFornecedr: TDataSource
    DataSet = qrInsertFornecedr
    Left = 80
    Top = 128
  end
end
