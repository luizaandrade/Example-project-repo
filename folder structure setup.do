
	global github 	"C:\Users\wb501238\Documents\GitHub\Example-project-repo"
	global dropbox	"C:\Users\wb501238\Dropbox\WB\Example project folder"
	
	
	foreach folder in github dropbox {
	
		* Create project folder
		cap iefolder new project, projectfolder(${`folder'}) abbrev(bl)

		* Create round folder
		cap iefolder new round Baseline, projectfolder(${`folder'}) abbrev(bl)
		
		* Create randomization folder
		iefolder new round Randomization, projectfolder(${`folder'}) abbrev(rand)
		
	}
	
	* Create placeholders on github project strucutre
	iegitaddmd, folder(${github})
