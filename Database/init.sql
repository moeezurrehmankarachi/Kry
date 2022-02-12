use dev;
CREATE TABLE IF NOT EXISTS services(
    id BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    url VARCHAR(255) NOT NULL,
    creation_datetime datetime NOT NULL,
    update_datetime datetime,
    last_verified_datetime datetime,
    status VARCHAR(2) NOT NULL
);

insert into services (id, url, name, creation_datetime, status) values(1,'www.google.com', 'google', now(), '1');
insert into services (id, url, name, creation_datetime, status) values(2,'www.bing.com', 'bing', now(), '1');
insert into services (id, url, name, creation_datetime, status) values(3,'www.facebook.com', 'facebook', now(), '1');
insert into services (id, url, name, creation_datetime, status) values(4,'www.twitter.com', 'twitter', now(), '1');
insert into services (id, url, name, creation_datetime, status) values(5,'www.gmail.com', 'gmail', now(), '1');
insert into services (id, url, name, creation_datetime, status) values(6,'http://192.168.1.113:8088', 'example', now(), '1');
insert into services (id, url, name, creation_datetime, status) values(7,'http://localhost:8081/simulate/services/service4', 'Service 4', now(), '0');
insert into services (id, url, name, creation_datetime, status) values(8,'http://localhost:8081/simulate/services/service5', 'Service 5', now(), '0');
