object DataModule1: TDataModule1
  OldCreateOrder = False
  Height = 221
  Width = 414
  object qrInsertUpdate: TFDQuery
    Connection = DmConexaoFB.Conexao
    Left = 136
    Top = 56
  end
  object qrTransportadora: TFDQuery
    Connection = DmConexaoFB.Conexao
    Left = 272
    Top = 56
  end
  object dsTransportadora: TDataSource
    DataSet = qrTransportadora
    Left = 232
    Top = 136
  end
end
