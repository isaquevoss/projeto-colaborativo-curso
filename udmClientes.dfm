object Dmclientes: TDmclientes
  OldCreateOrder = False
  Height = 171
  Width = 238
  object dsClientes: TDataSource
    DataSet = qrClientes
    Left = 40
    Top = 24
  end
  object qrClientes: TFDQuery
    Connection = DmConexaoFB.Conexao
    Left = 128
    Top = 80
  end
end
