@isTest
private class ProductZoningServiceTest {
    
	@TestSetup
    static void setup(){
    	//Criar produto simples
    	Product2 product = new Product2(Name = 'Test product', ProductCode = 'GC1020', Family = 'TestFamily');
        insert product;
    }
    
    @isTest
    static void testGetPermissibleFlyZone(){
        //Teste com productcode e countrycode válidos
        RestRequest req = new RestRequest();
        req.requestURI = ('/services/apexrest/ProductZoning/');
        req.addParameter('ProductCode','GC1020');
        req.httpMethod = 'GET';
        req.headers.put('CountryCode','US');
        RestContext.request = req;
        RestContext.response = new RestResponse();
        
        String response = ProductZoningService.getPermissibleFlyZone();
        System.assertEquals('Confirm with the local authorities',response);
        
        //Teste com productcode válido e outro countrycode
       	req.headers.put('CountryCode','DE');
        response = ProductZoningService.getPermissibleFlyZone();
        System.assertEquals('Confirm with the local authorities',response);

		//Teste com productcode válido e countrycode não definido
       	req.headers.put('CountryCode','FR');
        response = ProductZoningService.getPermissibleFlyZone();
        System.assertEquals('Confirm with the local authorities',response);		
       
        //Teste com productcode faltando
        req = new RestRequest();
        req.requestURI = ('/services/apexrest/ProductZoning/');
        req.httpMethod = 'GET';
        RestContext.request = req;
        response = ProductZoningService.getPermissibleFlyZone();
        System.assertEquals('ProductCode is missing or does not exist',response);
        
        //Teste com productcode não existente
        req = new RestRequest();
        req.requestURI = ('/services/apexrest/ProductZoning/');
        req.addParameter('ProductCode','INVALID');        
        req.httpMethod = 'GET';
        RestContext.request = req;
        response = ProductZoningService.getPermissibleFlyZone();
        System.assertEquals('ProductCode is missing or does not exist',response);
    }
}
