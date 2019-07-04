A basic world-time scheduler in Angular.

Forked from https://github.com/mitsuhiko/timesched 

## How to build
  1. Clone this repo
  2. run `npm install uglify-js`
  3. run `make download-cities`
  4. run `make download-timezone-info`
  5. run `make all`
  6. run `make build`
  7. Deploy `deploy` folder contents


## Dependancies
Unicode tz supplemental files
Moment JS timezone file
City files below

## City file downloads
Raw files for input to the convert script.  Here is where you can get them:

cities1000.txt        http://download.geonames.org/export/dump/cities1000.zip
cities15000.txt       http://download.geonames.org/export/dump/cities15000.zip
countryInfo.txt       http://download.geonames.org/export/dump/countryInfo.txt