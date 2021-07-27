object dmUsuario: TdmUsuario
  OldCreateOrder = False
  Height = 157
  Width = 203
  object dsUsuario: TDataSource
    DataSet = qrUsuario
    Left = 40
    Top = 32
  end
  object qrUsuario: TFDQuery
    Connection = DmConexaoFB.Conexao
    SQL.Strings = (
      'select * from usuarios')
    Left = 120
    Top = 32
  end
  object qrLogin: TFDQuery
    Connection = DmConexaoFB.Conexao
    Left = 120
    Top = 88
  end
end
