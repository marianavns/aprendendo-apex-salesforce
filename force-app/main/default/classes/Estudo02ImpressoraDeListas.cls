public class Estudo02ImpressoraDeListas 
{  
    // ############### COMO DECLARAR LISTAS ###############
    
    public static void mostraListaDeFrutasString() 
    {
    
        // Lista populada quando declarada:
        List<String> frutas = new List<String> {'maçã', 'uva'};
        system.debug('\nLista de Frutas quando digitei List<String> frutas = new List<String> {\'maçã\', \'uva\'}: ' + frutas);
        
                 
        // Substituindo o valor no índice 0:
        frutas[0] = 'morango';
        system.debug('\nLista de Frutas quando digitei frutas[0] = \'morango\': ' + frutas);
        
        
        // Aumentando a lista:
        frutas.add('cajá');
        system.debug('\nLista de Frutas quando digitei frutas.add(\'cajá\'): ' + frutas);
        
                // Nenhum abaixo funcionaria, pois o índice 10 não existe
                // frutas.add(10, 'maracujá');
                // frutas[10] = 'maracujá';
        
        
        system.debug('\nLista de Frutas ao final: ' + frutas);
    }
    
    
    public static void mostraListaDeVerdurasString() 
    {
        List<String> verduras = new List<String> ();
        verduras.add('Pepino');      
    }
    
    
    public static void mostraListaDeDoces() 
    {
        String[] doces = new String[4];
        system.debug('\nLista de Doces quando digitei String[] doces = new String[4]: ' + doces);
        
        // Não importa a ordem: se não houver índice, o .add fica sempre por último E AUMENTA O TAMANHO DA LISTA!
        doces.add('Brigadeiro');
        system.debug('\nLista de doces quando digitei String[] doces = new String[4] e, depois, doces.add(\'Brigadeiro\');: ' + doces);
                  
        doces[1] = 'Cocada';
        system.debug('\nLista de doces quando digitei doces[1] = \'Cocada\';: ' + doces);
        
        system.debug('\nLista de Verduras: ' + doces);
    }
    
    
    public static void mostraListaDeNumeros() 
    {
        // Criando uma lista de números com 4 componentes
        Integer[] idades = new Integer[4];
        Integer[] vazia = new Integer[4];
        
        // Não importa a ordem: se não houver índice, o .add fica sempre por último E AUMENTA O TAMANHO DA LISTA!
        idades.add(27);
        idades.add(30); 
        idades.add(2, 50);
        
        system.debug('\nLista de Idades: ' + idades);
        // Saída: Lista de Idades: (null, null, 50, null, 27, 30) -> 
        // O add sempre faz uma bagunça! Se você usa ele para inserir o índice 0 numa lista de 4 itens...
        // ele adicionar mais um item na sua array e ela terá 5 itens kkk.
        system.debug('\nLista Vazia: ' + vazia);
    }
}