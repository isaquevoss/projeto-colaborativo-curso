object dmVersoes: TdmVersoes
  OldCreateOrder = False
  Height = 167
  Width = 288
  object dsVersoes: TDataSource
    DataSet = qrVersoes
    Left = 56
    Top = 40
  end
  object qrVersoes: TFDQuery
    Connection = DmConexaoFB.Conexao
    Left = 120
    Top = 40
  end
end
