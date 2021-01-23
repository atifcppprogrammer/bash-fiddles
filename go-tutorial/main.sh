#!/bin/bash

# This program downloads the complete Golang tutorial series given at
# the url https://golangbot.com/learn-golang-series/ as .pdf files to
# the go_tutorial directory residing where this script is invoked.
#
# author - atifcppprogrammer

is_installed=$(echo $(which 'wkhtmltopdf'))
if [ ${#is_installed} -eq 0 ]; then 
  echo "Command wkhtmltopdf not found, please ensure package"
  echo "wkhtmltopdf is installed and has been added to path"
  exit 1
fi

routes=(
  "golang-tutorial-part-1-introduction-and-installation"
  "hello-world-gomod"
  "variables"
  "types"
  "constants"
  "functions"
  "packages"
  "if-statement"
  "loops"
  "switch"
  "arrays-and-slices"
  "variadic-functions"
  "maps"
  "strings"
  "pointers"
  "structs"
  "methods"
  "interfaces-part-1"
  "interfaces-part-2"
  "concurrency"
  "goroutines"
  "channels"
  "buffered-channels-worker-pools"
  "select"
  "mutex"
  "structs-instead-of-classes"
  "inheritance"
  "polymorphism"
  "defer"
  "error-handling"
  "custom-errors"
  "panic-and-recover"
  "first-class-functions"
  "reflection"
  "read-files"
  "write-files"
)

directory='go-tutorial'
if [ -d $directory ]; then rm -rf $directory; fi  
mkdir $directory

core_url="https://golangbot.com"; count=1; number=''
for route in ${routes[@]}; do 
  if [ ${#count} -eq 1 ]; then 
    number='0'$count
  else number=$count
  fi

  path=$directory'/'$number'_'$route'.pdf'
  count=$((count + 1))

  wkhtmltopdf --quiet $core_url'/'$route $path; 
  echo 'downloaded '$route' to '$path
done
