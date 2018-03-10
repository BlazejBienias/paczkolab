DROP DATABASE paczkolab;

CREATE DATABASE paczkolab CHARACTER SET utf8 COLLATE utf8_general_ci;


create table Address
(
	id int auto_increment
		primary key,
	miasto varchar(50) not null,
	kodpocztowy varchar(6) not null,
	ulica varchar(50) not null,
	numermieszkania varchar(10) not null
)
engine=InnoDB
;

create table Parcel
(
	id int auto_increment
		primary key,
	nadawca int not null,
	rozmiar int not null,
	adres int not null,
	constraint Parcel_ibfk_3
		foreign key (adres) references Address (id)
			on update cascade on delete cascade
)
engine=InnoDB
;

create index nadawca
	on Parcel (nadawca)
;

create index rozmiar
	on Parcel (rozmiar)
;

create index adres
	on Parcel (adres)
;

create table Size
(
	id int auto_increment
		primary key,
	rozmiar varchar(2) not null,
	cena decimal(10,2) not null
)
engine=InnoDB
;

alter table Parcel
	add constraint Parcel_ibfk_2
		foreign key (rozmiar) references Size (id)
			on update cascade on delete cascade
;

create table User
(
	id int auto_increment
		primary key,
	imie varchar(50) not null,
	nazwisko varchar(50) not null,
	ilosckredytow int(50) not null,
	adres int not null,
	constraint User_ibfk_1
		foreign key (adres) references Address (id)
			on update cascade on delete cascade
)
engine=InnoDB
;

create index adres
	on User (adres)
;

alter table Parcel
	add constraint Parcel_ibfk_1
		foreign key (nadawca) references User (id)
			on update cascade on delete cascade
;




