unit uDmConexaoFB;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FBDef,
  FireDAC.VCLUI.Wait, FireDAC.Comp.UI, FireDAC.Phys.IBBase, FireDAC.Phys.FB,
  Data.DB, FireDAC.Comp.Client;

type
  TDmConexaoFB = class(TDataModule)
    Conexao: TFDConnection;
    FDPhysFBDriverLink1: TFDPhysFBDriverLink;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
  private
    { Private declarations }
  public
    procedure conectarBanco(_database: string = '');
  end;

var
  DmConexaoFB: TDmConexaoFB;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TDataModule1 }

procedure TDmConexaoFB.conectarBanco(_database: string);
var
  database: string;
begin
  database := 'c:\gdoor sistemas\gdoor pro\datages.fdb';
  try
    Conexao.Params.DriverID := 'FB';
    Conexao.Params.UserName := 'SYSDBA';
    Conexao.Params.Password := 'masterkey';
    Conexao.Params.Add('port=3050');
    if _database <> '' then
      database := _database;
    Conexao.Params.Database := database;
    Conexao.Open();
  except
    on e: Exception do
    begin
      raise Exception.Create('Houve um erro ao conectar com o banco de dados. '#13 + e.Message);
    end;
  end;

end;

end.

