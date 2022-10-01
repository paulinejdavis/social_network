TRUNCATE TABLE users, posts RESTART IDENTITY CASCADE; 

INSERT INTO users (email_address, username) VALUES ('matthew@matthewmail.com', 'Matthew');
INSERT INTO users (email_address, username) VALUES ('mark@markmail.com', 'Mark');
INSERT INTO users (email_address, username) VALUES ('dougie@dougieemail.com', 'Luke');
INSERT INTO users (email_address, username) VALUES ('woofwooof@woofemail.com', 'John');

INSERT INTO posts (title, content, views, user_id) VALUES ('title', 'content', 2, 1);