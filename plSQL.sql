SET SERVEROUTPUT ON
DECLARE
valor_parcela number(10,2);
valor_total number(10,2) := &Digite_o_valor_total;
BEGIN
    valor_parcela :=(valor_total * 1.03)/10;
    dbms_output.put_line('Valor da parcela é de '|| valor_parcela);
END;