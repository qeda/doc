.PHONY: all clean

all:
	@if [ ! -e node_modules ]; then npm install ; fi
	./node_modules/.bin/coffee src/build.coffee

clean:
	rm -rf core getting-started library node_modules patterns symbols

