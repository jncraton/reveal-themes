all: reveal.js purple.min.css

%.min.css: %.css
	npx minify@8.0.4 $< > $@

reveal.js:
	git clone --branch 5.2.1 --depth=1 https://github.com/hakimel/reveal.js.git

clean:
	rm -rf reveal.js *.min.css
