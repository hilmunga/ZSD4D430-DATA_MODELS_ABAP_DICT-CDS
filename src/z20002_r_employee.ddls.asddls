//@AbapCatalog.viewEnhancementCategory: [#PROJECTION_LIST]//[#NONE] change for extensibility purposes to #PROJECTION_LIST
@AbapCatalog: {
    dataMaintenance: #RESTRICTED,
    viewEnhancementCategory: [#PROJECTION_LIST],
    extensibility.dataSources: [ 'Employee' ],
    extensibility.elementSuffix: 'ZEM'

 }
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Employee (Entity)'
@Metadata.ignorePropagatedAnnotations: true
define view entity Z20002_R_EMPLOYEE
  as select from z20002_employ as Employee
  association [1..1] to Z20002_R_Department as _Department on $projection.DepartmentId = _Department.Id
{
  key employee_id           as EmployeeId,
      first_name            as FirstName,
      last_name             as LastName,
      birth_date            as BirthDate,
      entry_date            as EntryDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      annual_salary         as AnnualSalary,
      department_id         as DepartmentId,
      currency_code         as CurrencyCode,
      created_by            as CreatedBy,
      created_at            as CreatedAt,
      local_last_changed_by as LocalLastChangedBy,
      local_last_changed_at as LocalLastChangedAt,
      last_changed_at       as LastChangedAt,
      _Department
}
