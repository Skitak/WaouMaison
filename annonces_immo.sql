REM *************************************************
REM *******       Annonces Immobilières       *******
REM *******     Copyright © 2017 Ouziri       *******
REM *************************************************

SET FEEDBACK OFF

PROMPT
PROMPT ************************************************************
PROMPT
PROMPT -> CREATION DE LA BASE DE DONNEES << VENTE D APPARTEMENTS >> 
PROMPT

DROP TABLE UTILISATEURS CASCADE CONSTRAINTS purge;
DROP TABLE APPARTEMENTS CASCADE CONSTRAINTS purge;
DROP SEQUENCE NUMERO_APPART;

CREATE TABLE UTILISATEURS (	
	Nom VARCHAR2(40) NOT NULL,
	Login VARCHAR2(20),
	Mdp VARCHAR2(40) NOT NULL,
	Profil VARCHAR2(40) NOT NULL,
	CONSTRAINT PK_UTILISATEURS PRIMARY KEY (Login),
	CONSTRAINT CHK_PROFILE CHECK (Profil IN ('PROPRIETAIRE', 'AGENTIMMO'))
);

CREATE TABLE APPARTEMENTS (
	Numero INTEGER, 
	TypeAppart VARCHAR2(6),
	Adresse VARCHAR2(75), 
	MontantVente NUMBER (10,2),
	DatePublication Date,
	DateValidation Date,
	AgentValidateur VARCHAR2(20),
	LoginProp VARCHAR2(20),
	CONSTRAINT PK_APPARTEMENT PRIMARY KEY (Numero),
	CONSTRAINT FK_PROP_APPART FOREIGN KEY (LoginProp) REFERENCES UTILISATEURS (Login),
	CONSTRAINT FK_VALID_APPART FOREIGN KEY (AgentValidateur) REFERENCES UTILISATEURS (Login)
);

CREATE SEQUENCE NUMERO_APPART START WITH 0 MINVALUE 0 INCREMENT BY 1;

PROMPT  ->  Tables creees

INSERT INTO UTILISATEURS VALUES ('Paul', 'paul@','paul', 'AGENTIMMO');
INSERT INTO UTILISATEURS VALUES ('Anne', 'anne@','anne', 'AGENTIMMO');

PROMPT  ->  Types d appartements initialises 

COMMIT;
PROMPT
PROMPT -> FIN DE CREATION
PROMPT
PROMPT IMPORTANT : Merci de verifier que les tables suivantes sont bien creees :
PROMPT AGENTIMMO, PROPRIETAIRES et APPARTEMENTS
PROMPT ************************************************************
PROMPT
SET FEEDBACK ON