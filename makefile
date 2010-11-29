outputDir = .output
backupDir = .backup

test:
	-mkdir $(outputDir)
	Rscript --verbose run1test.R  

test5:
	-mkdir $(outputDir)
	Rscript --verbose run5test.R  


runall:
	-mkdir $(outputDir)
	Rscript --verbose runAll.R  

clean:
	-rm $(outputDir)/*
	
backup:
	-mkdir $(backupDir)
	cp $(outputDir)/Report_Template_ID*[0123456789].pdf --target-directory=$(backupDir) 