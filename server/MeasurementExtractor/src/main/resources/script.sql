CREATE TABLE mdrusers(
   username varchar(20) NOT NULL,
   password varchar(20) NOT NULL,
   primary key(username)
);
                                        
create table mdrdevices (
  device_name varchar(20) NOT NULL,
  device_unit varchar(20) NOT NULL,  
  primary key(device_name)
);


CREATE TABLE mdrmeasurements(
   id_meas  SERIAL PRIMARY KEY,
   meas_value varchar(10) NOT NULL,
   meas_date timestamp without time zone NOT NULL DEFAULT CURRENT_DATE,
   username varchar(10) NOT NULL,
   device_name varchar(10) NOT NULL,
   FOREIGN KEY (username) REFERENCES mdrusers(username),
   FOREIGN KEY (device_name) REFERENCES mdrdevices(device_name)
);


INSERT INTO mdrusers(username,password) VALUES ('dbazan','db');
INSERT INTO mdrusers(username,password) VALUES ('gosc','gosc');

INSERT INTO mdrdevices(device_name,device_unit) VALUES ('termometr','stopnie');
INSERT INTO mdrdevices(device_name,device_unit) VALUES ('zegarek','czas');

                                  
INSERT INTO mdrmeasurements (meas_value, username, device_name ) VALUES ('36.6', 'dbazan', 'termometr');
INSERT INTO mdrmeasurements (meas_value, username, device_name ) VALUES ('36.8', 'dbazan', 'termometr');
INSERT INTO mdrmeasurements (meas_value, username, device_name ) VALUES ('37.1', 'dbazan', 'termometr');

INSERT INTO mdrmeasurements (meas_value, username, device_name ) VALUES ('12.30', 'dbazan', 'zegarek');
INSERT INTO mdrmeasurements (meas_value, username, device_name ) VALUES ('12.40', 'dbazan', 'zegarek');


==========================================


drop table mdrusers;
drop table mdrdevices;
drop table mdrmeasurements;


=====================================
Opcje tworzenia bazy danych Hibernate

Tylko weryfikacja bazy bez jej zmian
spring.jpa.hibernate.ddl-auto=validate

Aktualizowanie istniejacej
spring.jpa.hibernate.ddl-auto=update

Tworzenie od pocatku
spring.jpa.hibernate.ddl-auto=create

Usuniecie na koncu pracy (do testowania)
spring.jpa.hibernate.ddl-auto=create-drop


    validate – tylko weryfikuje, tej opcji powinniœmy u¿ywaæ w dzia³aj¹cej aplikacji, jeœli pojawi siê jakaœ niespójnoœæ, aplikacja siê nie uruchomi

    update – Hibernate w przypadku natrafienia na niespójnoœæ spróbuje j¹ usun¹æ 
	poprzez modyfikacjê schematu; nara¿amy siê przez to na utratê danych, opcja nadaje siê g³ównie do testowania i rozwoju

    create – tworzy schemat i strukturê, usuwaj¹c istniej¹ce dane

    create-drop – podobnie jak create tworzy schemat i strukturê usuwaj¹c istniej¹ce dane, ale przy zamykaniu aplikacji automatycznie usuwa ca³¹ zawartoœæ u¿ywanej bazy danych



