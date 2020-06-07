#!/bin/sh -x
##	./bin/update_version.sh	[<version>]
################################################################################
##	Copyright (C) 2020	  Alejandro Colomar Andrés		      ##
##	SPDX-License-Identifier:  GPL-2.0-only				      ##
################################################################################
##
## Update version numbers
## ======================
##
## This script should be run just after a new branch has been created, a
## release is imminent, or a release has been made.
## The default value for the version is the branch name.
##
##  - Update version numbers
##
################################################################################


################################################################################
##	definitions							      ##
################################################################################
MAX_ARGS=1


################################################################################
##	functions							      ##
################################################################################
update_version()
{
	local	version="$1"

	sed "/branch_app=/s/\".*\"/\"${version}\"/"			\
		-i ./etc/docker-aws/config.sh
	sed "/--branch/s/\".*\"/\"${version}\"/"			\
		-i ./etc/docker/http/aarch64.Dockerfile			\
		-i ./etc/docker/http/Dockerfile
	sed "/www.alejandro-colomar:/s/_.*\"/_${version}\"/"		\
		-i ./etc/docker/swarm/docker-compose.yaml
	sed "/www.alejandro-colomar:/s/_.*_/_${version}_/"		\
		-i ./etc/docker/swarm/docker-compose_aarch64.yaml
}


################################################################################
##	main								      ##
################################################################################
main()
{
	local	version="$1"
	local	argc="$2"

	if [ ${argc} -eq 0 ]; then
		version="$(git branch --show-current)"
	fi

	update_version	"${version}"
}


################################################################################
##	run								      ##
################################################################################
argc="$#"
if [ ${argc} -gt ${MAX_ARGS} ]; then
	echo	"Illegal number of parameters (Accepts ${MAX_ARGS} or less)"
	exit	64	## EX_USAGE /* command line usage error */
fi

main	"$1" "${argc}"


################################################################################
##	end of file							      ##
################################################################################
