SET SERVEROUTPUT ON;

-- Ejercicio 1
/
DECLARE
    V_NUMERO NUMBER(2, 0);
BEGIN
    V_NUMERO := -1;
    IF V_NUMERO > 0 THEN
        DBMS_OUTPUT.PUT_LINE('El número es positivo.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('El número es negativo.');
    END IF;
END;
/

-- Ejercicio 2
/
DECLARE
    V_NUMERO NUMBER(2,0);
BEGIN
    V_NUMERO := -20;

    IF V_NUMERO = 0 THEN
        DBMS_OUTPUT.PUT_LINE('El número es 0.');
    ELSIF V_NUMERO > 0 THEN
        DBMS_OUTPUT.PUT_LINE('El número es positivo.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('El número es negativo.');
    END IF;
END;
/

-- Ejercicio 3
/
DECLARE
    V_NUMERO NUMBER(2,0);
BEGIN
    V_NUMERO := 9;

    IF MOD(V_NUMERO, 2) = 0 THEN
        DBMS_OUTPUT.PUT_LINE('El número es par.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('El número es impar.');
    END IF;
END;
/

-- Ejercicio 4
/
DECLARE
    V_NUMERO NUMBER(2,0);
BEGIN
    V_NUMERO := 28;

    IF MOD(V_NUMERO, 3) = 0 THEN
        DBMS_OUTPUT.PUT_LINE('El número es múltiplo de 3.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('El número NO es múltiplo de 3.');
    END IF;
END;
/

-- Ejercicio 5
/
DECLARE
    V_NUMERO NUMBER(2,0);
BEGIN
    V_NUMERO := 29;

    IF MOD(V_NUMERO, 3) = 0 THEN
        DBMS_OUTPUT.PUT_LINE('El número es múltiplo de 3');
    ELSE
        FOR i IN 1..V_NUMERO LOOP
            IF MOD(V_NUMERO - i, 3) = 0 THEN
                DBMS_OUTPUT.PUT_LINE(
                    'El número múltiplo de 3 anterior al número: ' 
                    || TO_CHAR(V_NUMERO) || ' es: ' 
                    || TO_CHAR(V_NUMERO - i));
                RETURN;
            END IF;
        END LOOP;
    END IF;
END;
/

-- Ejercicio 6
/
DECLARE
    V_PRIMER_NUMERO NUMBER(2,0) := 0;
    V_SEGUNDO_NUMERO NUMBER(2,0) := 0;
    V_RESULTADO_SUMA NUMBER(4,0);
BEGIN
    V_PRIMER_NUMERO := 20;
    V_SEGUNDO_NUMERO := 10;

    V_RESULTADO_SUMA := V_PRIMER_NUMERO + V_SEGUNDO_NUMERO;

    DBMS_OUTPUT.PUT_LINE(
        'El resultado de la suma entre el número: ' 
        || V_PRIMER_NUMERO || ' y ' || V_SEGUNDO_NUMERO || 
        ' es: ' || V_RESULTADO_SUMA);
END;
/

-- Ejercicio 7
/
DECLARE
    V_PRIMER_NUMERO NUMBER(2,0) := 40;
    V_SEGUNDO_NUMERO NUMBER(2,0) := -10;
BEGIN
    IF V_PRIMER_NUMERO > V_SEGUNDO_NUMERO THEN
        DBMS_OUTPUT.PUT_LINE(
            'El primer número (' || V_PRIMER_NUMERO || ') 
            es MAYOR al segundo número (' || V_SEGUNDO_NUMERO || ').');
    ELSIF V_PRIMER_NUMERO < V_SEGUNDO_NUMERO THEN
        DBMS_OUTPUT.PUT_LINE(
            'El primer número (' || V_PRIMER_NUMERO || ') 
            es MENOR al segundo número (' || V_SEGUNDO_NUMERO || ').');
    ELSE
        DBMS_OUTPUT.PUT_LINE(
            'El primer número (' || V_PRIMER_NUMERO || ') 
            es IGUAL al segundo número (' || V_SEGUNDO_NUMERO || ').');
    END IF;
END;
/

-- Ejercicio 8
/
DECLARE
    V_NOMBRE VARCHAR2(40) := 'Luca';
    V_APELLIDO VARCHAR(40) := 'Cañas';
    V_PRIMER_LETRA_NOMBRE CHAR(1);
    V_PRIMER_LETRA_APELLIDO CHAR(1);
BEGIN
    IF (V_NOMBRE IS NOT NULL AND V_APELLIDO IS NOT NULL) THEN
        V_PRIMER_LETRA_NOMBRE := SUBSTR(V_NOMBRE, 1, 1);
        V_PRIMER_LETRA_APELLIDO := SUBSTR(V_APELLIDO, 1, 1);
        DBMS_OUTPUT.PUT_LINE('Las primeras letras del nombre y el apellido son: ' || V_PRIMER_LETRA_NOMBRE || V_PRIMER_LETRA_APELLIDO);
    ELSE
        DBMS_OUTPUT.PUT_LINE('El nombre y el apellido está vacío.');
    END IF;
END;
/

-- Ejercicio 9
/
DECLARE
    V_PRIMER_NUMERO NUMBER(2,0) := 0;
    V_SEGUNDO_NUMERO NUMBER(2, 0) := 9;
    V_RESULTADO NUMBER(2,0);
BEGIN
    IF (V_PRIMER_NUMERO > V_SEGUNDO_NUMERO AND V_SEGUNDO_NUMERO > 0) THEN
        V_RESULTADO := V_PRIMER_NUMERO / V_SEGUNDO_NUMERO;
        DBMS_OUTPUT.PUT_LINE(
            'La división entre: ' || V_PRIMER_NUMERO || 
            ' y ' || V_SEGUNDO_NUMERO || ' es: ' || V_RESULTADO);
    ELSIF (V_SEGUNDO_NUMERO > V_PRIMER_NUMERO AND V_PRIMER_NUMERO > 0) THEN
        V_RESULTADO := V_SEGUNDO_NUMERO / V_PRIMER_NUMERO;
        DBMS_OUTPUT.PUT_LINE(
            'La división entre: ' || V_SEGUNDO_NUMERO || 
            ' y ' || V_PRIMER_NUMERO || ' es: ' || V_RESULTADO);
    ELSE
        DBMS_OUTPUT.PUT_LINE('ERROR: El divisor es 0');
    END IF;
END;
/

-- Ejercicio 10
/
DECLARE
    V_EDAD NUMBER(2,0);
    V_INGRESO NUMBER(8,2);
BEGIN
    V_EDAD := 19;
    V_INGRESO := 800000;

    IF(V_EDAD > 18 AND V_INGRESO >= 800000) THEN
        DBMS_OUTPUT.PUT_LINE('Se debe tributar un impuesto. Edad: ' || V_EDAD || ' e ingresos: ' || V_INGRESO);
    ELSE
        DBMS_OUTPUT.PUT_LINE('No se debe tributar un impuesto. Edad: ' || V_EDAD || ' e ingresos: ' || V_INGRESO);
    END IF;
END;
/

-- Ejercicio 11
/
DECLARE
    V_NOTA NUMBER(2) := 10;
BEGIN
    CASE V_NOTA
        WHEN 10 THEN
            DBMS_OUTPUT.PUT_LINE('Sobresaliente');
        WHEN 9 THEN
            DBMS_OUTPUT.PUT_LINE('Excelente');
        WHEN 8 THEN
            DBMS_OUTPUT.PUT_LINE('Muy Bueno');
        WHEN 7 THEN
            DBMS_OUTPUT.PUT_LINE('Bueno');
        WHEN 6 THEN
            DBMS_OUTPUT.PUT_LINE('Aprobado');
        ELSE
            DBMS_OUTPUT.PUT_LINE('Reprobado');
    END CASE;
END;
/

-- Ejercicio 12
/
DECLARE
    V_PAR NUMBER(2);
BEGIN
    FOR i IN 1..10 LOOP
        V_PAR := i * 2;
        DBMS_OUTPUT.PUT_LINE('Número par: ' || V_PAR);
    END LOOP;
END;
/

-- Ejercicio 13
/
DECLARE
    V_IMPAR NUMBER(2);
BEGIN <<numeros_impares>>
    FOR i IN REVERSE 1..10 LOOP
        V_IMPAR := i * 3;
        DBMS_OUTPUT.PUT_LINE('Número impar: ' || V_IMPAR);
    END LOOP;
END numeros_impares;
/

-- Ejercicio 14
/
CREATE OR REPLACE PROCEDURE MULTIPLY(p_number NUMBER)
IS
    V_RESULTADO NUMBER := 0;
BEGIN
    FOR i IN 1..12 LOOP
        V_RESULTADO := p_number * i;
        DBMS_OUTPUT.PUT_LINE('El número: ' || p_number || ' multiplicado por ' || i || ' es: ' || V_RESULTADO);
    END LOOP;
END;
/
/
BEGIN
    MULTIPLY(10);
END;
/

-- Ejercicio 15
/
DECLARE
    V_ORIGINAL_TEXT VARCHAR2(16) := 'BASE DE DATOS II';
    V_REVERSE_TEXT VARCHAR2(16); -- Cursor IMPLICITO
BEGIN
    SELECT REVERSE(V_ORIGINAL_TEXT) INTO V_REVERSE_TEXT FROM DUAL;
    DBMS_OUTPUT.PUT_LINE(V_REVERSE_TEXT);
END;
/

-- Ejercicio 16
/
CREATE OR REPLACE PROCEDURE SP_GET_FIRST_TEN_PAR(p_asc_desc IN VARCHAR2)
IS
    EX_INVALID_PARAM EXCEPTION;
    V_PAR NUMBER(2);
BEGIN

    IF UPPER(p_asc_desc) = 'ASC' THEN
        FOR i IN 1..10 LOOP
            V_PAR := i * 2;
            DBMS_OUTPUT.PUT_LINE('Número par: ' || V_PAR);
        END LOOP;
    ELSIF UPPER(p_asc_desc) = 'DESC' THEN
        FOR i IN REVERSE 1..10 LOOP
            V_PAR := i * 2;
            DBMS_OUTPUT.PUT_LINE('Número par: ' || V_PAR);
        END LOOP;
    ELSE
        RAISE EX_INVALID_PARAM;
    END IF;

    EXCEPTION
        WHEN EX_INVALID_PARAM THEN
            DBMS_OUTPUT.PUT_LINE('El parámetro ingresado es inválido. Valores permitidos [ASC, asc, DESC, desc]');
END;
/
/
BEGIN
    SP_GET_FIRST_TEN_PAR('asdadas');
END;
/

-- Ejercicio 17
/
CREATE OR REPLACE FUNCTION GET_QUARTER(p_date IN DATE)
RETURN NUMBER
IS
    V_QUARTER INTEGER;
BEGIN
    V_QUARTER := TO_NUMBER(TO_CHAR(p_date, 'Q'));
    RETURN V_QUARTER;
END;
/
/
BEGIN
    DBMS_OUTPUT.PUT_LINE('El trimestre de la fecha ' || SYSDATE || ' es: ' || GET_QUARTER(SYSDATE));
END;
/

-- Ejercicio 18
/
CREATE OR REPLACE FUNCTION GET_CHARS_LENGTH(p_text IN VARCHAR2)
RETURN NUMBER
IS
    V_TEXT_WITHOUT_SPACINGS VARCHAR2(200);
BEGIN
    V_TEXT_WITHOUT_SPACINGS := REPLACE(p_text, ' ', '');

    RETURN LENGTH(V_TEXT_WITHOUT_SPACINGS);
END;
/
/
BEGIN
    DBMS_OUTPUT.PUT_LINE('La cantidad de caracteres del texto hola mundo es: ' || GET_CHARS_LENGTH('hola mundo'));
END;
/

-- Ejercicio 19
/
CREATE OR REPLACE FUNCTION REVERSE_WORD(p_word IN VARCHAR2)
RETURN VARCHAR2
IS
    V_REVERSED VARCHAR(200); -- Cursor IMPLICITO
BEGIN
    IF p_word LIKE '% %' THEN
        RETURN p_word;
    ELSE
        SELECT REVERSE(p_word) INTO V_REVERSED FROM DUAL;
        RETURN V_REVERSED;
    END IF;
END;
/
/
BEGIN
    DBMS_OUTPUT.PUT_LINE('Palabre original: MATE. ' || 'palabra al revés: ' || REVERSE_WORD('MATE'));
END;
/
/
BEGIN
    DBMS_OUTPUT.PUT_LINE('Palabre original: MATE COCIDO. ' || 'palabra al revés: ' || REVERSE_WORD('MATE COCIDO'));
END;
/

-- Ejercicio 20
/
CREATE OR REPLACE FUNCTION GET_YEARS(p_born_date IN DATE)
RETURN NUMBER
IS
    V_YEARS NUMBER;
BEGIN
    V_YEARS := TRUNC(MONTHS_BETWEEN(SYSDATE, p_born_date) / 12);

    RETURN V_YEARS;

    EXCEPTION
        WHEN OTHERS THEN
            RETURN NULL;
END;
/
/
BEGIN
    DBMS_OUTPUT.PUT_LINE('Messi nació en 1987-06-24 y tiene ' || GET_YEARS(TO_DATE('1987-06-24', 'YYYY-MM-DD')) || ' años');
END;
/