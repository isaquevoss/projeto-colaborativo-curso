unit udmClientes;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, uDmConexaoFB;

type
  TDmclientes = class(TDataModule)
    dsClientes: TDataSource;
    qrClientes: TFDQuery;
  private
    { Private declarations }
  public
     procedure buscarclientes(_nome: string = '');
  end;

var
  Dmclientes: tdmclientes;



implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TDataModule1 }

procedure TDmclientes.buscarclientes(_nome: string);

begin
  if not DmConexaoFB.Conexao.Connected then
    DmConexaoFB.conectarBanco();


  qrclientes.Close();
  qrclientes.SQL.Clear();

  qrclientes.SQL.Add('select nome from cliente ');
  qrclientes.SQL.Add('where nome containing :nome');

  qrclientes.ParamByName('nome').AsString := _nome;
  qrclientes.Open();

end;

end.
