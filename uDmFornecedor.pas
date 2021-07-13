unit uDmFornecedor;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, uDmConexaoFB;

type
  TdmFornecedor = class(TDataModule)
    ds_Fornecedr: TDataSource;
    Qr_fornecedr: TFDQuery;
  private
    { Private declarations }
  public
    procedure buscarFornecedor(_nomeFornecedor : string);
    procedure carregarFornecedor();
  end;

var
  dmFornecedor: TdmFornecedor;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TdmFornecedor }

procedure TdmFornecedor.buscarFornecedor(_nomeFornecedor: string);
begin
  if not DmConexaoFB.Conexao.Connected then
      DmConexaoFB.conectarBanco();

  Qr_fornecedr.Close;
  Qr_fornecedr.SQL.Clear;

  //iniciando o SQL
  Qr_fornecedr.SQL.Add('select * from fornecedor');
  Qr_fornecedr.SQL.Add('where upper(nome) containing upper(:nome)');
  Qr_fornecedr.ParamByName('nome').AsString := _nomeFornecedor;
  Qr_fornecedr.Open();


end;

procedure TdmFornecedor.carregarFornecedor;
begin
   if not DmConexaoFB.Conexao.Connected then
      DmConexaoFB.conectarBanco();

  Qr_fornecedr.Close;
  Qr_fornecedr.SQL.Clear;

  //iniciando o SQL
  Qr_fornecedr.SQL.Add('select * from fornecedor;');
  Qr_fornecedr.Open();
end;

end.
