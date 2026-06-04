CLASS zcl_20002_intro DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_20002_intro IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

  DATA var TYPE /lrn/s4d430_ind_delem .
    var = 1.


    SELECT FROM /LRN/S4D430_IND_CDS_View
         FIELDS *
           INTO TABLE @DATA(result).
           APPEND INITIAL LINE TO result  ASSIGNING FIELD-SYMBOL(<results>).
           <results>-description = 'Meaningful'.
           <results>-id = var.



out->write( result ).

  ENDMETHOD.
ENDCLASS.
