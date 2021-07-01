unit uDmVersoesExe;

interface

uses
  System.SysUtils, System.Classes, Data.FMTBcd, Data.DB, Data.SqlExpr, uDmConexaoFB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TdmVersoes = class(TDataModule)
    dsVersoes: TDataSource;
    qrVersoes: TFDQuery;
  private
    { Private declarations }
  public
    procedure carregarProdutos();
  end;

var
  dmVersoes: TdmVersoes;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TdmVersoes }

procedure TdmVersoes.carregarProdutos;
begin
  if not DmConexaoFB.Conexao.Connected then
      DmConexaoFB.conectarBanco();

  qrVersoes.Close;
  qrVersoes.SQL.Clear;

  //iniciando o SQL
  qrVersoes.SQL.Add('select * from versao_exe;');
  qrVersoes.Open();
end;

end.
