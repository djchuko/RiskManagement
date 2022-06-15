namespace riskmanagement; 

//Core de las CDS
using { managed } from '@sap/cds/common'; 
//External service from S/4
using { API_BUSINESS_PARTNER as external } from '../srv/external/API_BUSINESS_PARTNER.csn';

entity Risks : managed { 
    key ID : UUID @(Core.Computed : true); 
    title : String(100); owner : 
    String; prio : String(5); 
    descr : String;     
    impact : Integer; 
    criticality : Integer; 
    
    //Entidades relacionadas
    miti : Association to Mitigations; 
    bp : Association to BusinessPartners;     
} 

entity Mitigations : managed { 
    key ID : UUID @(Core.Computed : true); 
    descr : String; 
    owner : String; 
    timeline : String; 

    //Entidades relacionadas
    risks : Association to many Risks on risks.miti = $self; 
}
   
entity BusinessPartners as projection on external.A_BusinessPartner {
    key BusinessPartner,
    LastName, 
    FirstName 
} 