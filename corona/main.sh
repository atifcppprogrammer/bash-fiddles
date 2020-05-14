#!/bin/bash
#    _________  _________  ____  ____ _
#   / ___/ __ \/ ___/ __ \/ __ \/ __ `/
#  / /__/ /_/ / /  / /_/ / / / / /_/ /
#  \___/\____/_/   \____/_/ /_/\__,_/
#
# author - atifcppprogrammer

# Determining if one and only one argument is provided to script, i.e
# the name of the file which will house required image.
if [ ! $# -eq 1 ]; then
  echo 'Provide destination path for storing required image file !!!';
  exit 1;
fi

# Collecting Dawn's home page markdown and using regex and cut to
# obtain url for image containing required information.
url='https://www.dawn.com'; regex='src=\".*widgets.*(jpg|png)'
src=$(curl -s $url | grep -oE  $regex | head -n 1 | cut -d \" -f 2)
src='https:'$src

# Determining file extension from collected url and downloading
# image to given path.
$(curl $src -so $1${src: -4})
