public with sharing class Filme {

    // CRIANDO AS INFORMAÇÕES QUE TODO FILME DEVE TER PARA SER REGISTRADO DIREITO
    String nome;
    Integer anoDeLancamento;
    Boolean incluidoNoPlano;


    // VERIFICANDO SE A CRIAÇÃO DE UM FILME DÁ CERTO
    public static void exibeFilme(){
        Filme meuFilme = new Filme();
        meuFilme.nome = 'Cidade de Deus';
        System.debug('Filme: ' + meuFilme.nome + '. Lançamento: ' + meuFilme.anoDeLancamento + '. Está no plano? ' + meuFilme.incluidoNoPlano);
    }

    /*
        TEREI UM FILME EM QUALQUER CLASSE DO SISTEMA QUE EU ESCREVER ISSO:
            Filme filmeblabla = new Filme();

        
        _____


        O problema deste código é que qualquer um pode chegar no sistema e criar ou alterar o filme que quiser. Isso é um problema crítico se queremos manter os dados confiáveis. 
        
        Qualquer pessoa escrevendo códigos pode...

            ...Inserir o ano de lançamento como 1500 - e, nesse tempo, não tínhamos filmes ainda, rs;
                Filme filmeCriado = new Filme();
                filmeCriado.anoDeLancamento = 1500;
            Pronto, temos um filme lançado em 1500.

            ...Criar o mesmo filme duas vezes - basta duas pessoas escreverem isso no sistema:
                Filme filmeCriado = new Filme();
                filmeCriado.nome = 'Cidade de Deus';
                Filme filmeFeito = new Filme();
                filmeFeito.nome = 'Cidade de Deus';

            ...Alterar um filme que já existe:
                Filme filmeCriado = new Filme();
                filmeCriado.nome = 'Barbie';
                filmeCriado.anoDeLancamento = 2023;
                filmeCriado.nome = 'O Poderoso Chefão';
            Pronto, mudamos o nome do filme da Barbie para o Poderoso Chefão... que teve seu laçamento alterado para 2023 após esta pequena alteração.

        Os exemplos são muitos, e muitas as possibilidades de qualquer um fazer besteira nos dados. Este problema será resolvido no próximo commit.
    */
}