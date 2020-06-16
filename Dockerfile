################################################################################
##      Copyright (C) 2020        Sebastian Francisco Colomar Bauza           ##
##      Copyright (C) 2020        Alejandro Colomar Andrés                    ##
##      SPDX-License-Identifier:  GPL-2.0-only                                ##
################################################################################


################################################################################
FROM	"alejandrocolomar/nginx:1.5.0"	AS nginx
################################################################################
RUN	rm -fv	/run/configs/etc/nginx/nginx.conf			&& \
	rm -fv	/run/configs/etc/nginx/conf.d/default.conf
################################################################################
COPY	srv/	/srv/
################################################################################
