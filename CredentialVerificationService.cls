global with sharing class CredentialVerificationService {
    webservice static String verifyCredential (String LastName, String certificationName){
        System.debug('Input Parameters - LastName:' + LastName +',CertificationName:' + certificationName);
        String response = 'No record found';
        
        //Query de lastname
        List<Contact> contactQuery = [SELECT Id, LastName FROM Contact WHERE LastName = :lastName LIMIT 1];
        if(!contactQuery.isEmpty()){
            Contact contact = contactQuery[0];
        
        //Query de certificationName
        List<Contact_Certification__c> contactCertification = [SELECT Id, isActive__c, Name FROM Contact_Certification__c WHERE Name = :certificationName AND Contact__c = :contact.Id LIMIT 1];
        if(!contactCertification.isEmpty()){
            Contact_Certification__c certification = contactCertification[0];
            if(certification.isActive__c){
                response = 'Valid';
            }else{
                response = 'Needs Renewal';
            }
        }
    }
 	    System.debug('Response:' + response);
   	 	return response;
	}
}    
