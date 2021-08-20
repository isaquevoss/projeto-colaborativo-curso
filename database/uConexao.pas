unit uConexao;

interface

uses
  FireDAC.Comp.Client;

type
  TConexao = class
  private
    Fcn: TfDConnection;
    Ftr: TFDTransaction;
    Fqr: TFDQuery;
  public
    property cn: TfDConnection read Fcn write Fcn;
    property tr: TFDTransaction read Ftr write Ftr;

    property qr: TFDQuery read Fqr write Fqr;
  end;

  var
    conexao: TConexao;

implementation

end.

