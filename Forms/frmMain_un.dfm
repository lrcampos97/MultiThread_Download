object frmMain: TfrmMain
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Main'
  ClientHeight = 236
  ClientWidth = 582
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlHeader: TPanel
    Left = 0
    Top = 0
    Width = 582
    Height = 41
    Align = alTop
    TabOrder = 1
    ExplicitLeft = 408
    ExplicitTop = 152
    ExplicitWidth = 185
    object Label2: TLabel
      Left = 1
      Top = 1
      Width = 580
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
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 229
      ExplicitHeight = 24
    end
  end
  object pgcMain: TPageControl
    Left = 0
    Top = 41
    Width = 582
    Height = 195
    ActivePage = tsPrincipal
    Align = alClient
    TabOrder = 0
    ExplicitLeft = 1
    ExplicitTop = 46
    ExplicitWidth = 615
    ExplicitHeight = 247
    object tsPrincipal: TTabSheet
      Caption = 'Principal'
      ExplicitLeft = 7
      ExplicitWidth = 597
      ExplicitHeight = 209
      object tsProgress: TPanel
        Left = 0
        Top = 0
        Width = 574
        Height = 167
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        ExplicitHeight = 1
        object Label1: TLabel
          Left = 10
          Top = 20
          Width = 23
          Height = 13
          Caption = 'URL:'
        end
        object edtURL: TEdit
          Left = 39
          Top = 17
          Width = 516
          Height = 21
          TabOrder = 0
        end
        object btnIniciarDownload: TButton
          Left = 39
          Top = 60
          Width = 108
          Height = 25
          Caption = 'Iniciar Download'
          TabOrder = 1
        end
        object Button1: TButton
          Left = 159
          Top = 60
          Width = 105
          Height = 25
          Caption = 'Parar Download'
          Enabled = False
          TabOrder = 2
        end
        object Button2: TButton
          Left = 394
          Top = 60
          Width = 161
          Height = 25
          Caption = 'Exibir hist'#243'rico de downloads'
          TabOrder = 4
          OnClick = Button2Click
        end
        object btnMensagem: TButton
          Left = 276
          Top = 60
          Width = 105
          Height = 25
          Caption = 'Exibir mensagem'
          Enabled = False
          TabOrder = 3
          OnClick = Button2Click
        end
        object pnlProgress: TPanel
          Left = 0
          Top = 104
          Width = 574
          Height = 63
          Align = alBottom
          BevelOuter = bvNone
          TabOrder = 5
          object ProgressBar1: TProgressBar
            Left = 104
            Top = 16
            Width = 369
            Height = 25
            TabOrder = 0
          end
        end
      end
    end
    object tsHistorico: TTabSheet
      Caption = 'Hist'#243'rico'
      ImageIndex = 1
      ExplicitWidth = 597
      ExplicitHeight = 209
      object btnVoltar: TButton
        Left = 488
        Top = 128
        Width = 75
        Height = 25
        Caption = 'Fechar'
        TabOrder = 0
        OnClick = btnVoltarClick
      end
    end
  end
end