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
      Fendere�o :string;

    public
      property nome: string read Fnome write Fnome;
      property cpf: string read Fcpf write Fcpf;
      property endere�o: string read Fendere�o write Fendere�o;
      property ie: string read Fie write Fie;


end;

implementation


end.



