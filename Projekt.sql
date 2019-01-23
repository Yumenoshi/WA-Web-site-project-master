
use ProjectDatabase;

--RODZAJ_KONTA
CREATE TABLE rodzaj_konta(
idRodzaj int not null identity(1,1) primary key, 
rodzaj varchar(55));

insert into rodzaj_konta(rodzaj) values 
('Studentckie'),
('Osobiste'),
('Oszczednosciowe'),
('Firmowe'),
('Debetowe'),
('Walutowe');

--KONTO
CREATE TABLE konta(
idKonta int not null identity(1,1) primary key, 
numer_konta varchar(26), 
kwota float not null, 
rodzaj_konta int not null foreign key(rodzaj_konta) references rodzaj_konta(idRodzaj));

insert into konta(numer_konta,kwota,rodzaj_konta) values 
(921289760010875900002341, 890.98,1),
(921289760010875900005673, 1890.98,2),
(921289760010875900008976, 78.99,3),
(921289760010875900000001, 200086.00,4),
(921289760010875900009999, -900.00,5),
(921289760010875900004532, 7.99,6);

CREATE TABLE administratorzy(
idLog int not null identity(1,1) primary key, 
admin_login varchar(55), 
admin_haslo varchar(55));

insert into administratorzy(admin_login,admin_haslo) values
('admin','admin')

--KLIENCI
CREATE TABLE klienci( 
id int not null identity(1,1) primary key,
imie varchar(55), 
nazwisko varchar(55), 
adres varchar(250),
idkont int not null foreign key(idkont) references konta(idKonta),
user_login varchar(55), 
user_haslo varchar(55));

insert into klienci(imie,nazwisko,adres,idkont,user_login,user_haslo) values 
('Adam', 'Nowak','ul.Warszawska 22/5 Warszawa',1,'student','34763299'),
('Marek', 'Adamek', 'ul.Mazowiecka 33/4 Radom',2,'marek','12569890'),
('Jan','Dabrowski', 'ul.Morska 3/44 Gdynia',3,'Jan','22778899'),
('Miroslaw','Przybylski','ul.Dworcowa 2 Poznan',4,'budfirm','34729034'),
('Justyna','Tomaszewska','ul.Bliska 5 Nowa Wies',5,'marysia','78431290'),
('John','Smith','ul.Opolska 4/55 Opole',6,'John','83025687');

