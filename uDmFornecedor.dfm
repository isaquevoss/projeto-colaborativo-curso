object dmFornecedor: TdmFornecedor
  OldCreateOrder = False
  Height = 150
  Width = 291
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
end
