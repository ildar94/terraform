sudo touch /var/www/html/index.html
sudo echo "<h2>Привет</h2><br> <h3>это новая страница тестирует работу скрипта запущеного на сервере посредствам</h3> <h1>terrafom</h1>" > /var/www/html/index.html
sudo service nginx restart



 - sudo su -
 - touch /var/www/html/index.html
 - echo "<html><head><meta http-equiv=\"content-type\" content=\"text/html; charset=utf-8\" /></head><body><h2>Привет</h2><br> <h3>это новая страница тестирует работу скрипта запущеного на сервере посредствам</h3> <h1>terrafom</h1></body></html>" > /var/www/html/index.html
 - service nginx restart
