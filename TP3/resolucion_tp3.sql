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