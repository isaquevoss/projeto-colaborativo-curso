unit uItensVendidosPorDia;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB,
  Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids, uDmItensVendidosPorDia, ACBrBase,
  ACBrExtenso, FireDAC.Comp.DataSet;

type
  TfrmItensVendidosPorDia = class(TForm)
    Grid: TDBGrid;
    EdDescricaoProduto: TEdit;
    BtBuscar: TButton;
    Label1: TLabel;
    lbQtdProdutosEncontrados: TLabel;
    ACBrExtenso1: TACBrExtenso;
    procedure BtBuscarClick(Sender: TObject);
    procedure GridDblClick(Sender: TObject);
    procedure GridTitleClick(Column: TColumn);
  private
    { Private declarations }
    procedure eventoGetRecord(dataset: TFDDataSet);
  public
    { Public declarations }

    procedure mostrarResultadosBusca();
  end;

var
  frmItensVendidosPorDia: TfrmItensVendidosPorDia;

implementation

{$R *.dfm}

procedure TfrmItensVendidosPorDia.BtBuscarClick(Sender: TObject);
begin
  DmItensVendidosPorDia.buscarProdutos(EdDescricaoProduto.Text);
  mostrarResultadosBusca();
end;

procedure TfrmItensVendidosPorDia.eventoGetRecord(dataset: TFDDataSet);
begin
  mostrarResultadosBusca;
end;

procedure TfrmItensVendidosPorDia.GridDblClick(Sender: TObject);
begin
  ShowMessage('Você clicou no produto: ' + DmItensVendidosPorDia.qrProdutos.FieldByName('CODIGO').AsString + ' ' + DmItensVendidosPorDia.qrProdutos.FieldByName('DESCRICAO').AsString + ' R$ ' + DmItensVendidosPorDia.qrProdutos.FieldByName('VALOR_TOTAL').AsString);
end;

procedure TfrmItensVendidosPorDia.GridTitleClick(Column: TColumn);
begin
  DmItensVendidosPorDia.qrProdutos.IndexFieldNames := Column.FieldName;
end;

procedure TfrmItensVendidosPorDia.mostrarResultadosBusca;
begin
  if DmItensVendidosPorDia.qrProdutos.RecordCount = 0 then
  begin
    lbQtdProdutosEncontrados.Caption := 'Nenhum Produto encontrado';
    ShowMessage('Não foram encontrados produtos com a descrição ' + EdDescricaoProduto.Text);
    exit;
  end;
  DmItensVendidosPorDia.qrProdutos.AfterGetRecord := self.eventoGetRecord;

  ACBrExtenso1.Valor := DmItensVendidosPorDia.qrProdutos.RecordCount;

  lbQtdProdutosEncontrados.Caption := 'Foram encontrados ' + IntToStr(DmItensVendidosPorDia.qrProdutos.RecordCount);

end;

end.

