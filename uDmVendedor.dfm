object DmVendedor: TDmVendedor
  OldCreateOrder = False
  Height = 244
  Width = 435
  object qrInsertVendedor: TFDQuery
    Connection = DmConexaoFB.Conexao
    Left = 32
    Top = 24
  end
  object qrVendedores: TFDQuery
    Connection = DmConexaoFB.Conexao
    Left = 152
    Top = 24
  end
  object dsVendedores: TDataSource
    DataSet = qrVendedores
    Left = 152
    Top = 80
  end
  object qrBuscarVendedor: TFDQuery
    Connection = DmConexaoFB.Conexao
    Left = 296
    Top = 24
  end
end
