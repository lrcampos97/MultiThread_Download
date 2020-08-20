object frmMain: TfrmMain
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Main'
  ClientHeight = 231
  ClientWidth = 577
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCloseQuery = FormCloseQuery
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlHeader: TPanel
    Left = 0
    Top = 0
    Width = 577
    Height = 41
    Align = alTop
    TabOrder = 1
    object Label2: TLabel
      Left = 1
      Top = 1
      Width = 575
      Height = 39
      Align = alClient
      Alignment = taCenter
      Caption = 'MultiThread Download'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Layout = tlCenter
      ExplicitWidth = 229
      ExplicitHeight = 24
    end
  end
  object pgcMain: TPageControl
    Left = 0
    Top = 41
    Width = 577
    Height = 190
    ActivePage = tsPrincipal
    Align = alClient
    TabOrder = 0
    object tsPrincipal: TTabSheet
      Caption = 'Principal'
      object tsProgress: TPanel
        Left = 0
        Top = 0
        Width = 569
        Height = 162
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        object pnlButtons: TPanel
          Left = 0
          Top = 115
          Width = 569
          Height = 47
          Align = alBottom
          BevelOuter = bvNone
          TabOrder = 0
          object btnHistorico: TButton
            Left = 396
            Top = 12
            Width = 161
            Height = 25
            Caption = 'Exibir hist'#243'rico de downloads'
            TabOrder = 0
            OnClick = btnHistoricoClick
          end
          object btnMensagem: TButton
            Left = 278
            Top = 12
            Width = 105
            Height = 25
            Caption = 'Exibir mensagem'
            TabOrder = 1
            OnClick = btnMensagemClick
          end
          object btnPararDownload: TButton
            Left = 161
            Top = 12
            Width = 105
            Height = 25
            Caption = 'Parar Download'
            TabOrder = 2
            OnClick = btnPararDownloadClick
          end
          object btnIniciarDownload: TButton
            Left = 41
            Top = 12
            Width = 108
            Height = 25
            Caption = 'Iniciar Download'
            TabOrder = 3
            OnClick = btnIniciarDownloadClick
          end
        end
        object Panel1: TPanel
          Left = 0
          Top = 0
          Width = 569
          Height = 115
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 1
          object Label1: TLabel
            Left = 17
            Top = 4
            Width = 97
            Height = 13
            Caption = 'URL para download:'
          end
          object lblStatus: TLabel
            Left = 17
            Top = 59
            Width = 59
            Height = 13
            Caption = 'Baixando ...'
          end
          object edtURL: TEdit
            Left = 17
            Top = 23
            Width = 540
            Height = 21
            TabOrder = 0
          end
          object pgbDownload: TProgressBar
            Left = 17
            Top = 78
            Width = 540
            Height = 20
            TabOrder = 1
          end
        end
      end
    end
    object tsHistorico: TTabSheet
      Caption = 'Hist'#243'rico'
      ImageIndex = 1
      object DBGrid1: TDBGrid
        Left = 0
        Top = 0
        Width = 569
        Height = 136
        Align = alClient
        DataSource = dsDownloads
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'CODIGO'
            Width = 38
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'URL'
            Width = 366
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DATAINICIO'
            Width = 62
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DATAFIM'
            Width = 62
            Visible = True
          end>
      end
      object FlowPanel1: TFlowPanel
        Left = 0
        Top = 136
        Width = 569
        Height = 26
        Align = alBottom
        BevelOuter = bvNone
        FlowStyle = fsRightLeftBottomTop
        TabOrder = 1
        object btnVoltar: TButton
          Left = 494
          Top = 1
          Width = 75
          Height = 25
          Caption = 'Voltar'
          TabOrder = 0
          OnClick = btnVoltarClick
        end
      end
    end
  end
  object IdAntiFreeze: TIdAntiFreeze
    Left = 428
    Top = 17
  end
  object dsDownloads: TDataSource
    DataSet = dtmMain.qryDownload
    Left = 492
    Top = 9
  end
end
