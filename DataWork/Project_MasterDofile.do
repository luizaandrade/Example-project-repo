   * ******************************************************************** *
   * ******************************************************************** *
   *                                                                      *
   *               your_project_name                                      *
   *               MASTER DO_FILE                                         *
   *                                                                      *
   * ******************************************************************** *
   * ******************************************************************** *

       /*
       ** PURPOSE:      Write intro to project here

       ** OUTLINE:      PART 0: Standardize settings and install packages
                        PART 1: Set globals for dynamic file paths
                        PART 2: Set globals for constants and varlist
                               used across the project. Install all user-contributed
                               commands needed.
                        PART 3: Call the task-specific master do-files 
                               that call all dofiles needed for that 
                               task. Do not include Part 0-2 in a task-
                               specific master do-file


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

   * Root folder globals
   * ---------------------

   if inlist(c(username), "wb501238", "WB501238") == 1 {
   
		global github 	"C:\Users\wb501238\Documents\GitHub\Example-project-repo"
		global dropbox	"C:\Users\wb501238\Dropbox\WB\Example project folder"
   }


* These lines are used to test that the name is not already used (do not edit manually)
*round*Baseline*bl**************************************************************
*untObs*************************************************************************
*subFld*************************************************************************
*iefolder will not work properly if the lines above are edited


   * Project folder globals
   * ---------------------

   global dataWorkFolder         "$dropbox/DataWork"

*iefolder*1*FolderGlobals*subfolder*********************************************
*iefolder will not work properly if the line above is edited


*iefolder*1*FolderGlobals*master************************************************
*iefolder will not work properly if the line above is edited

   global mastData               "$dataWorkFolder/MasterData" 

*iefolder*1*FolderGlobals*encrypted*********************************************
*iefolder will not work properly if the line above is edited

   global encryptFolder          "$dataWorkFolder/EncryptedData" 


*iefolder*1*RoundGlobals*rounds*Baseline*bl*************************************
*iefolder will not work properly if the line above is edited

   *Baseline folder globals
   global bl                     "$dataWorkFolder/Baseline" 
   global bl_encrypt             "$encryptFolder/Round Baseline Encrypted" 
   global bl_dt                  "$bl/DataSets" 
   global bl_do                  "${github}/DataWork/Baseline/Dofiles" 
   global bl_out                 "$bl/Output" 

*iefolder*1*FolderGlobals*endRounds*********************************************
*iefolder will not work properly if the line above is edited


*iefolder*1*End_FolderGlobals***************************************************
*iefolder will not work properly if the line above is edited


*iefolder*2*StandardGlobals*****************************************************
*iefolder will not work properly if the line above is edited

   * Set all non-folder path globals that are constant accross
   * the project. Examples are conversion rates used in unit
   * standardization, different sets of control variables,
   * adofile paths etc.

   do "${github/DataWork/global_setup.do" 


*iefolder*2*End_StandardGlobals*************************************************
*iefolder will not work properly if the line above is edited


*iefolder*3*RunDofiles**********************************************************
*iefolder will not work properly if the line above is edited

   * ******************************************************************** *
   *
   *       PART 3: - RUN DOFILES CALLED BY THIS MASTER DOFILE
   *
   *           - When survey rounds are added, this section will
   *            link to the master dofile for that round.
   *           - The default is that these dofiles are set to not
   *            run. It is rare that all round-specfic master dofiles
   *            are called at the same time; the round specific master
   *            dofiles are almost always called individually. The
   *            exception is when reviewing or replicating a full project.
   *
   * ******************************************************************** *


*iefolder*3*RunDofiles*Baseline*bl**********************************************
*iefolder will not work properly if the line above is edited


*iefolder*3*End_RunDofiles******************************************************
*iefolder will not work properly if the line above is edited

