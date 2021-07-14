object dmFornecedor: TdmFornecedor
  OldCreateOrder = False
  Height = 201
  Width = 310
  object ds_Fornecedr: TDataSource
    DataSet = Qr_fornecedr
    Left = 56
    Top = 48
  end
  object Qr_fornecedr: TFDQuery
    Connection = DmConexaoFB.Conexao
    Left = 136
    Top = 48
  end
  object qrProximoCodigo: TFDQuery
    Connection = DmConexaoFB.Conexao
    Left = 136
    Top = 112
  end
end
