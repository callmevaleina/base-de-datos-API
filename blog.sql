CREATE TABLE "users" (
  "id_user" SERIAL PRIMARY KEY,
  "name" varchar NOT NULL,
  "age" int NOT NULL,
  "email" varchar NOT NULL,
  "password" varchar NOT NULL
);

CREATE TABLE "categories" (
  "id_category" SERIAL PRIMARY KEY,
  "name" varchar NOT NULL
);

CREATE TABLE "posts" (
  "id_post" SERIAL PRIMARY KEY,
  "title" varchar NOT NULL,
  "description" varchar(250),
  "content" varchar NOT NULL,
  "id_author" int,
  "id_category" int
);

CREATE TABLE "authors" (
  "id_author" SERIAL PRIMARY KEY,
  "name" varchar NOT NULL,
  "age" int NOT NULL,
  "email" varchar NOT NULL,
  "password" varchar NOT NULL
);

CREATE TABLE "comments" (
  "id_comment" SERIAL PRIMARY KEY,
  "content" varchar NOT NULL,
  "id_post" int,
  "id_user" int
);

CREATE TABLE "rel_posts_categories" (
  "id" SERIAL PRIMARY KEY,
  "id_post" int,
  "id_category" int
);

ALTER TABLE "comments" ADD FOREIGN KEY ("id_post") REFERENCES "posts" ("id_post");

ALTER TABLE "rel_posts_categories" ADD FOREIGN KEY ("id_category") REFERENCES "categories" ("id_category");

ALTER TABLE "rel_posts_categories" ADD FOREIGN KEY ("id_post") REFERENCES "posts" ("id_post");

ALTER TABLE "comments" ADD FOREIGN KEY ("id_user") REFERENCES "users" ("id_user");

ALTER TABLE "posts" ADD FOREIGN KEY ("id_author") REFERENCES "authors" ("id_author");

insert into "users" ("name", "age", "email", "password") values ('Cande', 24, 'cande@gmail.com', 'hola'),
('Valentina', 28, 'vale@gmail.com', 'chau');

insert into "categories" ("name") values ('History'), ('Geography'), ('Science'), ('Economy');


insert into "authors" ("name", "age", "email", "password") values 
('Jaime', 44, 'j@gmail.com', 'xxxxx'),
('Oscar', 50, 'o@gmail.com', 'kkkkk');


insert into "posts" ("title", "description", "content", "id_author", "id_category") values 
('Revolucion Francesa', 'Todo lo que debes saber sobre este hecho historico', 'Lorem ipsum dolor, sit amet consectetur adipisicing elit. Aliquid quod culpa velit nostrum minima deleniti, illum eaque, aperiam eum vel laborum itaque adipisci accusamus magni suscipit porro! Neque, eaque ea!
', 2 , 1 ),
('Inflacion en constante crecimiento', 'Latinoamerica se encuentra en la peor etapa economica', 'Lorem ipsum dolor, sit amet consectetur adipisicing elit. Aliquid quod culpa velit nostrum minima deleniti, illum eaque, aperiam eum vel laborum itaque adipisci accusamus magni suscipit porro! Neque, eaque ea!
', 1 , 4 );

insert into "comments" ("content", "id_post", "id_user") values ('recuerdo haberlo dado en la secundaria', 1 , 2), ('excelente informacion', 2, 1);

insert into "rel_posts_categories" ("id_post", "id_category") values (1, 1), (2, 4);