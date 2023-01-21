#!/bin/bash
sudo su -
touch /var/www/html/index.html
cat <<EOF>> /var/www/html/index.html
<html>
<h3> Builded this page powered by Terraform</h3>
<br>
<h3> Owner</h3>
<h2>${f_name} ${l_name}</h2>
<br>
%{for name in names ~}
Hello to ${name} from ${f_name}<br>
%{endfor ~}
</html>
EOF
service nginx restart
