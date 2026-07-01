CLASS zcl_20002_path_exp DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_20002_PATH_EXP IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    SELECT
    FROM Z20002_C_EmployeeQuery
    FIELDS employeeid,
           firstname,
           lastname,
           departmentid,
           departmentdescription,
           assistantname,
           \_department\_head-lastname AS headname

    INTO TABLE @DATA(result).

    out->write( result ).

  ENDMETHOD.
ENDCLASS.
