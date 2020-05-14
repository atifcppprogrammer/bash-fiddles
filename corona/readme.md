# Corona
Scrapes image from [Dawn's](https://www.dawn.com) home page showing coronavirus cases for each province/territory of Pakistan.  

### Use
The following example illustrates downloading image to corona.png file in Pictures Directory. When passing destination path to
script omit the file extension the script will sort that out based on the scraped image.  
- bash main.sh /home/$USER/Pictures/corona

### Dependencies
Please ensure that the following programs are installed on your machine prior to running main.sh.
- [curl](https://github.com/curl/curl)

### Note
Since we are scraping this image of a website, this script is not stable and may break at some point in the future.
