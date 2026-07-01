@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: ' Employee (Query)'
@Metadata.ignorePropagatedAnnotations: true
define view entity Z20002_C_EmployeeQuery
  as select from Z20002_R_EMPLOYEE
{
  key EmployeeId,
      FirstName,
      LastName,
      DepartmentId,
      _Department.Description         as DepartmentDescription,
      _Department._Assistant.LastName as AssistantName,


      /* Associations */
      _Department

}
