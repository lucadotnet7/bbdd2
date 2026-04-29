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