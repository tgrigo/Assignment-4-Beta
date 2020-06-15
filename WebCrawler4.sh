#!/bin/bash


outputfile=sao41.txt
outputfile2=sao42.txt
url=https://www.cyber.gov.au/news

# colour variables
BOLDRED='\033[1;31m'
BOLDGREEN='\033[1;32m'
LBLUE='\033[1;34m'
NC='\033[0m'

# clear terminal
clear
echo
echo
# Title echo with centering by \t
echo -e "\t ${BOLDGREEN}===============--------------------------==============="
echo -e "\t   Welcome to the ACSC ${BOLDRED}CYBER NEWS${BOLDGREEN} advisory information"
echo -e "\t ===============--------------------------===============${NC}"
echo
echo -e "${YELLOW}This follwoing Cyber News information has been extracted by web scraping the Australian Government Cyber Security website.${NC}"
echo
echo -e "The entire websites information can be gained by visiting https://www.cyber.gov.au/news. ${NC}"


if [ $# -ne 0 ]; then
echo "Usage $(security $0) 'security'"
exit 1
fi 


function dump_webpage() {
curl $url -o $outputfile &>/dev/null

}
 
function clean_webpage() {
       grep -C 5 -P -i -e 'views-field views-field-title' $outputfile | sed -e 's/<[^>]*>//g' > temp4.txt && cp temp4.txt $outputfile2
    
}

function error_check() {
    [ $? -ne 0 ] && echo "${BOLDRED}There has been an error in loading the webpage.${NC}" && exit 1

}
cat $outputfile2
echo

dump_webpage
clean_webpage

echo
PS3=$'\e[01;33mPlease make your selection > \e[0m'
echo

echo -e "${BOLDGREEN}Would you like to retrun to the main menu?${NC}"
select yn in "Yes" "No"; do
case $yn in
Yes ) ./WebScrapeMenu.sh;;
No ) exit 1
esac
done