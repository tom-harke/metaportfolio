all: yin-yang.2.pdf
	evince yin-yang.2.pdf

%.1 %.2: %.mp
	mpost $*.mp

%.1.pdf: %.1
	epstopdf $*.1 --output $*.1.pdf

%.2.pdf: %.2
	epstopdf $*.2 --output $*.2.pdf
