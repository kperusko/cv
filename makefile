all: screen print

screen:
	@xelatex cv.tex

print:
	@sed "s|\\documentclass\[\]{cv}|\\documentclass\[print\]{cv}|" cv.tex > cv_print.tex
	@xelatex cv_print.tex
	@rm -f cv_print.tex

clean:
	@zsh -c 'setopt NULL_GLOB; rm -f *.{aux,bbl,blg,bcf,dvi,out,run.xml,orig,log}'
