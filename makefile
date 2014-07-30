all: screen print

screen:
	@CV_THEME=$${CV_THEME:-friggeri}; sed --in-place='.orig' "s/friggeri/$$CV_THEME/" cv.tex
	@xelatex cv.tex
	@mv cv.tex.orig cv.tex

print:
	@CV_THEME=$${CV_THEME:-friggeri}; sed "s|\\documentclass\[\]{friggeri}|\\documentclass\[print\]{$$CV_THEME}|" cv.tex > cv_print.tex
	@xelatex cv_print.tex
	@rm -f cv_print.tex

clean:
	@zsh -c 'setopt NULL_GLOB; rm -f *.{aux,bcf,dvi,out,run.xml,orig,log}'