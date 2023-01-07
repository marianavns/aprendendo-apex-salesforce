public class Estudo04ImpressoraDeMaps {

    public static void criaEMostraMaps(){
    
        // CRIAÇÃO DE MAP VAZIO
        Map<Integer,String> codigosECidades = new Map<Integer,String>();
   
        
        // CRIAÇÃO DE MAP POPULADO    
        Map<String,String> capitaisEEstados = new Map<String,String>{
            'Pernambuco' => 'Recife',
            'Alagoas' => 'Maceió',
            'Pará' => 'Belém',
            'Espírito Santo' => 'Vitória'    
        };
        System.debug('Map populado no momento da criação, com "new Map<String,String>{\'Pernambuco\' => \'Recife\'...": ' + capitaisEEstados);
        
        
        // CRIAÇÃO DE MAP A PARTIR DE LISTA DE REGISTROS
                // Aqui a chave será o ID Salesforce, e o valor será todos os campos do registro, incluindo o ID
        List<Case> listaDeCasos = [SELECT Id, CaseNumber, Origin, Status FROM Case];
        Map<Id,Case> mapDeRegistros = new Map<Id,Case>(listaDeCasos);
        System.debug('Map de Registros a partir da lista vinda da query "SELECT Id, CaseNumber, Origin, Status FROM Case": ' + mapDeRegistros);
              
        
        // CRIAÇÃO DE MAP A PARTIR DE OUTRO MAP
        
    }
    
}