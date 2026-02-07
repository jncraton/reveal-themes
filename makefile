all: purple.min.css

%.min.css: %.css
	npx minify@8.0.4 $< > $@
