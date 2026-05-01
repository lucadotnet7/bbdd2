SET SERVEROUTPUT ON;

-- Ejercicio 1
/
CREATE OR REPLACE FUNCTION GET_TOTAL_EMPLOYEES_BY_DEPARTMENT_ID(p_dep_id IN NUMBER)
RETURN NUMBER
IS
    V_TOTAL_EMPLOYEES NUMBER;
BEGIN
    SELECT COUNT(ID) INTO V_TOTAL_EMPLOYEES FROM EMPLEADOS E WHERE E.DEPARTAMENTO_ID = p_dep_id;

    RETURN V_TOTAL_EMPLOYEES;
END;
/
/
BEGIN
    DBMS_OUTPUT.PUT_LINE('La cantidad de empleados para el departarmento de administración es: ' || GET_TOTAL_EMPLOYEES_BY_DEPARTMENT_ID(1230));
END;
/

-- Ejercicio 2
/
CREATE OR REPLACE FUNCTION GET_HOW_MANY_DAYS_TO_BIRTHDAY(p_born_date IN DATE)
RETURN NUMBER
IS
    v_next_birthday DATE;
    v_today DATE := TRUNC(SYSDATE); -- Trunco para obtener solamente el mes el dia y el año (quito la hora)
    v_born_day VARCHAR2(2);
    v_born_month VARCHAR2(2);
    v_actual_year VARCHAR2(4);
BEGIN
    v_born_day := TO_CHAR(p_born_date, 'DD');
    v_born_month := TO_CHAR(p_born_date, 'MM');
    v_actual_year := TO_CHAR(v_today, 'YYYY');

    -- Armo la fecha de cumpleaños del año en curso (sí p_born_date es '15-08-2025', lo que armo es '15-08-2026') para restarlo al año por parametro
    v_next_birthday := TO_DATE(v_born_day || '-' || v_born_month || '-' || v_actual_year);

    -- Sí el cumpleaños ya pasó este año entonces el próximo cumpleaños es el año siguiente, tengo que agregarle 12 meses al next_birthday
    IF v_next_birthday < v_today THEN
        v_next_birthday := ADD_MONTHS(v_next_birthday, 12);
    END IF;


    -- Siguiendo el ejemplo, '15-08-2026' con fecha actual (01-05-2026) la diferencia son los días que faltan para el prox cumpleaños
    RETURN v_next_birthday - v_today;
END;
/
/
SELECT GET_HOW_MANY_DAYS_TO_BIRTHDAY(TO_DATE('07-08-2000', 'DD-MM-YYYY')) AS dias_faltantes FROM DUAL;
/

-- Ejercicio 3
SELECT * FROM PRODUCTOS;
/
CREATE OR REPLACE PROCEDURE UPDATE_PRODUCT_PRICE_BY_CODE(
    p_product_code IN VARCHAR2,
    p_product_price IN NUMBER)
IS
    EX_INVALID_CODE EXCEPTION;
    v_updated_rows NUMBER;
BEGIN
    UPDATE PRODUCTOS P 
        SET P.PRECIO_UNITARIO = p_product_price
    WHERE P.COD_PRODUCTO = p_product_code;

    v_updated_rows := SQL%ROWCOUNT;

    IF v_updated_rows = 0 THEN
        RAISE_APPLICATION_ERROR(-20001, 'Error: El código de producto [' || p_product_code || '] no existe.');
    END IF;

    EXCEPTION
        WHEN OTHERS THEN
            IF SQLCODE != -20001 THEN
                RAISE_APPLICATION_ERROR(-20002, 'Error inesperado al actualizar: ' || SQLERRM);
            ELSE
                RAISE;
            END IF;
END UPDATE_PRODUCT_PRICE_BY_CODE;
/
/
BEGIN
    SELECT * FROM PRODUCTOS;
    -- UPDATE_PRODUCT_PRICE_BY_CODE('P0011', 1500);
END;
/

-- Ejercicio 4
/
CREATE OR REPLACE FUNCTION GET_PRICE_BY_PRODUCT_ID (p_product_code IN VARCHAR2)
RETURN NUMBER
IS
    v_product_exist NUMBER;
    v_product_price NUMBER;
BEGIN
    SELECT COUNT(P.COD_PRODUCTO) 
    INTO v_product_exist 
    FROM PRODUCTOS P
    WHERE P.COD_PRODUCTO = p_product_code;

    IF v_product_exist = 0 THEN
        RAISE_APPLICATION_ERROR(-20001,  'Error: El código de producto [' || p_product_code || '] no existe.');
    END IF;

    SELECT P.PRECIO_UNITARIO 
    INTO v_product_price
    FROM PRODUCTOS P
    WHERE P.COD_PRODUCTO = p_product_code;

    RETURN v_product_price;

    EXCEPTION
        WHEN OTHERS THEN
            IF SQLCODE != -20001 THEN
                RAISE_APPLICATION_ERROR(-20002, 'Error inesperado al actualizar: ' || SQLERRM);
            ELSE
                RAISE;
            END IF;
END GET_PRICE_BY_PRODUCT_ID;
/
/
BEGIN
    DBMS_OUTPUT.PUT_LINE('
        El precio unitario del producto 
        Disco Duro SATA 120 GB es: ' || GET_PRICE_BY_PRODUCT_ID('P0012') || ' dólares.');
END;
/
-- Ejercicio 5
/
CREATE OR REPLACE FUNCTION GET_NEW_EMPLOYEES_AT_YEAR_BY_DEPARTMENT(p_department_id IN NUMBER)
RETURN NUMBER
IS
    v_actual_year VARCHAR2(2);
    v_new_employees NUMBER(3);
BEGIN
    v_actual_year := TO_CHAR(TRUNC(SYSDATE), 'YY');

    SELECT COUNT(E.ID)
    INTO v_new_employees
    FROM EMPLEADOS E
    WHERE 
        TO_CHAR(E.FECHA_ALTA, 'YY') = v_actual_year
        AND
        E.DEPARTAMENTO_ID = p_department_id;

    RETURN v_new_employees;
END GET_NEW_EMPLOYEES_AT_YEAR_BY_DEPARTMENT;
/
/
BEGIN
    DBMS_OUTPUT.PUT_LINE(
        'La cantidad de empleados que ingresaron 
        este año al departamento de RRHH son: ' 
        || GET_NEW_EMPLOYEES_AT_YEAR_BY_DEPARTMENT(190));
END;
/