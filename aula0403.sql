CREATE TABLE ALUNO_TDSB(
RM NUMBER(10),
NOME VARCHAR2(50),
CONSTRAINT ALUNO_PK PRIMARY KEY(RM)
);



INSERT INTO ALUNO_TDSB(RM,NOME) VALUES (1112223333, 'JO�O');
INSERT INTO ALUNO_TDSB(RM,NOME) VALUES (1112224444, 'MATHEUS');
INSERT INTO ALUNO_TDSB(RM,NOME) VALUES (1112225555, 'RODRIGO');


SELECT * FROM aluno_tdsb;


UPDATE aluno_tdsb
    set nome= 'PEDRO'
    WHERE RM = 1112225555;
    

INSERT INTO ALUNO_TDSB(RM,NOME) VALUES (1112229999, 'RODRIGO');


DELETE aluno_tdsb
    where RM = 1112225555;
    
    

COMMIT;