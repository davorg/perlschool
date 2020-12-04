CREATE TABLE author (
  id integer not null primary key,
  name varchar(50),
  bio varchar(1000)
);

CREATE TABLE book (
  id integer not null primary key,
  title varchar(100) not null,
  subtitle varchar(200),
  slug varchar (100) not null,
  pubdate date not null,
  blurb varchar(1000) not null,
  image varchar(200) not null,
  amazon_isin varchar(20),
  leanpub_slug varchar(50),
  examples varchar(30),
  author_id integer references author(id)
);
