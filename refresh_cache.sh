#!/bin/bash
touch conf && echo "*/10 * * * * /home/vcap/app/php/bin/php /home/vcap/app/web/one.php cache:refresh" >> conf && crontab conf && rm -f conf 
