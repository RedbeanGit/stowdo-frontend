#!/usr/bin/env bash

if [ ${PWD##*/} == scripts ] ;
then
    cd ..
fi

. scripts/utils.sh

echop 'Welcome to Stowdo frontend setup.'
echop 'This script will let you define variables for multiple environment.'
echop 'The proposals in brackets are the default values. Leave blank to use them.'

echo
read -p 'Environment (development): ' environment
read -p 'API host (api.stowdo.tk): ' api_host
read -p 'API port (443): ' api_port
read -p 'API protocol (https): ' api_protocol
echo

if [ -z "$environment" ]
then
    environment=development
fi

if [ -z "$api_host" ]
then
    api_host=api.stowdo.tk
fi

if [ -z "$api_port" ]
then
    api_port=443
fi

if [ -z "$api_protocol" ]
then
    api_protocol=https
fi

version=$(cat VERSION)

echo "NODE_ENV=$environment" > .env
echo "REACT_APP_STOWDO_VERSION=$version" >> .env
echo "REACT_APP_STOWDO_API_HOST=$api_host" >> .env
echo "REACT_APP_STOWDO_API_PORT=$api_port" >> .env
echo "REACT_APP_STOWDO_API_PROTOCOL=$api_protocol" >> .env

echop 'Environment variables have been defined!'