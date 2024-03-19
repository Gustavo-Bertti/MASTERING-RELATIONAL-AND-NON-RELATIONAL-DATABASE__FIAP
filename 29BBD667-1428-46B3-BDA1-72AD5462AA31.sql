SET SERVEROUTPUT ON
declare
    V_SALARIO NUMBER(10,2) := &DIGITE_SEU_SALARIO;
    V_NOVOSALARIO V_SALARIO%TYPE:= V_SALARIO - (V_SALARIO * 0.16);
    V_AJUSTESALARIO V_SALARIO%TYPE:= V_SALARIO - (V_SALARIO * (28.5/100));
begin
    if v_salario <= 1513.69 then
    dbms_output.put_line('Seu salario é: ' || V_SALARIO);
    elsif v_salario <= 2725.12 then
    dbms_output.put_line('Seu salario é: ' || V_NOVOSALARIO);
    else
    dbms_output.put_line('Seu salario é: ' || V_AJUSTESALARIO);
    end if;
END;


//---------------------------------------------------------------------------

CREATE TABLE ALUNO(
RM NUMBER(2),
NOME VARCHAR2(50),
NOTA NUMBER(2),
MEDIA NUMBER(10,2),
SITUACAO VARCHAR2(50)
);

INSERT INTO aluno(RM, NOME, NOTA) VALUES (1,'GUSTAVO',5);
INSERT INTO aluno(RM, NOME, NOTA) VALUES (2,'GUSTAVO',5);
INSERT INTO aluno(RM, NOME, NOTA) VALUES (3,'GUSTAVO',5);

SET SERVEROUTPUT ON
declare
   V_NOTA NUMBER(2);
   V_MEDIA V_NOTA%TYPE := 0;
   V_MEDIAFINAL V_NOTA%TYPE := 0;
   V_CONTADOR NUMBER(10,2) := 1;
   V_CONTADORDOIS NUMBER(10,2) := 1;
begin
    WHILE V_CONTADOR < 4 LOOP
        SELECT NOTA INTO V_NOTA FROM ALUNO WHERE RM = V_CONTADOR;
        V_MEDIA := V_MEDIA + V_NOTA;
        V_CONTADOR := V_CONTADOR + 1;
          
    END LOOP;
    V_MEDIAFINAL := V_MEDIA /3;
    IF V_MEDIAFINAL > 6 THEN
        WHILE V_CONTADORDOIS < 4 LOOP
        UPDATE ALUNO SET SITUACAO = 'APROVADO' WHERE RM = V_CONTADORDOIS;
        UPDATE ALUNO SET MEDIA = V_MEDIAFINAL WHERE RM = V_CONTADORDOIS;
        V_CONTADORDOIS := V_CONTADORDOIS + 1;
        END LOOP;
        dbms_output.put_line('Você foi aprovado, sua média é : ' || V_MEDIAFINAL );
    ELSE
        WHILE V_CONTADORDOIS < 4 LOOP
        UPDATE ALUNO SET SITUACAO = 'REPROVADO' WHERE RM = V_CONTADORDOIS;
        UPDATE ALUNO SET MEDIA = V_MEDIAFINAL WHERE RM = V_CONTADORDOIS;
        V_CONTADORDOIS := V_CONTADORDOIS + 1;
        END LOOP;
        dbms_output.put_line('Você foi reprovado, sua média é : ' || V_MEDIAFINAL );
    END IF;
    
END;