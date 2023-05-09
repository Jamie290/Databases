FROM gitpod/workspace-mysql

USER gitpod

RUN echo "mysql:x:${uid}:${gid}:MySQL Server,,,:/nonexistent:/bin/false" | sudo tee -a /etc/passwd && \
    sudo apt-get update -qqy && \
    sudo apt-get install -qqy php-mysql php-cli && \
    sudo service mysql start && \
    sudo mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'root';"
