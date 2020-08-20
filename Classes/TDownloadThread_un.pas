unit TDownloadThread_un;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.ExtCtrls,
  IdAntiFreezeBase, Vcl.IdAntiFreeze, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP, IdIOHandler, IdIOHandlerStream,
  IdIOHandlerSocket, IdIOHandlerStack, IdSSL, IdSSLOpenSSL,
  dtmMain_un, Data.DB, Vcl.Grids, Vcl.DBGrids;

type

  TDownloadThread = class(TThread)
  private
    FPosition: Integer;
    FProgress: TProgressBar;
    FIdHTTP: TIdHTTP;
    FURL: String;
    FFile: TStream;

    procedure ConfigurarHTTP;
    procedure ThreadDone(Sender: TObject);

    // Utilizar os pr�prios m�todos do componente para facilitar o c�lculo
    procedure IdHTTPWorkBegin(ASender: TObject; AWorkMode: TWorkMode; AWorkCountMax: Int64);
    procedure IdHTTPWork(ASender: TObject; AWorkMode: TWorkMode; AWorkCount: Int64);
    function TotalPorcentagemDownload(aValorMax, aValorAtual: Double): string;
    procedure TerminatedSet; override;

  public
    constructor Create(AProgress: TProgressBar; aURL: String; aOnTerminate: TNotifyEvent); reintroduce;
    procedure Execute; override;
    procedure SincronizarObjeto;
  end;

implementation

{ TDownloadThread }

procedure TDownloadThread.ConfigurarHTTP;
begin
  Self.FIdHTTP :=  TIdHTTP.Create(nil);
  Self.FIdHTTP.AllowCookies := True;
  Self.FIdHTTP.HTTPOptions := [hoForceEncodeParams];
  Self.FIdHTTP.OnWorkBegin := Self.IdHTTPWorkBegin;
  Self.FIdHTTP.OnWork := Self.IdHTTPWork;
end;

constructor TDownloadThread.Create(AProgress: TProgressBar; aURL: String; aOnTerminate: TNotifyEvent);
begin
  inherited Create(True);
  Self.FreeOnTerminate := True; // liberar automaticamente minha thread;
  Self.OnTerminate := aOnTerminate;

  FProgress := AProgress;
  FUrl := aURL;
  Self.ConfigurarHTTP;
end;

procedure TDownloadThread.Execute;
begin
  inherited;

  FFile := TFileStream.Create(ExpandFileName(ExtractFileDir(Application.ExeName) + '\Download_File' + ExtractFileExt(Self.FUrl)), fmcreate);

  try

    Self.FIdHTTP.Get(StringReplace(Self.FUrl,'https','http',[rfReplaceAll]), FFile); // n�o utilizar SSL

  except
    On E: Exception do
    begin
      MessageDlg('Erro ao realizar o download dos arquivos.' + sLineBreak + E.Message, mtError,[mbOK],0);
    end;
  end;
end;

procedure TDownloadThread.IdHTTPWork(ASender: TObject; AWorkMode: TWorkMode;
  AWorkCount: Int64);
begin
  Self.FPosition := AWorkCount;
  Self.Synchronize(Self.SincronizarObjeto);
end;

procedure TDownloadThread.IdHTTPWorkBegin(ASender: TObject;
  AWorkMode: TWorkMode; AWorkCountMax: Int64);
begin
  Self.FProgress.Max :=  AWorkCountMax;
end;

procedure TDownloadThread.SincronizarObjeto;
begin
  Self.FProgress.Position := Self.FPosition;
end;

procedure TDownloadThread.TerminatedSet;
begin
  inherited;

  // LIBERAR O ARQUIVO DA MEM�RIA
  if Assigned(FFile) then
  begin
    FreeAndNil(FFile);
  end;

  if Self.FIdHTTP.Connected then
  begin
    Self.FIdHTTP.Disconnect;
  end;
end;

procedure TDownloadThread.ThreadDone(Sender: TObject);
begin
  if Self.FIdHTTP.Connected then
  begin
    Self.FIdHTTP.Disconnect;
  end;
end;

function TDownloadThread.TotalPorcentagemDownload(aValorMax,
  aValorAtual: Double): string;
begin
  Result := FormatFloat('0%', ((aValorAtual * 100) / aValorMax));
end;

end.
