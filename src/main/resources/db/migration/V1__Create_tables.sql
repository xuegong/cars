CREATE TABLE car_table (
    id INT PRIMARY KEY,
    name VARCHAR(255)
);


CREATE VIEW sample_view AS SELECT name FROM car_table;
