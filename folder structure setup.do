
	global github 	"C:\Users\wb501238\Documents\GitHub\Example-project-repo"
	global dropbox	"C:\Users\wb501238\Dropbox\WB\Example project folder"
	
	
	foreach folder in github dropbox {
	
		* Create project folder
		iefolder new project, projectfolder(${`folder'}) abbrev(bl)

		* Create round folder
		iefolder new round Baseline, projectfolder(${`folder'}) abbrev(bl)
		
	}
	
	* Create placeholders on github project strucutre
	iegitaddmd, folder(${github})
