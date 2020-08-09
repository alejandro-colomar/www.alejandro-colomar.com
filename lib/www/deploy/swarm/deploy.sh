################################################################################
##      Copyright (C) 2020        Alejandro Colomar Andrés                    ##
##      SPDX-License-Identifier:  GPL-2.0-only                                ##
################################################################################
##
## Deploy stack
## ============
##
################################################################################


################################################################################
##	source								      ##
################################################################################
source	etc/www/config.sh;

source	lib/www/deploy/common/config.sh;


################################################################################
##	definitions							      ##
################################################################################


################################################################################
##	functions							      ##
################################################################################
## sudo
function swarm_deploy()
{
	local	compose_path="etc/docker/swarm/docker-compose.yaml"
	local	stack_name="${WWW_STACK_BASENAME}-${WWW_STABILITY}";

	prepare_configs;
	#prepare_secrets;
	docker stack deploy -c "${compose_path}" "${stack_name}";
}


################################################################################
##	end of file							      ##
################################################################################
