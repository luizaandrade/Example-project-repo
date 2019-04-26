   * ******************************************************************** *
   * ******************************************************************** *
   *                                                                      *
   *               your_round_name                                        *
   *               MASTER DO_FILE                                         *
   *                                                                      *
   * ******************************************************************** *
   * ******************************************************************** *

       /*
       ** PURPOSE:      Write intro to survey round here

       ** OUTLINE:      PART 0: Standardize settings and install packages
                        PART 1: Prepare folder path globals
                        PART 2: Run the master dofiles for each high-level task

       ** IDS VAR:      list_ID_var_here         //Uniquely identifies households (update for your project)

       ** NOTES:

       ** WRITTEN BY:   names_of_contributors

       ** Last date modified: 26 Apr 2019
       */

*iefolder*0*StandardSettings****************************************************
*iefolder will not work properly if the line above is edited

   * ******************************************************************** *
   *
   *       PART 0:  INSTALL PACKAGES AND STANDARDIZE SETTINGS
   *
   *           - Install packages needed to run all dofiles called
   *            by this master dofile.
   *           - Use ieboilstart to harmonize settings across users
   *
   * ******************************************************************** *

*iefolder*0*End_StandardSettings************************************************
*iefolder will not work properly if the line above is edited

   *Install all packages that this project requires:
   *(Note that this never updates outdated versions of already installed commands, to update commands use adoupdate)
   local user_commands ietoolkit       //Fill this list will all user-written commands this project requires
   foreach command of local user_commands {
       cap which `command'
       if _rc == 111 {
           ssc install `command'
       }
   }

   *Standardize settings accross users
   ieboilstart, version(12.1)          //Set the version number to the oldest version used by anyone in the project team
   `r(version)'                        //This line is needed to actually set the version from the command above

*iefolder*1*FolderGlobals*******************************************************
*iefolder will not work properly if the line above is edited

   * ******************************************************************** *
   *
   *       PART 1:  PREPARING FOLDER PATH GLOBALS
   *
   *           - Set the global box to point to the project folder
   *            on each collaborator's computer.
   *           - Set other locals that point to other folders of interest.
   *
   * ******************************************************************** *

   * Users
   * -----------

   *User Number:
   * You                     1    // Replace "You" with your name
   * Next User               2    // Assign a user number to each additional collaborator of this code

   *Set this value to the user currently using this file
   global user  1

   * Root folder globals
   * ---------------------

   if $user == 1 {
       global projectfolder "C:\Users\wb501238\Documents\GitHub\Example-project-repo"
   }

   if $user == 2 {
       global projectfolder ""  // Enter the file path to the project folder for the next user here
   }

* These lines are used to test that the name is not already used (do not edit manually)

   * Project folder globals
   * ---------------------

   global dataWorkFolder         "$projectfolder/DataWork"

*iefolder*1*FolderGlobals*master************************************************
*iefolder will not work properly if the line above is edited

   global mastData               "$dataWorkFolder/MasterData" 

*iefolder*1*FolderGlobals*encrypted*********************************************
*iefolder will not work properly if the line above is edited

   global encryptFolder          "$dataWorkFolder/EncryptedData" 

*iefolder*1*FolderGlobals*Baseline**********************************************
*iefolder will not work properly if the line above is edited


   *Encrypted round sub-folder globals
   global bl                     "$dataWorkFolder/Baseline" 

   *Encrypted round sub-folder globals
   global bl_encrypt             "$encryptFolder/Round Baseline Encrypted" 
   global bl_dtRaw               "$bl_encrypt/Raw Identified Data" 
   global bl_doImp               "$bl_encrypt/Dofiles Import" 
   global bl_HFC                 "$bl_encrypt/High Frequency Checks" 

   *DataSets sub-folder globals
   global bl_dt                  "$bl/DataSets" 
   global bl_dtDeID              "$bl_dt/Deidentified" 
   global bl_dtInt               "$bl_dt/Intermediate" 
   global bl_dtFin               "$bl_dt/Final" 

   *Dofile sub-folder globals
   global bl_do                  "$bl/Dofiles" 
   global bl_doCln               "$bl_do/Cleaning" 
   global bl_doCon               "$bl_do/Construct" 
   global bl_doAnl               "$bl_do/Analysis" 

   *Output sub-folder globals
   global bl_out                 "$bl/Output" 
   global bl_outRaw              "$bl_out/Raw" 
   global bl_outFin              "$bl_out/Final" 

   *Questionnaire sub-folder globals
   global bl_prld                "$bl_quest/PreloadData" 
   global bl_doc                 "$bl_quest/Questionnaire Documentation" 

*iefolder*1*End_FolderGlobals***************************************************
*iefolder will not work properly if the line above is edited


*iefolder*2*StandardGlobals*****************************************************
*iefolder will not work properly if the line above is edited

   * Set all non-folder path globals that are constant accross
   * the project. Examples are conversion rates used in unit
   * standardization, different sets of control variables,
   * adofile paths etc.

   do "$dataWorkFolder/global_setup.do" 


*iefolder*2*End_StandardGlobals*************************************************
*iefolder will not work properly if the line above is edited


*iefolder*3*RunDofiles**********************************************************
*iefolder will not work properly if the line above is edited

   * ******************************************************************** *
   *
   *       PART 3: - RUN DOFILES CALLED BY THIS MASTER DOFILE
   *
   *           - A task master dofile has been created for each high-
   *            level task (cleaning, construct, analysis). By 
   *            running all of them all data work associated with the 
   *            Baseline should be replicated, including output of 
   *            tables, graphs, etc.
   *           - Feel free to add to this list if you have other high-
   *            level tasks relevant to your project.
   *
   * ******************************************************************** *

   **Set the locals corresponding to the tasks you want
   * run to 1. To not run a task, set the local to 0.
   local importDo       0
   local cleaningDo     0
   local constructDo    0
   local analysisDo     0

   if (`importDo' == 1) { // Change the local above to run or not to run this file
       do "$bl_doImp/bl_import_MasterDofile.do" 
   }

   if (`cleaningDo' == 1) { // Change the local above to run or not to run this file
       do "$bl_do/bl_cleaning_MasterDofile.do" 
   }

   if (`constructDo' == 1) { // Change the local above to run or not to run this file
       do "$bl_do/bl_construct_MasterDofile.do" 
   }

   if (`analysisDo' == 1) { // Change the local above to run or not to run this file
       do "$bl_do/bl_analysis_MasterDofile.do" 
   }

*iefolder*3*End_RunDofiles******************************************************
*iefolder will not work properly if the line above is edited

