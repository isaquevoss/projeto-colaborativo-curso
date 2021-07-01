object dmVendasPorCliente: TdmVendasPorCliente
  OldCreateOrder = False
  Height = 174
  Width = 274
  object qrVendas: TFDQuery
    Connection = DmConexaoFB.Conexao
    Left = 56
    Top = 16
  end
  object dsVendasPorCliente: TDataSource
    DataSet = qrVendas
    Left = 144
    Top = 24
  end
end
