unit dtmMain_un;

interface

uses
  System.SysUtils, System.Classes, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs, Data.DB, FireDAC.Comp.Client,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.VCLUI.Wait, FireDAC.Comp.UI;

type
  TDadosDownload = record
    Codigo: Integer;
    URL: String;
    DataInicio: TDate;
    DataFim: TDate;
  end;

  TdtmMain = class(TDataModule)
    Connection: TFDConnection;
    qryDownload: TFDQuery;
    qryDownloadCODIGO: TFDAutoIncField;
    qryDownloadURL: TStringField;
    qryDownloadDATAINICIO: TDateField;
    qryDownloadDATAFIM: TDateField;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    procedure DataModuleDestroy(Sender: TObject);
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
    procedure AbrirConexaoBD;
    procedure FecharConexaoBD;
    function ConexaoAberta: Boolean;
  public
    { Public declarations }
    function AdicionarDownload(aDados: TDadosDownload): Integer;
    procedure AtualizarDataFim(aCodigo: Integer);
    procedure CarregarDadosDownloads;
    procedure FecharDataSet;

  end;

var
  dtmMain: TdtmMain;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TdtmMain }

function TdtmMain.AdicionarDownload(aDados: TDadosDownload): Integer;
begin
  Result := -1;

  if ConexaoAberta then
  begin
    try
      qryDownload.Close;
      qryDownload.Open;

      qryDownload.Append;
      qryDownloadURL.AsString := aDados.URL;
      qryDownloadDATAINICIO.AsDateTime := aDados.DataInicio;
      qryDownload.Post;

      Result := qryDownloadCODIGO.AsInteger;
    except
      on  E: EDatabaseError do
      begin
        MessageDlg('Erro ao incluir os dados no BD.' + sLineBreak + E.Message, mtError,[mbOK],0);
        Abort;
      end;

      on E:Exception do
      begin
        MessageDlg('Erro: ' + sLineBreak + E.Message, mtError,[mbOK],0);
        Abort;
      end;
    end;
  end
  else
  begin
    MessageDlg('Para realizar este procedimento, voc� deve estar conectado ao BD.', mtWarning,[mbOK],0);
    Abort;
  end;
end;

procedure TdtmMain.AtualizarDataFim(aCodigo: Integer);
begin

  if ConexaoAberta then
  begin
    try
      qryDownload.Close;
      qryDownload.Open;

      if qryDownload.Locate('CODIGO',aCodigo,[]) then
      begin
        qryDownload.Edit;
        qryDownloadDATAFIM.AsDateTime := Now;
        qryDownload.Post;
      end;
    except

      on  E: EDatabaseError do
      begin
        MessageDlg('Erro ao atualizar os dados no BD.' + sLineBreak + E.Message, mtError,[mbOK],0);
        Abort;
      end;

      on E:Exception do
      begin
        MessageDlg('Erro: ' + sLineBreak + E.Message, mtError,[mbOK],0);
        Abort;
      end;
    end;
  end;

end;

procedure TdtmMain.CarregarDadosDownloads;
begin
  if ConexaoAberta then
  begin
    try

      FecharDataSet;
      qryDownload.Open;

    except
      On E: EDatabaseError do
      begin
        MessageDlg('Erro ao carregar os registros do BD.' + sLineBreak + E.Message, mtError,[mbOK],0);
        Abort;
      end;
    end;
  end
  else
  begin
    MessageDlg('Para realizar este procedimento, voc� deve estar conectado ao BD.', mtWarning,[mbOK],0);
    Abort;
  end;
end;

function TdtmMain.ConexaoAberta: Boolean;
begin
  Result := Connection.Connected;
end;

procedure TdtmMain.AbrirConexaoBD;
begin
  try

    Connection.Connected := True;

  except
    on E: EDatabaseError do
    begin
      MessageDlg('Erro ao abrir conex�o com o banco de dados.' + sLineBreak + E.Message, mtError, [mbOK],0);
      Abort;
    end;
  end;
end;

procedure TdtmMain.DataModuleCreate(Sender: TObject);
begin
  Self.AbrirConexaoBD;
end;

procedure TdtmMain.DataModuleDestroy(Sender: TObject);
begin
  Self.FecharConexaoBD;
end;

procedure TdtmMain.FecharConexaoBD;
begin

  try

    if Connection.Connected then
    begin
      Connection.Connected := False;
    end;

  except
    on E: EDatabaseError do
    begin
      MessageDlg('Erro ao fechar a conex�o com o banco de dados.' + sLineBreak + E.Message, mtError, [mbOK],0);
      Abort;
    end;
  end;

end;

procedure TdtmMain.FecharDataSet;
begin
  if qryDownload.Active then
  begin
    qryDownload.Close;
  end;
end;

end.
