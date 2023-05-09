FROM gitpod/workspace-mysql

USER gitpod

# Update the package list and install PHP and necessary extensions
RUN sudo apt-get update && \
    sudo DEBIAN_FRONTEND=noninteractive apt-get install -y php php-mysql php-cli

# Configure MySQL
RUN echo "mysql:x:$(id -u):$(id -g):MySQL Server,,,:/nonexistent:/bin/false" | sudo tee -a /etc/passwd && \
    sudo service mysql start && \
    sudo mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'root';"
