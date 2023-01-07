public class Estudo02ImpressoraDeListas 
{  
    // ############### COMO DECLARAR LISTAS ###############

    public static void criaEMostraListasDeString() 
    {
		
        // Criação de Lista Vazia
        List<Account> contas = new List<Account>();
        System.debug('Lista de Contas vazia: ' + contas);
        
        
        // Criação de Lista já populada
      	List<String> frutasParaSalada = new List<String> {'maçã', 'uva'};
        system.debug('\nLista de Frutas quando digitei List<String> frutas = new List<String> {\'maçã\', \'uva\'}: ' + frutasParaSalada); 
        
        
        // Criação de Lista a partir de outra lista
        List<String> frutasParaLanche = new List<String>(frutasParaSalada);
		System.debug('Lista de frutas para lanche, criada a partir da lista de frutas para salada: ' + frutasParaLanche); 
        
        
        // Criação de Lista a partir de um Set                                
        Set<String> nomesEmSet = new Set<String> {'Zé', 'Marta', 'Marta', 'José', 'Ana'};
		List<String> listaDeNomesVindaDoSet = new List<String>(nomesEmSet);
        System.debug('Nomes Em Set (Tipo Set): ' + nomesEmSet);
        System.debug('Lista de nomes feita a partir do Set: ' + listaDeNomesVindaDoSet);

    }
    
    public static void manipulaListasDeString() 
    {   
               
        List<String> frutas = new List<String> {'maçã', 'uva'};
        system.debug('\nLista inicial de frutas: ' + frutas); 
        
        
        // Substituindo o valor no índice 0:
        frutas[0] = 'morango';
        system.debug('\nLista de Frutas quando digitei frutas[0] = \'morango\': ' + frutas);
        
        
        // Aumentando a lista:
        frutas.add('cajá');
        system.debug('\nLista de Frutas quando digitei frutas.add(\'cajá\'): ' + frutas);
        frutas.add(2, 'banana');
        system.debug('\nLista de Frutas quando digitei frutas.add(2, \'banana\'): ' + frutas);
        
        
        system.debug('\nLista final de frutas: ' + frutas);
    }  
    
    public static void criaEMostraListaDeSObject() 
    {    
        
        List<Account> contas = new List<Account>();
        Account primeiraContaNova = new Account (Name = 'Empresa A');
        Account segundaContaNova = new Account (Name = 'Empresa B');
        contas.add(primeiraContaNova);
        contas.add(segundaContaNova);
        
        System.debug('Lista de contas: ' + contas);
        
        // RESPOSTA: 
        // Lista de contas: (Account:{Name=Empresa A}, Account:{Name=Empresa B})
       
    }    
    
}