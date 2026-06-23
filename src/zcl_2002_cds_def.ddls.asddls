@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Core Data Services Definition.'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZCL_2002_CDS_DEF as select from z20002_employ
{

key employee_id as EmployeeId,
first_name as FirstName,
last_name as LastName,
birth_date as BirthDate
    
}
