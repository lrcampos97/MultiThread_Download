object dtmMain: TdtmMain
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 243
  Width = 394
  object Connection: TFDConnection
    Params.Strings = (
      'Database=C:\Delphi\MultiThread_Download\Data\DB.db'
      'DriverID=SQLite')
    LoginPrompt = False
    Left = 48
    Top = 32
  end
  object qryDownload: TFDQuery
    Connection = Connection
    SQL.Strings = (
      'SELECT '
      '    CODIGO,'
      '    URL,'
      '    DATAINICIO,'
      '    DATAFIM'
      'FROM LOGDOWNLOAD'
      '')
    Left = 168
    Top = 40
    object qryDownloadCODIGO: TFDAutoIncField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object qryDownloadURL: TStringField
      FieldName = 'URL'
      Origin = 'URL'
      Required = True
      Size = 600
    end
    object qryDownloadDATAINICIO: TDateField
      DisplayLabel = 'Data In'#237'cio'
      FieldName = 'DATAINICIO'
      Origin = 'DATAINICIO'
    end
    object qryDownloadDATAFIM: TDateField
      DisplayLabel = 'Data Fim'
      FieldName = 'DATAFIM'
      Origin = 'DATAFIM'
    end
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 240
    Top = 104
  end
end
