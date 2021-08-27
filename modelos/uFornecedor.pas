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
      Fendereço :string;

    public
      property nome: string read Fnome write Fnome;
      property cpf: string read Fcpf write Fcpf;
      property endereço: string read Fendereço write Fendereço;
      property ie: string read Fie write Fie;


end;

implementation


end.



