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
            Maps.construirMapDoZeroBasico();

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
            Maps.construirMapDoZeroIntermediario('Fernando','Advogado','Arnaldo','Jornalista');

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
            Maps.construirMapAPartirDeUmaListaDeRegistrosSalesforce();

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


    public static void filtrarRegistrosNoSalesforceSemSelectNoLoopIniciante (List<Account> listaDeContas) {
        /* Tarefa: Mostrar a frase "A conta ______ têm __ contatos cadastrados no Salesforce." no DEBUG.

        FORMA ERRADA, pois não se deve inserir consultas aos registros dentro de um for.
        for (Account conta : listaDeContas){
            List<Contact> contatosDaConta = [SELECT Id, Name, AccountId FROM Contact WHERE AccountId = :conta.Id];
            System.debug('A conta ' + conta.Name + ' possui ' + contatosDaConta.size() + ' contatos cadastrados no Salesforce.');
        } 
        */

        List<Contact> listaDeContatosDasContas = new List<Contact>([SELECT Id, AccountId, Account.Name FROM Contact WHERE AccountId IN :listaDeContas]);   
        for (Account conta : listaDeContas){
            List<Contact> contatosDestaConta = new List<Contact>();
            for (Contact contato : listaDeContatosDasContas){
                if(contato.AccountId == conta.Id){
                    contatosDestaConta.add(contato);
                }   
            }
            System.debug('A conta ' + conta + ' tem ' + contatosDestaConta.size() + ' contatos cadastrados no Salesforce.');
            System.debug(contatosDestaConta);
        }

        /*
            Comando para executar no Developer Console:
            List<Account> listaContas = [SELECT Id FROM Account];
            Maps.filtrarRegistrosNoSalesforceSemSelectNoLoopIniciante(listaContas);

            Resultado: Uma lista de Contact para cada conta, exemplo: 
            (
                Contact:{Id=003Hr00002Ta21aIAB, AccountId=001Hr00001nbrc5IAA}, 
                Contact:{Id=003Hr00002Ta21bIAB, AccountId=001Hr00001nbrc5IAA}
            )

            Observação:
            - Map não foi usado;
            - Temos um problema de for dentro de outro for, que é bom evitar.
        */
    }


    public static void filtrarRegistrosNoSalesforceSemSelectNoLoopAvancadoComMap (List<Account> listaDeContas) {
        
        List<Contact> listContatosDaLista = new List<Contact>([SELECT Id, Name, AccountId, Account.Name FROM Contact WHERE AccountId IN :listaDeContas]);
        Map<Id,List<Contact>> mapContaEContatos = new Map<Id,List<Contact>>();

        for (Contact contato : listContatosDaLista){
            Id idDaConta = contato.AccountId;
            if (mapContaEContatos.containsKey(idDaConta)){
                mapContaEContatos.get(idDaConta).add(contato);
            }
            if (!mapContaEContatos.containsKey(idDaConta)){
                List<Contact> contatosDestaConta = new List<Contact>();
                contatosDestaConta.add(contato);
                mapContaEContatos.put(idDaConta,contatosDestaConta);
            }
        }
        
        for (Id keyAccountId : mapContaEContatos.keySet()){
            List<Contact> contatosDeCadaConta = mapContaEContatos.get(keyAccountId);
            System.debug('A conta ' + contatosDeCadaConta[0].Account.Name + ' tem ' + contatosDeCadaConta.size() + ' contatos, que são: ' + contatosDeCadaConta);
        }

        /*
            Comando para executar no Developer Console:
            List<Account> listaContas = [SELECT Id FROM Account];
            Maps.filtrarRegistrosNoSalesforceSemSelectNoLoopAvancadoComMap(listaContas);

            
            Resultado: Um Map com o ID da Conta como chave e a lista de contatos como valores: 
            {
                001Hr00001nbrc5IAA=(
                    Contact:{Id=003Hr00002Ta21TIAR, Name=Rose Gonzalez, AccountId=001Hr00001nbrc0IAA}, 
                    Contact:{Id=003Hr00002Ta21UIAR, Name=Sean Forbes, AccountId=001Hr00001nbrc0IAA}
                ),
                001Hr00001nbrc1IAA=(
                    Contact:{Id=003Hr00002Ta21VIAR, Name=Jack Rogers, AccountId=001Hr00001nbrc1IAA}
                ), 
                001Hr00001nbrc2IAA=(
                    Contact:{Id=003Hr00002Ta21WIAR, Name=Pat Stumuller, AccountId=001Hr00001nbrc2IAA}
                )
            }

            Observação:
            - É possível construir Map de vários tipos, inclusive compostos pelo ID de um objeto + Lista de outro objeto.
        */
    }

    /*

        #### DOCUMENTAÇÃO DA CLASSE MAPS: 
            https://developer.salesforce.com/docs/atlas.en-us.apexref.meta/apexref/apex_methods_system_map.htm



        #### FORMAS DE CRIAR UM MAP - CONSTRUTORES DE MAP
            Map<Integer,String> mapCriadoVazio = new Map<Integer,String>();
            Map<Integer,String> mapCriadoPopulado = new Map<Integer,String>{1 => 'primeiro', 2 => 'segundo'};
            Map<String,String> mapCopiadoDeOutro = new Map<String,String>(mapExistente); 
            Map<Id,Account> mapContaESeusContatos = new Map<Id,Account>([SELECT Id, Name FROM Account])



        #### MÉTODOS MAIS USADOS DO MAP
            (.put)              mapEstadosCapitais.put('Pernambuco', 'Recife');
            (.get)              String capitalAcre = mapEstadosCapitais.get('Acre'); --> Também poderia ser "Object capitalAcre"
            (.values)           List<String> listaDasCapitais = mapEstadosCapitais.values(); 
            (.containsKey)      Boolean possuiAmazonasComoChave = mapEstadosCapitais.containsKey('Amazonas');
            (.ketSet)           Set setDosEstados = mapEstadosCapitais.keySet();
            (.toString)         String mapEmString = mapEstadosCapitais.toString();



        #### TODOS OS MÉTODOS DO MAP
            # SEM RETORNO OU RETORNO NÃO MUITO ÚTIL
                mapQueFicaráVazio.clear();
                mapEstadosCapitais.put('Acre', 'Rio Branco');   
                |___ (tem retorno) Se tentamos incluir uma chave que já existe, o valor é substituído. O retorno é o valor que estava cadastrado na chave.
                mapEstadosCapitais.remove('Acre');   
                |___ (tem retorno) Remove a chave e o valor do map. Retorna o valor que foi apagado.
                mapQueReceberáListaRegistrosSF.putAll(listaDeRegistros);
                |___ Inclui uma lista inteira de registros de uma vez em um map que já existe.
                mapQueReceberáMap.putAll(mapQueJaExiste);
                |___ Inclui um map de uma vez em um map que já existe.
            # RETORNO BOOLEAN
                Boolean possuiAmazonasComoChave = mapEstadosCapitais.containsKey('Amazonas');
                Boolean mapAIgualMapB = mapA.equals(mapB);
                Boolean mapEstaVazio = mapEstadosCapitais.isEmpty();
            # RETORNO INTEGER
                Integer hashCode = mapPessoaProfissao.hashCode();
                |___ Resultado: 4607793566
                Integer tamanhoDoMap = mapEstadosCapitais.size();
                |___ Resultado: quantos conjuntos chaveXvalor temos no map.
            # RETORNO STRING
                String mapEmString = mapEstadosCapitais.toString();
            # RETORNO LIST
                List<String> listaDasCapitais = mapEstadosCapitais.values(); 
                |___ Retorna uma lista com todos os valores que estão nas chaves.
            # RETORNO MAP
                Map<String,String> cópiaDoMap = mapOriginal.clone();
                Map<String,Account> mapCopiadoProfundamente = mapOriginal.deepClone();
            # RETORNO VARIÁVEL
                String capitalAcre = mapEstadosCapitais.get('Acre');            
                |___ Resultado: 'Rio Branco'. Tipo de retorno depende do tipo do map
            # RETORNO SCHEMA.SOBJECTTYPE
                Schema.SObjectType tipoDeSObject = mapStringAccount.getSObjectType();   
                |___ Resultado: 'Account'
            # RETORNO SET
            Set setDosEstados = mapEstadosCapitais.keySet();
            |___Resultado: {Acre, Amazonas, Pará, Pernambuco}

    */
}