sudo touch /var/www/html/index.html
sudo echo "<h2>Привет</h2><br> <h3>это новая страница тестирует работу скрипта запущеного на сервере посредствам</h3> <h1>terrafom</h1>" > /var/www/html/index.html
sudo service nginx restart
