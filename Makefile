#
#		--- Makefile ---
#
# Makefile for Thesis...
#
# Rules are of the form
#
# target: dependant files
# 	command 1
# 	command 2
#
# Type "make target" to run the series of commands.
# make will check to see if dependant files have been updated
# since output file was last generated.  If not it will not run.

# The following commands latex .tex files of the whole 
# or part of the the thesis and display resulting .dvi file

thesis: preamble/* chapter/* appendix/*
# Latex thesis.tex and display result
	latex thesis
	@echo "here"
	bibtex thesis
	@echo 
	latex thesis
	@echo
	latex thesis
	@echo
	latex thesis
	@echo
	@echo "Removing emacs backups etc..."
	rm -f *~ *.aux *.toc *.bbl *.blg *.lof *.lot
	xdvi thesis.dvi &

chapter: preamble/* chapter/* appendix/*
# Latex chapter.tex and display result.  
# Alter chapter.tex to change which chapter is latexed
	latex chapter
	@echo
	bibtex chapter
	@echo
	latex chapter
	@echo
	latex chapter
	@echo
	@echo "Removing emacs backups etc..."
	rm -f *~ *.aux *.toc *.bbl *.blg *.lof *.lot
	xdvi chapter.dvi &

# The following commands convert thesis.dvi to ps and pdf files
# with varying numbers of pages per page.
# You should make thesis before using them

t1: thesis.dvi
#Converts thesis.dvi into ps & pdf files
	@echo "Converting thesis.dvi to ps & pdf"
	dvips thesis.dvi -o thesis.ps
	ps2pdf13 thesis.ps thesis.pdf

t2: thesis.dvi
# Converts thesis.dvi into ps & pdf file, 2 pages per page
	@echo "Converting thesis.dvi to ps & pdf"
	dvips thesis.dvi -o thesis.ps
	psnup -pletter -Pa4 -2 thesis.ps > tmp.ps
	mv -f tmp.ps thesis2.ps
	ps2pdf13 thesis2.ps thesis2.pdf

t4: thesis.dvi
# Converts thesis.dvi into ps & pdf file, 4 pages per page
	@echo "Converting thesis.dvi to ps & pdf"
	dvips thesis.dvi -o thesis.ps
	psnup -pletter -Pa4 -4 thesis.ps > tmp.ps
	mv -f tmp.ps thesis4.ps
	ps2pdf13 thesis4.ps thesis4.pdf

# The following commands convert chapter.dvi to ps and pdf files
# with varying numbers of pages per page
# You should make chapter before using them

c1: chapter.dvi
#Converts chapter.dvi into ps & pdf file
	@echo "Converting chapter.dvi to ps & pdf"
	dvips chapter.dvi -o chapter.ps
	ps2pdf13 chapter.ps chapter.pdf

c2: chapter.dvi
# Converts chapter.dvi into ps & pdf file, 2 pages per page
	@echo "Converting chapter.dvi to ps & pdf"
	dvips chapter.dvi -o chapter.ps
	psnup -pletter -Pa4 -2 chapter.ps > tmp.ps
	mv -f tmp.ps chapter2.ps
	ps2pdf13 chapter2.ps chapter2.pdf

c4: chapter.dvi
# Converts thesis.dvi into ps & pdf file, 4 pages per page
	@echo "Converting thesis.dvi to ps & pdf"
	dvips chapter.dvi -o chapter.ps
	psnup -pletter -Pa4 -4 chapter.ps > tmp.ps
	mv -f tmp.ps chapter4.ps
	ps2pdf13 chapter4.ps chapter4.pdf

# The following commands are a variety of useful extras

count: preamble/* chapter/* appendix/*
# Do a word count of all .tex files within folders 
# in the preamble, chapters and appendix directory.  
	@echo " "
	@wc -w preamble/*.tex chapter/*/*.tex appendix/*/*.tex
	@echo " "

backup: preamble/* chapter/* appendix/*
# Backup entire thesis directory to a .tar.gz file 
# Can also copy the backup elsewhere via scp, eg to granby
# To initiate this uncomment the scp line and add destination
	@echo " "
	@echo "Backing up thesis to granby"
	tar cvfz backup/thesis.tar.gz *
#	scp -r backup/thesis.tar.gz ppx???@granby:
	@echo " "

clean:
# Remove extraneous files created when latexing
	@echo " "
	make less_clean
	@echo "Removing emacs backups etc..."
	rm -f *~ *.log *.aux *.toc *.bbl *.blg *.lof *.lot *.pdf preamble/*/*~ chapter/*/*~ appendix/*/*~
	@echo " "

less_clean:
# Remove ps and dvi files only
	@echo " "
	@echo "Removing postscript files..."
	rm -f *.ps *.dvi
	@echo " "

#
# End of file...
#


