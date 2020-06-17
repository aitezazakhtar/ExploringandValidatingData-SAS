***********************************************************;
*  LESSON 3, PRACTICE 4                                   *;
*  a) Add a WHERE statement to print only the rows where  *;
*     ParkName includes Preserve.                         *;
***********************************************************;

proc print data=pg1.np_summary;
	var Type ParkName;
	where ParkName like "%Preserve%";
run;

*********************************************************************;
*  1) Write a PROC PRINT step to read the pg1.eu_occ table.
      Use a WHERE statement to list rows where Hotel, ShortStay, 
      and Camp are missing.
*  2) Write WHERE statement to list rows with Hotel values greater 
      than 40,000,000. Submit the program.
**********************************************************************;

*1);
proc print data=pg1.eu_occ;
     var Hotel ShortStay Camp;
     where Hotel is missing and ShortStay is missing and Camp is missing;
run;

*2);
proc print data=pg1.eu_occ;
     where Hotel > 40000000;
run;

*******************************************************************************;
* 1) Write a PROC PRINT step that lists ParkName, Location, and Count. 
     Print rows where Count is not equal to 0 and Location includes 
     MAIN ENTRANCE. Submit the program. Use the log to confirm that 38 
     rows are listed.
  2) Use the UPCASE function on the Location column to include any case 
     of MAIN ENTRANCE. Submit the program and verify that 40 rows are listed.
********************************************************************************;

*1);
proc print data=pg1.np_traffic;
     where Count ^=0 and Location like "%MAIN ENTRANCE%";
run;

*2);
proc print data=pg1.np_traffic;
     where Count ^=0 and upcase(Location) like "%MAIN ENTRANCE%";
run;





