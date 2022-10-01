TRUNCATE TABLE users, posts RESTART IDENTITY; 

INSERT INTO users (email_address, username) VALUES ('matthew@matthewmail.com', 'Matthew');
INSERT INTO users (email_address, username) VALUES ('mark@markmail.com', 'Mark');

INSERT INTO posts (title, content, views, user_id) VALUES ('Hail Ho', 'Whatup!', 99, 1);
-- INSERT INTO posts (title, content, views, user_id) VALUES ('Come on down', 'That will be the day', 89, 1);