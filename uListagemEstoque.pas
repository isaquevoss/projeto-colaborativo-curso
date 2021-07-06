unit uListagemEstoque;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, uDmEstoque;

type
  TFrmListagemEstoque = class(TForm)
    grid: TDBGrid;
    edDescricao: TEdit;
    label1: TLabel;
    lblNumRegistro: TLabel;
    procedure btnBuscarClick(Sender: TObject);
    procedure edDescricaoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edDescricaoChange(Sender: TObject);
    procedure mostrarResultado;
    procedure gridTitleClick(Column: TColumn);
    procedure gridDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    procedure listarProduto();
  end;

var
  FrmListagemEstoque: TFrmListagemEstoque;

implementation

{$R *.dfm}

procedure TFrmListagemEstoque.btnBuscarClick(Sender: TObject);
begin
  listarProduto();
end;

procedure TFrmListagemEstoque.edDescricaoChange(Sender: TObject);
begin
  if edDescricao.Text = '' then
  begin
    Exit;
  end;

  listarProduto();
end;

procedure TFrmListagemEstoque.edDescricaoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key=13 then
  begin
    listarProduto();
  end;

  if Key=8 then
  begin
    DmEstoque.qrEstoque.Close();
    lblNumRegistro.Caption := '0';
  end;
end;

procedure TFrmListagemEstoque.listarProduto();
begin
  if edDescricao.Text = '' then
   begin
     ShowMessage('Preencha o nome do produto!');
     Exit;
   end;

  DmEstoque.buscarEstoque(edDescricao.Text);
  mostrarResultado();

end;

procedure TFrmListagemEstoque.mostrarResultado;
begin
  DmEstoque.qrEstoque.FetchAll();

  if DmEstoque.qrEstoque.RecordCount > 0 then
    begin
      lblNumRegistro.Caption := IntToStr(DmEstoque.qrEstoque.RecordCount);
      lblNumRegistro.Visible := True;
    end;
end;

procedure TFrmListagemEstoque.gridDblClick(Sender: TObject);
begin
  ShowMessage('Produto: '+DmEstoque.qrEstoque.FieldByName('codigo').AsString+' '+DmEstoque.qrEstoque.FieldByName('descricao').AsString+#13+'Com o preço de: '+DmEstoque.qrEstoque.FieldByName('preco_venda').AsString+#13+'Com '+DmEstoque.qrEstoque.FieldByName('qtd').AsString+' quantidades em estoque.');
end;

procedure TFrmListagemEstoque.gridTitleClick(Column: TColumn);
begin
  DmEstoque.qrEstoque.IndexFieldNames := Column.FieldName;
end;

end.
