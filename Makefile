all: compress

compress: lib/generated/data.js
	node_modules/uglify-js/bin/uglifyjs \
		lib/jquery.js \
		lib/jquery-ui.js \
		lib/angular.js \
		lib/bootstrap/js/bootstrap.js \
		lib/sortable.js \
		lib/slider.js \
		lib/ui-bootstrap.js \
		lib/moment.js \
		lib/moment-timezone.js \
		lib/typeahead.js \
			-c > lib/generated/compressed.js
	node_modules/uglify-js/bin/uglifyjs \
		lib/generated/data.js \
		-c > lib/generated/data-compressed.js

download-cities:
	wget http://download.geonames.org/export/dump/cities1000.zip
	unzip cities1000.zip -d data/raw
	wget http://download.geonames.org/export/dump/cities15000.zip
	unzip cities15000.zip -d data/raw
	wget http://download.geonames.org/export/dump/countryInfo.txt -O data/raw/countryInfo.txt

download-timezone-info:
	wget https://raw.githubusercontent.com/moment/moment-timezone/develop/data/packed/latest.json -O data/timezones.json
	wget https://raw.githubusercontent.com/unicode-org/cldr/master/common/supplemental/windowsZones.xml -O data/windows_zones.xml
	wget https://raw.githubusercontent.com/unicode-org/cldr/master/common/supplemental/supplementalData.xml -O data/supplemental_data.xml

lib/generated/data.js: data/*.json
	python data/convert.py

build:
	rm -rf deploy
	mkdir deploy
	cp timesched.html deploy/index.html
	cp -R lib deploy
	cp -R static deploy

.PHONY: compress download-timezone-info build
