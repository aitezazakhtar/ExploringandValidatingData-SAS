*****************************************************************************************;
*  1) Write a PROC FREQ step to analyze rows from pg1.np_species.
   Include only rows where Species_ID starts with YOSE (Yosemite National Park) 
   and Category equals Mammal. Generate frequency tables for Abundance and 
   Conservation_Status.
*  2) Write a PROC PRINT step to list the same subset of rows from pg1.np_species.
   Include Species_ID, Category, Scientific_Name, and Common_Names in the report.
*  3) Create a macro variable named ParkCode to store YOSE, and another macro variable 
   named SpeciesCat to store Mammal. Modify the code to reference the macro variables. 
*  4) Change the values of the macro variables to ZION (Zion National Park) and Bird. 
******************************************************************************************;

*1);
proc freq data=pg1.np_species;
          tables Abundance Conservation_Status;
          where Species_ID like "YOSE%" and Category = "Mammal";
run;

*2);
proc print data=pg1.np_species;
     var Species_ID Category Scientific_Name Common_Names;
     where Species_ID like "YOSE%" and Category = "Mammal";
run;

*3) create macro variable;
%let ParkCode=YOSE;
%let SpeciesCat=Mammal;

proc print data=pg1.np_species;
     var Species_ID Category Scientific_Name Common_Names;
     where Species_ID like "&ParkCode%" and Category = "&SpeciesCat";
run;

*4);
%let ParkCode=ZION;
%let SpeciesCat=Bird;

proc print data=pg1.np_species;
     var Species_ID Category Scientific_Name Common_Names;
     where Species_ID like "&ParkCode%" and Category = "&SpeciesCat";
run;

