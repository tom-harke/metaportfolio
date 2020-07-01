about:
	@echo "To generate the recursive yin/yang symbol:"
	@echo "    make yin-yang-0.pdf"
	@echo ""
	@echo "You will need the following packages installed:"
	@echo "    latex"
	@echo "    context"

.PHONY: about

NUMS = 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16

define image =
%.$(1)
endef

$(foreach n,$(NUMS),$(call image,$n)): %.mp
	mpost $*.mp


%-0.pdf: %.mp
	mptopdf $*.mp

metaportfolio.pdf: metaportfolio.tex yin-yang-0.pdf yin-yang-1.pdf
	pdflatex $<

clean:
	rm -f *.log
	rm -f *.aux
	rm -f *.0
	rm -f *.1
	rm -f *.2

spotless: clean
	rm -f *.pdf

.PHONY: clean spotless
