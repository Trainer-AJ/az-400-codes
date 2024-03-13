\c tbt_14_feb;

CREATE TABLE login (
    id SERIAL PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    password VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL
);

INSERT INTO login (username, password, email) VALUES
('user1', 'password1', 'user1@example.com'),
('user2', 'password2', 'user2@example.com'),
('user3', 'password3', 'user3@example.com'),
('user4', 'password4', 'user4@example.com'),
('user5', 'password5', 'user5@example.com'),
('user6', 'password6', 'user6@example.com'),
('user7', 'password7', 'user7@example.com'),
('user8', 'password8', 'user8@example.com'),
('user9', 'password9', 'user9@example.com'),
('user10', 'password10', 'user10@example.com');

-- show all tables
 \dt

-- fetch everything
select * from login;
