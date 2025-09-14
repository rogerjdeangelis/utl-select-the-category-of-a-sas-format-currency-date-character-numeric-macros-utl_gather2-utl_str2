%let pgm=utl-select-the-category-of-a-sas-format-currency-date-character-numeric-macros-utl_gather2-utl_str2;

%stop_submission;

Select the category of a sas format currency date character numeric macro utl_gather2

  CONTENTS

     1 macro utl_gaher2
       Alea Iacta
       https://github.com/clindocu
     2 macro utl_str2  (write to output window-also work,ddt_final)
       https://github.com/clindocu
     3 contents (see sas communities for solution)

github
https://tinyurl.com/ky43fwa6
https://github.com/rogerjdeangelis/utl-select-the-category-of-a-sas-format-currency-date-character-numeric-macros-utl_gather2-utl_str2

communities.sas
https://tinyurl.com/3bcek7vx
https://communities.sas.com/t5/SAS-Programming/Identify-List-all-date-fields/m-p/727202#M226118

INPUT
=====

WORK>HAVE

Variable    Type    Len    Format       Informat    Label

FAKE        Num       8                             TODAYS DATE
STOCK       Char      9                             TODAYS STOCK
DATE        Num       8    DATE.        DATE.       TODAYS DATE
OPEN        Num       8    DOLLAR8.2    BEST32.     TODAYS OPEN
HIGH        Num       8    DOLLAR8.2    BEST32.     TODAYS HIGH
LOW         Num       8    DOLLAR8.2    BEST32.     TODAYS LOW
CLOSE       Num       8    DOLLAR8.2    BEST32.     TODAYS CLOSE
VOLUME      Num       8    COMMA12.     BEST32.     TODAYS VOLUME
ADJCLOSE    Num       8    DOLLAR8.2    BEST32.     Adjusted Close
XX          Num       8    MMDDYY10.


data have;
label
FAKE   = "TODAYS DATE "
STOCK  = "TODAYS STOCK "
DATE   = "TODAYS DATE "
OPEN   = "TODAYS OPEN "
HIGH   = "TODAYS HIGH "
LOW    = "TODAYS LOW "
CLOSE  = "TODAYS CLOSE "
VOLUME = "TODAYS VOLUME "
;
set sashelp.stocks;
format xx mmddyy10.;
fake = today();
run;

/*         _   _                 _   _              ____
/ |  _   _| |_| |     __ _  __ _| |_| |__   ___ _ _|___ \
| | | | | | __| |    / _` |/ _` | __| `_ \ / _ \ `__|__) |
| | | |_| | |_| |   | (_| | (_| | |_| | | |  __/ |  / __/
|_|  \__,_|\__|_|____\__, |\__,_|\__|_| |_|\___|_| |_____|
               |_____|___/
*/


%utl_gather2(have(obs=1),var,val,,want,ValFormat=$10., WithFormats=Y, WithLabels=Y, SASFormats=Y);

THIS IS FORMAT CATEGORY

proc print data=want;
 var var val _colformat _coltyp;
run;quit;
                                           Format
                                           Category
 VAR         VAL            _COLFORMAT     _COLTYP

 FAKE        23998          BEST12.        num
 STOCK       IBM            $9.            char
 DATE        01DEC05        DATE7.         date
 OPEN        $89.15         DOLLAR8.2      curr
 HIGH        $89.92         DOLLAR8.2      curr
 LOW         $81.56         DOLLAR8.2      curr
 CLOSE       $82.20         DOLLAR8.2      curr
 VOLUME      5,976,252      COMMA12.       num
 ADJCLOSE    $81.37         DOLLAR8.2      curr
 XX                         MMDDYY10.      date

proc print data=want heading=vertical width=min;
run;quit;

VAR       VAL        _COLLAB         _COLFORMAT _COLTYP _COLTYPVAR _ISREALNUM _SASFORMAT    _ISMISSING

FAKE      23998      TODAYS DATE     BEST12.     num        N           1     BEST12.
STOCK     IBM        TODAYS STOCK    $9.         char       C           .     $9.
DATE      01DEC05    TODAYS DATE     DATE7.      date       N           .     DATE7.
OPEN      $89.15     TODAYS OPEN     DOLLAR8.2   curr       N           .     DOLLAR8.2
HIGH      $89.92     TODAYS HIGH     DOLLAR8.2   curr       N           .     DOLLAR8.2
LOW       $81.56     TODAYS LOW      DOLLAR8.2   curr       N           .     DOLLAR8.2
CLOSE     $82.20     TODAYS CLOSE    DOLLAR8.2   curr       N           .     DOLLAR8.2
VOLUME    5,976,252  TODAYS VOLUME   COMMA12.    num        N           0     COMMA12.
ADJCLOSE  $81.37     Adjusted Close  DOLLAR8.2   curr       N           .     DOLLAR8.2
XX                   XX              MMDDYY10.   date       N           .     MMDDYY10.         Y

/*___          _   _         _       ____
|___ \   _   _| |_| |    ___| |_ _ _|___ \
  __) | | | | | __| |   / __| __| `__|__) |
 / __/  | |_| | |_| |   \__ \ |_| |  / __/
|_____|  \__,_|\__|_|___|___/\__|_| |_____|
                   |_____|
*/

%utl_str2(have);

'dataframe':   699 obs. of   10 variables:
 $ FAKE    : int 23998 23998 23998 23998 23998 23998 23998 23998 23998 23998 23...
           : SAS Format: not def., default: BEST12. ("integer:", length: 5)
           : Label: "TODAYS DATE"
 $ STOCK   : chr IBM IBM IBM IBM IBM IBM IBM IBM IBM IBM IBM IBM IBM IBM IBM IB...
           : SAS Format: not def., default: $9. (real length: 9)
           : Label: "TODAYS STOCK"
 $ DATE    : date 01DEC05 01NOV05 03OCT05 01SEP05 01AUG05 01JUL05 01JUN05 02MAY0...
           : SAS Format: DATE.
           : Label: "TODAYS DATE"
 $ OPEN    : curr $89.15 $81.85 $80.22 $80.16 $83.00 $74.30 $75.57 $76.88 $91.49...
           : SAS Format: DOLLAR8.2
           : Label: "TODAYS OPEN"
 $ HIGH    : curr $89.92 $89.94 $84.60 $82.11 $84.20 $85.11 $77.73 $78.11 $91.76...
           : SAS Format: DOLLAR8.2
           : Label: "TODAYS HIGH"
 $ LOW     : curr $81.56 $80.64 $78.70 $76.93 $79.87 $74.16 $73.45 $72.50 $71.85...
           : SAS Format: DOLLAR8.2
           : Label: "TODAYS LOW"
 $ CLOSE   : curr $82.20 $88.90 $81.88 $80.22 $80.62 $83.46 $74.20 $75.55 $76.38...
           : SAS Format: DOLLAR8.2
           : Label: "TODAYS CLOSE"
 $ VOLUME  : num 5,976,252 5,556,471 7,019,666 5,772,280 4,801,386 8,056,590 6,...
           : SAS Format: COMMA12.
           : Label: "TODAYS VOLUME"
 $ ADJCLOSE: curr $81.37 $88.01 $80.86 $79.22 $79.62 $82.23 $73.10 $74.43 $75.05...
           : SAS Format: DOLLAR8.2
           : Label: "Adjusted Close"
 $ XX      : date , , , , , , , , , , , , , , , , , , , , , , , , , , , , , , ,...
           : SAS Format: MMDDYY10. <all values missing>

/*              _
  ___ _ __   __| |
 / _ \ `_ \ / _` |
|  __/ | | | (_| |
 \___|_| |_|\__,_|

*/
