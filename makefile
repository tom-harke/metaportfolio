all: yin-yang.0.pdf
	evince yin-yang.0.pdf

%.0 %.1 %.2: %.mp
	mpost $*.mp

%.0.pdf: %.0
	epstopdf $*.0 --output $*.0.pdf

%.1.pdf: %.1
	epstopdf $*.1 --output $*.1.pdf

%.2.pdf: %.2
	epstopdf $*.2 --output $*.2.pdf

clean:
	rm -f *.log
	rm -f *.aux
	rm -f *.0
	rm -f *.1
	rm -f *.2

spotless: clean
	rm -f *.pdf

.PHONY: clean spotless
