@isTest
private class CredentialVerificationServiceTest {
	@isTest
    static void testVerifyCredential_Valid(){
       //contato1
        Contact testContact = new Contact(LastName = 'Doe');
        insert testContact;
        //certificado dele
		Certification__c cert = new Certification__c(Name='SalesforceCertification');
        insert cert;
        
        // Novo certificado
        Date issueDate = Date.today();
        Contact_Certification__c testCertification = new Contact_Certification__c(
            isActive__c = true,
            Certification__c = cert.Id, 
            Issue_Date__c = issueDate,
            Contact__c = testContact.Id
        );
        insert testCertification;
        
        Contact_Certification__c conCert = [SELECT Name FROM Contact_Certification__c WHERE Contact__c = :testContact.Id];
        //Teste real
        Test.startTest();
        String result = CredentialVerificationService.verifyCredential(testContact.LastName, conCert.Name);        
        Test.stopTest();
        
        //Valida
        System.assertEquals('Valid',result,'Expected result to be "Valid"');        
        
    }
    @isTest
    static void testVerifyCredential_InactiveCertification() {
        // Usuario teste
        Contact testContact = new Contact(LastName = 'Smith');
        insert testContact;
		Certification__c cert = new Certification__c(Name='Pilot Certification');
        insert cert;
        // Certificado inativo
        Date issueDate = Date.today().addYears(-2);
        Contact_Certification__c testCertification = new Contact_Certification__c(
            isActive__c = false,
            Certification__c = cert.Id, 
            Issue_Date__c = issueDate,
            Contact__c = testContact.Id
        );
        insert testCertification;
        Contact_Certification__c conCert = [Select Name from Contact_Certification__c where contact__c = :testContact.Id];

        // Teste real
        Test.startTest();
        String result = CredentialVerificationService.verifyCredential(testContact.LastName, conCert.Name);
        Test.stopTest();

        // Valida
        System.assertEquals('Needs Renewal', result, 'Expected result to be "Needs Renewal"');
    }
    
	 @isTest
    static void testVerifyCredential_NoContact() {
        // Chama função sem contato existente
        Test.startTest();
        String result = CredentialVerificationService.verifyCredential('NonExistentLastName', 'Some Certification');
        Test.stopTest();

        // Valida
        System.assertEquals('No record found', result, 'Expected result to be "No record found"');
    }

    @isTest
    static void testVerifyCredential_NoCertification() {
        // Usuário sem certificação
        Contact testContact = new Contact(LastName = 'Johnson');
        insert testContact;

        // Teste real
        Test.startTest();
        String result = CredentialVerificationService.verifyCredential(testContact.LastName, 'NonExistentCertification');
        Test.stopTest();

        // Valida
        System.assertEquals('No record found', result, 'Expected result to be "No record found"');
    }
}

