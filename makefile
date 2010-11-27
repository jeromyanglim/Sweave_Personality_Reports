outputDir = .output
rnwfile = Report_Template
backupDir = .backup

all:
	-mkdir $(outputDir)
	Rscript --verbose main.R  

clean:
	-rm $(outputDir)/*
	
backup:
	-mkdir $(backupDir)
	cp 	$(outputDir)/*.pdf --target-directory=$(backupDir) 