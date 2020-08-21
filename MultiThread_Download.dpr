program MultiThread_Download;

uses
  Vcl.Forms,
  frmMain_un in 'Forms\frmMain_un.pas' {frmMain},
  dtmMain_un in 'DataModules\dtmMain_un.pas' {dtmMain: TDataModule},
  TDownloadThread_un in 'Classes\TDownloadThread_un.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TdtmMain, dtmMain);
  Application.Run;
end.
