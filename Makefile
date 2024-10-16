LATEX = lualatex
LATEX_OPT := -interaction=nonstopmode
ENV_VAR := export max_print_line=1000;
# FILECONTENTS = anatomy-of* using-a-* java-* recursive-with-bug*
PACKAGE := sunpath

# SVG tagrgets
pdf_svg = sunpath.spherical.pdf sunpath.equidistance.pdf sunpath.track.pdf
svgs = sunpath.spherical.svg sunpath.equidistance.svg sunpath.track.svg


.PHONY: doc
doc:
	$(ENV_VAR) l3build doc

.PHONY: clean
clean:
	l3build clean
	rm -rf build
	rm -f *.zip
	rm -fv *.idx *.aux *.glo *.hd *.out *.bcf *.dvi *.run.xml *.toc
	rm -fv *.bbl *.blg *.synctex.gz
	rm -fv $(PACKAGE) $(PACKAGE)-ctan.curlopt
	rm -fv $(PACKAGE).*.pdf
	rm -fv $(PACKAGE).sty
	rm -fv support/*.{log,aux,out}
	make clean-svg
	#rm -fv $(FILECONTENTS)

.PHONY: clean-support
clean-support:
	make -C support clean

.PHONY: debug
debug:
	make clean;
	make doc;
	$(LATEX) $(PACKAGE).ins
	
	
.PHONY: ctan
ctan:
	make clean doc
	l3build ctan

.PHONY: dryinstall
dryinstall:
	l3build install --dry-run

.PHONY: install
install:
	make clean
	l3build install

.PHONY: upload
upload:
	make clean doc ctan
	l3build upload

# SVG part
# SVG is just a nice to have adon

$(pdf_svg): %.pdf: %.tex
	l3build doc

.PHONY: svg
svg: $(svgs)


$(svgs): %.svg: %.pdf
	inkscape --export-filename=$@ $^

.PHONY: clean-svg
clean-svg:
	rm -f *.svg




