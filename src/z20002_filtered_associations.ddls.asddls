@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Filtered Associations'
@Metadata.ignorePropagatedAnnotations: true
define view entity Z20002_Filtered_Associations
  as select from /DMO/I_Connection_R

{
  key AirlineID,
  key ConnectionID,

      // _Airline._Currency._Text.CurrencyName // Many rows returned causing confusion and warning.

      //_Airline._Currency._Text[ Language = 'E' ].CurrencyName // Not sure still if one row will be returned.

      _Airline._Currency._Text[ 1: Language = 'E' ].CurrencyName //1 in this gurantees only one record is returned.
}
where
      AirlineID    = 'AA'
  and ConnectionID = '0017'
