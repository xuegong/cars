DROP ALIAS IF EXISTS SQUARE;

CREATE ALIAS SQUARE AS 
$$
    Double square(Double x) {
        return x * x;
    }
$$;

