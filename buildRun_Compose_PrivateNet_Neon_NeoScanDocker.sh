#!/bin/bash
if (( $# == 0 )); then
	echo "Build will be called in order to ensure that neocompiler privnet is build with the last version.";
	echo "BUILDING docker-compiler-privnet";
	(cd docker-privnet; ./docker_build.sh)
	echo "Removing any previous data from Neon";
        (cd javascript-tools/docker-neonwalletdb-neoscan; rm -rf data)  
	echo "Calling docker compose for building privnet with neoscan and neon";
	(cd javascript-tools/docker-neonwalletdb-neoscan; docker-compose up -d)
else
	echo "Calling docker compose, inside docker-neo-scan folder, with parameter $1";
	(cd javascript-tools/docker-neonwalletdb-neoscan; docker-compose $1)
fi
