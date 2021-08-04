PRAGMA foreign_keys = ON;

CREATE TABLE users (
    id INTEGER PRIMARY KEY,
    f_name VARCHAR NOT NULL,
    l_name VARCHAR NOT NULL
);

CREATE TABLE questions (
    id INTEGER PRIMARY KEY,
    title VARCHAR,
    body TEXT,
    author_id INTEGER NOT NULL,

    FOREIGN KEY (author_id) REFERENCES users(id)
);

CREATE TABLE question_follows (
    id INTEGER PRIMARY KEY,
    question_id INTEGER NOT NULL,
    author_id INTEGER NOT NULL,

    FOREIGN KEY (question_id) REFERENCES questions(id),
    FOREIGN KEY (author_id) REFERENCES users(id)
);

CREATE TABLE replies (
    id INTEGER PRIMARY KEY,
    body VARCHAR NOT NULL,
    parent_id INTEGER,
    question_id INTEGER NOT NULL,
    replier_id INTEGER NOT NULL,

    FOREIGN KEY (parent_id) REFERENCES replies(id),
    FOREIGN KEY (question_id) REFERENCES questions(id),
    FOREIGN KEY (replier_id) REFERENCES users(id)
);

CREATE TABLE question_likes (
    id INTEGER PRIMARY KEY,
    liker_id INTEGER NOT NULL,
    question_id INTEGER NOT NULL,

    FOREIGN KEY (liker_id) REFERENCES users(id),
    FOREIGN KEY (question_id) REFERENCES questions(id)
);



INSERT INTO
    users (f_name, l_name)
VALUES
    ('Vincent', 'Hsu'),
    ('Josh', 'Kim-Biggs'),
    ('Jimmy', 'Kuang');


INSERT INTO
    questions (title, body, author_id)
VALUES
    ('Nth Steps', 'How would you solve n number of stairs problem?', (SELECT id FROM users WHERE f_name = 'Vincent')),
    ('Problematic Array', 'How would you iterate through this array?', (SELECT id FROM users WHERE f_name = 'Josh'));


INSERT INTO
    question_follows (question_id, author_id)
VALUES
    ((SELECT id FROM questions WHERE title = 'Nth Steps'),
     (SELECT id FROM users WHERE f_name = 'Vincent')),
    
    ((SELECT id FROM questions WHERE title = 'Problematic Array'),
     (SELECT id FROM users WHERE f_name = 'Josh'));


INSERT INTO
    replies (body, parent_id, question_id, replier_id)
VALUES
    ('Try fibonacci!',
    NULL,
    (SELECT id FROM questions WHERE title = 'Nth Steps'),
    (SELECT id FROM users WHERE f_name = 'Josh' AND l_name = 'Kim-Biggs')),

    ('Why would that work?',
    (SELECT id FROM replies WHERE body = 'Try fibonacci!'),
    (SELECT id FROM questions WHERE title = 'Nth Steps'),
    (SELECT id FROM users WHERE f_name = 'Jimmy' AND l_name = 'Kuang'));


INSERT INTO
    question_likes (liker_id, question_id)
VALUES
    ((SELECT id FROM users WHERE f_name = 'Jimmy'),
     (SELECT id FROM questions WHERE title = 'Problematic Array'));
