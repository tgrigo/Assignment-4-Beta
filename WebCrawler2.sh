#!/bin/bash

if [ $# -ne 0 ]; then
echo "Usage $(security $0) 'security'"
exit 1
fi 


outputfile=sao.txt
outputfile2=sao2.txt
outputfile3=sao3.txt
url=https://www.cyber.gov.au/threats

function dump_webpage() {
curl $url -o $outputfile 
#&>/dev/null
    }

function clean_webpage() {
    # grep --context=2 -e 'views-field views-field-title' $outputfile | sed 's/<[^>]*>> temp.txt && cp temp.txt $outputfile//g' > temp.txt && cp temp.txt $outputfile
    grep -Po --color=always "<span class>\K(.*?)</span>" $outputfile | sed -i 's/<[^>]*>//g/--\/=====/' > temp.txt && cp temp.txt $outputfile2
    # | sed "s/..span class.//g" > temp.txt && cp temp.txt $outputfile
    # sed 's/--\/=============================================================/' $outputfile2 > temp2.txt && cp temp2.txt $outputfile2
    #temp.txt && cp temp.txt $outputfile3

}
dump_webpage
clean_webpage