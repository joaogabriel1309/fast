object DataModule2: TDataModule2
  Height = 480
  Width = 640
  object FDQuery: TFDQuery
    Connection = FDConnection
    Left = 304
    Top = 224
  end
  object FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink
    VendorLib = 'C:\projetos\Delphi\ProjetoFastReport\libmysql.dll'
    Left = 352
    Top = 96
  end
  object FDConnection: TFDConnection
    Params.Strings = (
      'Database=sistema_orcamento'
      'User_Name=root'
      'Server=localhost'
      'DriverID=MySQL')
    Connected = True
    LoginPrompt = False
    Left = 184
    Top = 88
  end
end
