#!/bin/bash

if [ $# -ne 0 ]; then
echo "Usage $(security $0) 'security'"
exit 1
fi 


outputfile=sao.txt
url=https://www.cyber.gov.au/threats

function dump_webpage() {
curl $url -o $outputfile &>/dev/null
    }

function clean_webpage() {
    grep --context=2 -e 'views-field views-field-title' $outputfile | sed 's/<[^>]*>//g' > temp.txt && cp temp.txt $outputfile

}

dump_webpage
clean_webpage