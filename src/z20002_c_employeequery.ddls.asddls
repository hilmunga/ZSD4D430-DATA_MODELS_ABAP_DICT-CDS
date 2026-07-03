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
      _Department.Description                  as DepartmentDescription,
      _Department._Assistant.LastName          as AssistantName,
      @EndUserText.label: 'Employee Role'
      case EmployeeId
      when _Department.HeadId then 'H'
      when _Department.AssistantId then 'A'
      else ''
      end                                      as EmployeeRole,
      @EndUserText.label: 'Monthly Salary'
      @Semantics.amount.currencyCode: 'CurrencyCode'
      cast( AnnualSalary as abap.fltp ) / 12.0 as MonthlySalary,
      CurrencyCode,

      /* Associations */
      _Department


}
