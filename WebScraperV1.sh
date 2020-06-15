#!/bin/bash

# Website to be scraped
# https://www.cyber.gov.au/threats


# Create Variables
    outputfile=./SecArtOut.txt
    # FinalOutput=./FinalSecurityDoc.txt
    url=https://www.cyber.gov.au/threats
    date=$(date +%d-%m-20%y)
    # regex="--$1 "

######################################################################

# Dump the webpage using the curl command
# Check for errors on the dump as per check_errors 
# dev/null removes the curl commads general header download info

function dump_webpage() {
    curl "$url" -o "omfg.txt"
    # &>/dev/null
    check_errors

}
######################################################################

# After webpage has been dumped we need to clean the page info using 
# clean_webpage function, grep and sed

function clean_webpage() {
    grep "<span class="views-field views-field-title">" omfg.txt | sed 's/<[^>]*>//g' > temp.txt && cp temp.txt omfg.txt

}
# sed -n 's/<[^>][^\]*>/\n/g' $outputfile
    # sed -i "s/$regex/\n\g" $outputfile
    ## && cp ./tempinfo.txt $outputfile
    ## awk NF >
    ## --context=2

######################################################################

# Looping through the file content

function print_sec_issues() {
    echo
    echo "Critical Security Issues as detailed by the Australian Governement ACSC on the "$date" are as follows;"
    while read issues; do
    echo "${issues}"
    done < $outputfile

}
######################################################################

# We then need to create the web page doenload check function by testing the exit status 
# for a '0' output (true), if it is not 0 then we need to generate the error print

function check_errors() {
    [ $? -ne 0 ] && echo "\033[31mThere has been an error in receiving the requested web page\033[0m" & exit 1

}

######################################################################

dump_webpage
clean_webpage
print_sec_issues
check_errors

######################################################################
