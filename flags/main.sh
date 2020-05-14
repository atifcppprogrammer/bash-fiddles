#!/bin/bash
#
# Please ensure that the dependencies mentioned in the
# readme.md file are installed on your machine before
# executing this script.
#     ______
#     / __/ /___ _____ ______
#    / /_/ / __ `/ __ `/ ___/
#   / __/ / /_/ / /_/ (__  )
#  /_/ /_/\__,_/\__, /____ /
#              /____/
#
# author - atifcppprogrammer

# Checking if exactly one argument given throwing
# error message and exiting otherwise.
if [ ! $# -eq 1 ]; then
  echo "Provide alpha code of country of interest !!!";
  exit 1;
fi

# Determining denomynm for country of interest, exiting
# in case none found.
url='https://restcountries.eu/rest/v2/alpha/';
$(curl $url$1 -so .data.json)
if [ "$(jq .status .data.json )" == "404" ]; then
  echo "No country found against provided code !!!";
  exit 1;
fi
demonym=$(jq .demonym .data.json | tr -d [=\"=]);
demonym=${demonym,,}; rm .data.json

# Loading country flag using collected demonyn and
# printing it out in pretty manner.
core='https://flaglane.com/download/'
path=$demonym'-flag/'$demonym'-flag-large.jpg'
flag=($(jp2a --color $core$path))
for row in ${flag[@]}; do
  echo -e $row; sleep 0.08
done
