#!/bin/bash -x
##	./bin/deploy/delete_rc_stack.sh
################################################################################
##      Copyright (C) 2020        Alejandro Colomar Andrés                    ##
##      SPDX-License-Identifier:  BSD-2-Clause                                ##
################################################################################
##
## Delete rc stack
## ===============
##
################################################################################


################################################################################
##	source								      ##
################################################################################
source	lib/libalx/sh/sysexits.sh;

source	etc/www/config.sh;


################################################################################
##	definitions							      ##
################################################################################
ARGC=0;


################################################################################
##	functions							      ##
################################################################################
function delete_stack()
{
	local	stack_name="${WWW_STACK_BASENAME}_rc";

	docker stack rm "${stack_name}";
}


################################################################################
##	main								      ##
################################################################################
function main()
{

	delete_stack;
}


################################################################################
##	run								      ##
################################################################################
argc=$#;
if [ ${argc} -ne ${ARGC} ]; then
	echo	"Illegal number of parameters (Requires ${ARGC})";
	exit	${EX_USAGE};
fi

main;


################################################################################
##	end of file							      ##
################################################################################
