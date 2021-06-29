object DmEstoque: TDmEstoque
  OldCreateOrder = False
  Height = 156
  Width = 261
  object qrEstoque: TFDQuery
    Connection = DmConexaoFB.Conexao
    Left = 152
    Top = 16
  end
  object dsEstoque: TDataSource
    DataSet = qrEstoque
    Left = 56
    Top = 16
  end
end
