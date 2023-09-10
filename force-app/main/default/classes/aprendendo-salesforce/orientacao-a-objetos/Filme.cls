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
    */
}