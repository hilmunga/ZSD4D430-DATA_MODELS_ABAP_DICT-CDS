CLASS zcl_20002_parameter DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_20002_PARAMETER IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    SELECT
*FROM /LRN/C_Employee_Ann
*You have to supply the parameters to the CDS with parameters here we have used literal method.
*Remember that sy-datum is a host variable and that you have to escape it with @.
      FROM Z20002_C_EmployeeQueryP(
*      p_date = @sy-datum This has been taken care of in cds using env annotation to capture date automatically.
       p_target_curr = 'EUR'

      )


    FIELDS employeeid,
           firstname,
           lastname,
           departmentid,

           departmentdescription,
           assistantname,
           \_department\_head-lastname AS headname,

          MonthlySalaryConverted,
          CurrencyCode,
          CompanyAffliation


    INTO TABLE @DATA(result).

    out->write( result ).

  ENDMETHOD.
ENDCLASS.
