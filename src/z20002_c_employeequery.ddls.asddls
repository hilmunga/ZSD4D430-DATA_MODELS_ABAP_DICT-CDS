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
      _Department.Description                                               as DepartmentDescription,
      // _Department._Assistant.LastName          as AssistantName,
      concat_with_space( _Department._Assistant.FirstName,
                    _Department._Assistant.LastName,
                    1 )                                                     as AssistantName,
      @EndUserText.label: 'Employee Role'
      case EmployeeId
      when _Department.HeadId then 'Department Head'
      when _Department.AssistantId then 'Assistant Department Head'
      else ''
      end                                                                   as EmployeeRole,


      @EndUserText.label: 'Annual Salary'
      @Semantics.amount.currencyCode: 'CurrencyCodeUSD'
      currency_conversion( amount             => AnnualSalary,
                        source_currency    => CurrencyCode ,
                        target_currency    => $projection.CurrencyCodeUSD,
                        exchange_rate_date => $session.system_date
                      )                                                     as AnnualSalaryConverted,

      cast( $projection.AnnualSalaryConverted as abap.fltp ) / 12.0         as MonthlySalaryConverted,
      // CurrencyCode,
      cast( 'USD' as /dmo/currency_code )                                   as CurrencyCodeUSD,

      /* Associations */
      division(dats_days_between(EntryDate, $session.system_date ),365, 1 ) as CompanyAffliation,
      _Department


}
