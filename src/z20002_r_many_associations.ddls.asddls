@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Too many associations'
@Metadata.ignorePropagatedAnnotations: true
define view entity z20002_R_Many_associations
  as select from /DMO/I_Connection
  association [1..*] to /DMO/I_Flight as _FLIGHT on  $projection.AirlineID    = _FLIGHT.AirlineID
                                                 and $projection.ConnectionID = _FLIGHT.ConnectionID


{
  key AirlineID,
  key ConnectionID,

      //_FLIGHT.OccupiedSeats ths shows many associations which confuse so i make them aggregate.
      sum(_FLIGHT.OccupiedSeats) as TotalOccupiedSeats

}
where
      AirlineID    = 'LH'   // Only one connection
  and ConnectionID = '0400' // fulfills this condition

group by
  AirlineID,
  ConnectionID
