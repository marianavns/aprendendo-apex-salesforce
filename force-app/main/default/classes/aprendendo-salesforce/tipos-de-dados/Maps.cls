public with sharing class Maps {
    public Maps() {

    }

    public static void construirMapDoZeroBasico () {
        Map<String,String> mapPessoaProfissao = new Map<String,String>();
        mapPessoaProfissao.put('Laís', 'Desenvolvedora');
        mapPessoaProfissao.put('Bernardo', 'Ator');
        mapPessoaProfissao.put('Bernardo', 'Desenvolvedor');
        System.debug('[construirMapDoZeroBasico] O map de pessoa x profissão é: ' + mapPessoaProfissao);

        /*

        Comando para executar no Developer Console:
        MapsBOMVNS.construirMapDoZeroBasico();

        Resultado:
        {Bernardo=Desenvolvedor, Laís=Desenvolvedora}

        Observação:
        Se for inserido mais de um valor para a mesma chave com o método .put, vai prevalecer o último valor inserido. Foi o que aconteceu na chave "Bernardo".
        */
    }
    

    public static void construirMapDoZeroIntermediario (String chaveA, String valorA, String chaveB, String valorB) {
        Map<String,String> mapPessoaProfissao = new Map<String,String>();
        mapPessoaProfissao.put(chaveA, valorA);
        mapPessoaProfissao.put(chaveB, valorB);
        System.debug('[construirMapDoZeroIntermediario] O map de pessoa x profissão é: ' + mapPessoaProfissao);

        /*

        Comando para executar no Developer Console:
        MapsBOMVNS.construirMapDoZeroIntermediario('Fernando','Advogado','Arnaldo','Jornalista');

        Resultado:
        {Fernando=Advogado, Arnaldo=Jornalista}

        Observação:
        A diferença deste método para o construirMapDoZeroBasico é a inserção de parâmetros na função.
        */
    }
}