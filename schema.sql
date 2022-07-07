CREATE DATABASE ('catalog')

CREATE TABLE Item(
    id SERIAL PRIMARY KEY,
    genre_id INT,
    author_id INT,
    source_id INT,
    label_id INT,
    publish_date DATE,
    archived BOOLEAN,
    FOREIGN KEY (genre_id) REFERENCES genre(id),
    FOREIGN KEY (author_id) REFERENCES author(id),
    FOREIGN KEY (label_id) REFERENCES label(id)
    )


CREATE TABLE Label (
  id SERIAL PRIMARY KEY,
  title TEXT,
  color TEXT
)

CREATE TABLE Book (
  publisher TEXT,
  cover_state TEXT
) INHERITS (Item)

CREATE TABLE Genre(
    id SERIAL PRIMARY KEY,
    name VARCHAR(255)
    )

CREATE TABLE Music_Album(
    on_spotify BOOLEAN
    ) INHERITS (Item)