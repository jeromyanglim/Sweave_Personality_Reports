output = .output
rnwfile = Report_Template
backup = .backup

all:
	-mkdir $(output)
	-cp $(rnwfile).Rnw
	cd $(output); R CMD Sweave $(rnwfile).Rnw
	-cp *.sty $(output)
	cd $(output); texify --run-viewer --pdf $(rnwfile).tex 

tex:
	cd $(output); texify --run-viewer --pdf $(rnwfile).tex

clean:
	-rm $(output)/*
	
backup:
	-mkdir $(backup)
	cp 	$(output)/$(rnwfile).pdf $(backup)/$(rnwfile).pdf 