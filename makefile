all: reveal.js purple.min.css orange.min.css maroon.min.css demo.html

%.min.css: %.css
	npx --yes minify@8.0.4 $< > $@

%.html: %.md reveal.js orange.css
	pandoc -t revealjs -V reveal.js -c orange.css -s "$<" -o $@

orange.css: purple.css
	cp -f $< $@
	sed -i s/522d72/8b2404/g $@
	sed -i s/6a3d91/8b2404/g $@
	sed -i s/eaaa00/ff6d2d/g $@

maroon.css: purple.css
	cp -f $< $@
	sed -i s/522d72/8c2131/g $@
	sed -i s/6a3d91/c2002f/g $@
	sed -i s/eaaa00/f3cd00/g $@

reveal.js:
	git clone --branch 5.2.1 --depth=1 https://github.com/hakimel/reveal.js.git

format:
	npx --yes prettier --write *.css

clean:
	rm -rf reveal.js *.min.css *.html orange.css maroon.css
