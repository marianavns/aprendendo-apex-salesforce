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
    

    public static void construirMapAPartirDeUmaListaDeRegistrosSalesforce () {
        List<Account> contasSemTelefone = [SELECT Id, Name, Phone FROM Account WHERE Phone = null];
        Map<Id, Account> mapContasSemTelefone = new Map<Id, Account>(contasSemTelefone);
        System.debug('[construirMapAPartirDeUmaListaDeRegistrosSalesforce] As contas sem telefone cadastrado são: ' + mapContasSemTelefone);

        /*
            Comando para executar no Developer Console:
            MapsBOMVNS.construirMapAPartirDeUmaListaDeRegistrosSalesforce();

            Resultado: O id do registro + O registro em si. 
            {
                001Hr00001ihCY7IAM=Account:{Id=001Hr00001ihCY7IAM, Name=Restaurante Los Pollos Hermanos}, 
                001Hr00001ihMADIA2=Account:{Id=001Hr00001ihMADIA2, Name=Pizzaria Pizza Planet}, 
                001Hr00001ihMANIA2=Account:{Id=001Hr00001ihMANIA2, Name=Smith's Rede de Supermercados}
            }

            Observação:
            - É possível inserir a query diretamente entre os parênteses do construtor (na linha 49).
            - Em Maps assim, o ID do registro (neste caso, o ID da conta) será sempre a chave. O valor será o registro propriamente dito, trazendo os campos que foram determinados na query (linha 48).
        */
    }

}