all:
	mkdir -p /home/messalih/data/wp_storage
	mkdir -p /home/messalih/data/db_storage
	@docker-compose -f srcs/docker-compose.yml up --build
clean:
	@docker-compose -f srcs/docker-compose.yml down --rmi all
# hosts:
# 	echo "messalih.42.fr 127.0.0.1" >> /etc/hosts 