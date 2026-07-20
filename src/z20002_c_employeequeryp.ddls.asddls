@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: ' Employee (Query)'
@Metadata.ignorePropagatedAnnotations: true
define view entity Z20002_C_EmployeeQueryP
  with parameters

    p_target_curr : /dmo/currency_code,
    @EndUserText.label: 'Date of Evaluation'
    @Environment.systemField: #SYSTEM_DATE //Make sure date is selected by default when no date is selected use annotation.
    p_date        : abap.dats


  as select from Z20002_R_EMPLOYEE
{
  key EmployeeId,
      FirstName,
      LastName,
      DepartmentId,
      _Department.Description                                                                     as DepartmentDescription,
      // _Department._Assistant.LastName          as AssistantName,
      concat_with_space( _Department._Assistant.FirstName,
                    _Department._Assistant.LastName,
                    1 )                                                                           as AssistantName,
      @EndUserText.label: 'Employee Role'
      case EmployeeId
      when _Department.HeadId then 'Department Head'
      when _Department.AssistantId then 'Assistant Department Head'
      else ''
      end                                                                                         as EmployeeRole,


      @EndUserText.label: 'Annual Salary'
      @Semantics.amount.currencyCode: 'CurrencyCode'
      currency_conversion( amount             => AnnualSalary,
                        source_currency    => CurrencyCode ,
                        target_currency    => $projection.CurrencyCode, //projection here means use waht has been declared before dont repeat project on it.
      // exchange_rate_date => $session.system_date replace with parameters
                       exchange_rate_date => $parameters.p_date

                      )                                                                           as AnnualSalaryConverted,
      // projection means use what is existing dont define again here annual salary is already sorted out.
      cast( $projection.AnnualSalaryConverted as abap.fltp ) / 12.0                               as MonthlySalaryConverted,
      // CurrencyCode,
      // cast( 'USD' as /dmo/currency_code )                                   as CurrencyCodeUSD, use paramete not literal
      $parameters.p_target_curr                                                                   as CurrencyCode,
      /* Associations */
      //use input variables parameter instead of system $ session variables.
      division(dats_days_between(EntryDate, /*$session.system_date*/$parameters.p_date ),365, 1 ) as CompanyAffliation,
      _Department


}
