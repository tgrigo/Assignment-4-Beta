#!/bin/bash

# colour variables
BOLDRED='\033[1;31m'
BOLDGREEN='\033[1;32m'
YELLOW='\033[0;33m'
LBLUE='\033[1;34m'
NC='\033[0m'

clear
echo
echo -e "\t ${BOLDRED}***************************************************************************************${NC} "
echo -e "\t                        WELCOME TO MY FINAL ASSIGNMENT SCRIPT "
echo -e "\t ${LBLUE} PLEASE SELECT WHICH WEB SCRAPING SCRIPT YOU WOULD LIKE TO RUN FROM THE FOLLOWING MENU${NC}"
echo -e "\t ${BOLDRED}***************************************************************************************${NC}"
echo

echo
PS3=$'\e[01;33mPlease make your selection > \e[0m'
echo

# The two scripts are called upon from
select ws in ACSC\ WEB\ THREATS ACSC\ CYBER\ NEWS EXIT
do

case $ws in
# The two case values are declared here
ACSC\ WEB\ THREATS )
exec ./WebScraper1.sh
echo
;;

ACSC\ CYBER\ NEWS )
exec ./WebScraper2.sh
echo
;;

# The exit option is here
EXIT )
echo "Goodbye !"
exit 1
echo
;;

# invalid data
*)
echo "Invalid entry please input a section from 1 to 3."
echo
;;
esac
done

exit 0

