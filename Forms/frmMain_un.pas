unit frmMain_un;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.ExtCtrls;

type
  TfrmMain = class(TForm)
    pnlHeader: TPanel;
    Label2: TLabel;
    pgcMain: TPageControl;
    tsPrincipal: TTabSheet;
    tsHistorico: TTabSheet;
    tsProgress: TPanel;
    Label1: TLabel;
    edtURL: TEdit;
    btnIniciarDownload: TButton;
    Button1: TButton;
    Button2: TButton;
    btnVoltar: TButton;
    btnMensagem: TButton;
    pnlProgress: TPanel;
    ProgressBar1: TProgressBar;
    procedure FormShow(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure btnVoltarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

procedure TfrmMain.btnVoltarClick(Sender: TObject);
begin
  pgcMain.ActivePage := tsPrincipal;
end;

procedure TfrmMain.Button2Click(Sender: TObject);
begin
  pgcMain.ActivePage := tsHistorico;
end;

procedure TfrmMain.FormShow(Sender: TObject);
begin
  pgcMain.Pages[tsHistorico.PageIndex].TabVisible := false;
  pgcMain.Pages[tsPrincipal.PageIndex].TabVisible := false;
  pgcMain.ActivePage := tsPrincipal;

  edtURL.Clear;
  edtURL.SetFocus;
  pnlProgress.Visible := False;
end;

end.
