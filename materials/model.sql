CREATE TABLE paths (
    point1 VARCHAR(1),
    point2 VARCHAR(1),
    cost INT
);

INSERT INTO
    paths (point1, point2, cost)
VALUES ('A', 'B', 10),
    ('B', 'A', 10),
    ('A', 'C', 15),
    ('C', 'A', 15),
    ('A', 'D', 20),
    ('D', 'A', 20),
    ('B', 'D', 25),
    ('D', 'B', 25),
    ('D', 'C', 30),
    ('C', 'D', 30),
    ('B', 'C', 35),
    ('C', 'B', 35);
