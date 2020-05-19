#!/bin/sh
################################################################################
##	Copyright (C) 2020	  Alejandro Colomar Andrés		      ##
##	SPDX-License-Identifier:  GPL-2.0-only				      ##
################################################################################
##
## Prepare the repo for release
## ============================
##
##  - Remove the files that shouldn't go into the release
##  - Update version numbers
##
################################################################################


################################################################################
##	functions							      ##
################################################################################
remove_files()
{

	rm	docker-compose-devel.yaml
}

update_version()
{
	local	version=$1

	sed "/--branch master/s/master/v${version}/"			\
			-i ./Dockerfile
	sed "/www.alejandro-colomar.com:v0.4/s/v0.4/v${version}/"	\
			-i ./Swarm/release/web.yaml
	sed "/www.alejandro-colomar.com:v0.4/s/v0.4/v${version}/"	\
			-i ./Swarm/release/web-BLUE.yaml
	sed "/v0.4/s/v0.4/v${version}/g"				\
			-i ./prepare_release.sh
}


################################################################################
##	main								      ##
################################################################################
main()
{
	local	version=$1

	remove_files
	update_version	${version}
}


################################################################################
##	run								      ##
################################################################################
main	$1


################################################################################
##	end of file							      ##
################################################################################
