unit uFornecedor;

interface
Uses uModelo;

  type
    TFornecedor = class (TModelo)
    private
      Fnome: string;
      Fcpf: string;
      Ffantasia: string;
      Fie: string;
      Fenderešo :string;

    public
      property nome: string read Fnome write Fnome;
      property cpf: string read Fcpf write Fcpf;
      property enderešo: string read Fenderešo write Fenderešo;
      property ie: string read Fie write Fie;


end;

implementation


end.



