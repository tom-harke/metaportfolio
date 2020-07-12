about:
	@echo "To generate the recursive yin/yang symbol:"
	@echo "    make yin-yang-0.pdf"
	@echo ""
	@echo "To generate the recursive gray decoder ring:
	@echo "    make gray-0.pdf"
	@echo ""
	@echo "To generate the main document:"
	@echo "    make metaportfolio.pdf"
	@echo ""
	@echo "You will need the following packages installed:"
	@echo "    latex"
	@echo "    context"

.PHONY: about

NUMS = 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16

define image =
%-$(1).pdf
endef

$(foreach n,$(NUMS),$(call image,$n)): %.mp
	mptopdf $*.mp

metaportfolio.pdf: metaportfolio.tex
	pdflatex $<

metaportfolio.pdf: \
	yin-yang-0.pdf yin-yang-1.pdf \
	knots-0.pdf knots-1.pdf \
	sort-0.pdf sort-1.pdf sort-2.pdf sort-3.pdf sort-4.pdf sort-5.pdf sort-6.pdf \
	gray-0.pdf

metapost-it-notes.pdf: metapost-it-notes.tex
	context $<

clean:
	rm -f *.log
	rm -f *.aux
	rm -f *.tuc
	rm -f *.mpx
	rm -f *.[0-9]
	rm -f *.[0-9][0-9]

spotless: clean
	rm -f *.pdf

.PHONY: clean spotless

# convert gray-0.pdf gray-0.png    
# convert-im6.q16: not authorized
# sudo vim /etc/ImageMagick-6/policy.xml

