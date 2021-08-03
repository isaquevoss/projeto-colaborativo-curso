unit uClienteClasse;

interface
  type
    TCliente = class
    private
      Fnome: string;
      Fcpf: string;
      FdataCadastro: string;
    public
      property nome: string read Fnome write Fnome;
      property cpf: string read Fcpf write Fcpf;
      property dataCadastro: string read FdataCadastro write FdataCadastro;

    end;


implementation

end.
