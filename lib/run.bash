#!/bin/bash


# Path to Server jar file
NAIJAV_SERVER_JAR=./webserver.jar


# Colors for Bash
NAIJAV_COLOR_BLUE="\033[0;34m"
NAIJAV_COLOR_GREEN="\033[0;32m"
NAIJAV_COLOR_RED="\033[0;31m"
NAIJAV_COLOR_RESET="\e[0m"
NAIJAV_COLOR_WHITE="\033[1;37m"


# logs to console
#
# ${1}  message to write to console
# ${2} what color to use. 0 - info(blue), 1- success(green), 2 - error(red)
naijav_log() {
  if [ ! ${NAIJAV_NO_COLOR} ] ; then
    [ ${2} -eq 0 ] && local color=${NAIJAV_COLOR_BLUE}
    [ ${2} -eq 1 ] && local color=${NAIJAV_COLOR_GREEN}
    [ ${2} -eq 2 ] && local color=${NAIJAV_COLOR_RED}
    echo -e "${NAIJAV_COLOR_WHITE}naijav-site-local: ${color}${1}${NAIJAV_COLOR_RESET}"
  else
    echo "naijav-site-local: ${1}"
  fi
}


naijav_log "Attempting to start server at 127.0.0.1:8080" 0
naijav_log "If successful, proceed to http://localhost:8080/naijav/ to see site" 0
echo
java -jar ${NAIJAV_SERVER_JAR}
