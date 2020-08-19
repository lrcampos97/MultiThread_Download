unit dtmMain_un;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs, Data.DB, FireDAC.Comp.Client;

type
  TdtmMain = class(TDataModule)
    Connection: TFDConnection;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dtmMain: TdtmMain;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
