################################################################
# This file contains useful info regarding the thesis template #
################################################################


************
* Contents *
************

- History
    Of this document and the thesis template
- General info
    Places to get useful info about writing/submitting a thesis
- Installation
    How to install the thesis template
- Important files & folders
    Brief overview of the most important files in the template.


***********
* History *
***********

Version 1.0 - written by ~m~, September 2006

I have no idea who originally wrote this thesis template.  It is
designed to output a reasonable looking thesis in a format that fits
the Nottingham University regulations.  It has been used for years and
has been gradually added to and altered by each person who has used
it, so it's a bit of a mess in places, but it works!  This file should
give you the basics of how to use the template but if you get stuck
feel free to 'mail me at ppxejk@nottingham.ac.uk.


****************
* General Info *
****************

This template can be downloaded from:

http://www.nottingham.ac.uk/~ppxejk/thesis_template


Notice of intention to submit forms (notification-to-submit-thesis.doc) 
and university regulations on thesis submission 
(thesis-submission-guidelines.doc) can be downloaded from:

http://www.nottingham.ac.uk/quality-manual/forms/


School of Physics & Astronomy guidelines for thesis submission can be
found at:

http://www.nottingham.ac.uk/physics/courses/pg_thesis_submit.php


****************
* Installation *
****************

Create a new folder where you will keep all files relating to your
thesis.

Save thesis_template.tar.gz to that folder.

Untar and unzip thesis_template.tar.gz by typing: 
tar xvfz thesis_template.tar.gz


*****************************
* Important files & folders *
*****************************

Most files are self explanatory, or have explanatory comments, if you
open them.  The following are probably the most useful/important ones
that you need to know about in order to use the template.

Makefile --- This file contains various commands to make your life
easier.  They're all explained in the file - you may want to have a
look through it and see what options are available as some of them are
very handy - but the main one you need to know about is "make thesis".
Typing this will run latex and bibtex several times on thesis.tex and
output your thesis to thesis.dvi. 

thesis.tex --- The main latex file which organises the thesis
document.  This includes various commands and calls the individual
files which make up the thesis, eg the title page, abstract, each
chapter and appendix, etc, sorting them into one coherent document,
making the TOC and bibliography, and so on.  Look in this file to
discover where the files that make up your thesis are stored.  Edit
this file if you want to change the structure of your thesis.

chapter.tex --- Identical to thesis.tex, but has everything except one
chapter commented out.  Use "make chapter" to latex & bibtex this
file.  Useful for just viewing the chapter you're currently working
on, rather than making the entire thesis every time.

preamble --- This folder contains all the preamble documents, eg title
page, abstract, acknowledgements, etc - basically everything that comes
before the TOC.

chapter --- This folder contains all the chapter files.  These are
where you write the main body of your thesis.  If you move, rename,
create new chapters, etc, don't forget to edit thesis.tex
correspondingly.

appendix --- This folder contains all the appendix files.  Identical
to chapter files, just stored in a different place for organisation.
Note it is not where it is stored that makes a file an appendix rather
than a chapter in the final thesis - this is governed by where it is
(ie before or after \appendix) in thesis.tex.

style/refs.bib --- This is the bibtex file in which all your
references should be listed.  

texfiles/typesetting.tex --- This file governs the typesetting and
appearance of the thesis, including line spacing, headers, captions,
floats, etc.

texfiles/reg_margins.tex --- This file governs the page margins &
float margins.  It also specifies how much of a page can be
floats/text.
