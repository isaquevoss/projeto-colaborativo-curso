object DmItensVendidosPorDia: TDmItensVendidosPorDia
  OldCreateOrder = False
  Height = 150
  Width = 215
  object qrProdutos: TFDQuery
    Connection = DmConexaoFB.Conexao
    Left = 120
    Top = 24
  end
  object dsProdutos: TDataSource
    DataSet = qrProdutos
    Left = 40
    Top = 24
  end
end
