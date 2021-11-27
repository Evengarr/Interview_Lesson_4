drop database Cinema;
create database Cinema;
use Cinema;

create table Film
(
ID int primary key,
ID_NAME int not null,
DURATION int not null,
TIME_START time not null,
TIME_STOP time not null,
ID_TICKET_PRICE int not null
);

create table TicketPrice
(
ID int primary key,
PRICE float not null
);

create table FilmName
(
ID int primary key,
NAME varchar(30)
);

create table Ticket
(
ID int primary key,
NUMBER int,
ID_FILM int
);

ALTER TABLE `cinema`.`film` 
ADD INDEX `FilmName_idx` (`ID_NAME` ASC) VISIBLE,
ADD CONSTRAINT `FilmName`
  FOREIGN KEY (`ID_NAME`)
  REFERENCES `cinema`.`filmname` (`ID`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,

ADD INDEX `FilmPrice_idx` (`ID_TICKET_PRICE` ASC) VISIBLE,
ADD CONSTRAINT `FilmPrice`
  FOREIGN KEY (`ID_TICKET_PRICE`)
  REFERENCES `cinema`.`ticketprice` (`ID`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
  
  ALTER TABLE `cinema`.`ticket` 
ADD INDEX `FilmID_idx` (`ID_FILM` ASC) VISIBLE;
ALTER TABLE `cinema`.`ticket` 
ADD CONSTRAINT `FilmID`
  FOREIGN KEY (`ID_FILM`)
  REFERENCES `cinema`.`filmname` (`ID`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
   
INSERT INTO `cinema`.`filmname` (`ID`, `NAME`) VALUES ('1', 'A');
INSERT INTO `cinema`.`filmname` (`ID`, `NAME`) VALUES ('2', 'B');
INSERT INTO `cinema`.`filmname` (`ID`, `NAME`) VALUES ('3', 'C');

INSERT INTO `cinema`.`ticketprice` (`ID`, `PRICE`) VALUES ('1', '1500');
INSERT INTO `cinema`.`ticketprice` (`ID`, `PRICE`) VALUES ('2', '2000');
INSERT INTO `cinema`.`ticketprice` (`ID`, `PRICE`) VALUES ('3', '2500');
INSERT INTO `cinema`.`ticketprice` (`ID`, `PRICE`) VALUES ('4', '3000');
INSERT INTO `cinema`.`ticketprice` (`ID`, `PRICE`) VALUES ('5', '3500');
INSERT INTO `cinema`.`ticketprice` (`ID`, `PRICE`) VALUES ('6', '4000');

INSERT INTO `cinema`.`film` (`ID`, `ID_NAME`, `DURATION`, `TIME_START`, `TIME_STOP`, `ID_TICKET_PRICE`) VALUES ('1', '1', '120', '09:00', '11:00', '1');
INSERT INTO `cinema`.`film` (`ID`, `ID_NAME`, `DURATION`, `TIME_START`, `TIME_STOP`, `ID_TICKET_PRICE`) VALUES ('2', '1', '120', '13:00', '15:00', '2');
INSERT INTO `cinema`.`film` (`ID`, `ID_NAME`, `DURATION`, `TIME_START`, `TIME_STOP`, `ID_TICKET_PRICE`) VALUES ('3', '1', '120', '19:00', '21:00', '3');
INSERT INTO `cinema`.`film` (`ID`, `ID_NAME`, `DURATION`, `TIME_START`, `TIME_STOP`, `ID_TICKET_PRICE`) VALUES ('4', '2', '90', '10:00', '11:30', '4');
INSERT INTO `cinema`.`film` (`ID`, `ID_NAME`, `DURATION`, `TIME_START`, `TIME_STOP`, `ID_TICKET_PRICE`) VALUES ('5', '2', '90', '14:00', '15:30', '5');
INSERT INTO `cinema`.`film` (`ID`, `ID_NAME`, `DURATION`, `TIME_START`, `TIME_STOP`, `ID_TICKET_PRICE`) VALUES ('6', '3', '180', '10:00', '13:00', '6');

INSERT INTO `cinema`.`ticket` (`ID`, `NUMBER`, `ID_FILM`) VALUES ('1', '11111', '1');
INSERT INTO `cinema`.`ticket` (`ID`, `NUMBER`, `ID_FILM`) VALUES ('2', '11112', '1');
INSERT INTO `cinema`.`ticket` (`ID`, `NUMBER`, `ID_FILM`) VALUES ('3', '11113', '1');
INSERT INTO `cinema`.`ticket` (`ID`, `NUMBER`, `ID_FILM`) VALUES ('4', '11114', '1');
INSERT INTO `cinema`.`ticket` (`ID`, `NUMBER`, `ID_FILM`) VALUES ('5', '11115', '2');
INSERT INTO `cinema`.`ticket` (`ID`, `NUMBER`, `ID_FILM`) VALUES ('6', '11116', '2');
INSERT INTO `cinema`.`ticket` (`ID`, `NUMBER`, `ID_FILM`) VALUES ('7', '11117', '3');
INSERT INTO `cinema`.`ticket` (`ID`, `NUMBER`, `ID_FILM`) VALUES ('9', '11119', '2');
INSERT INTO `cinema`.`ticket` (`ID`, `NUMBER`, `ID_FILM`) VALUES ('10', '11120', '1');
	
SELECT Film.ID, FilmName.NAME, Film.DURATION, Film.TIME_START, Film.TIME_STOP, TicketPrice.PRICE
FROM Film
	JOIN FilmName ON ID_NAME = FilmName.ID
    JOIN TicketPrice ON ID_TICKET_PRICE = TicketPrice.ID;

SELECT t.NUMBER, fn.Name From Ticket t, FilmName fn WHERE t.ID_FILM = fn.ID
ORDER BY NUMBER ASC;

SELECT fn.Name, t.NUMBER From Ticket t, FilmName fn WHERE t.ID_FILM = fn.ID
ORDER BY NAME ASC;
