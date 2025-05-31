CREATE TABLE "users" (
  "id" uuid PRIMARY KEY,
  "username" varchar,
  "created_at" timestamp
);

CREATE TABLE "posts" (
  "id" uuid PRIMARY KEY,
  "user_id" uuid,
  "description" text,
  "latitde" number,
  "longitude" number,
  "status" varchar,
  "created_at" timestamp,
  "updated_at" timestamp
);

CREATE TABLE "post_images" (
  "id" uuid PRIMARY KEY,
  "post_id" uuid,
  "image_source" varchar,
  "created_at" timestamp
);

CREATE TABLE "post_comments" (
  "id" uuid PRIMARY KEY,
  "post_id" uuid,
  "comment" varchar,
  "created_at" timestamp
);

CREATE TABLE "post_review" (
  "id" uuid PRIMARY KEY,
  "post_id" uuid,
  "review" varchar,
  "created_at" timestamp
);

ALTER TABLE "posts" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "post_images" ADD FOREIGN KEY ("id") REFERENCES "posts" ("id");

ALTER TABLE "post_comments" ADD FOREIGN KEY ("id") REFERENCES "posts" ("id");

ALTER TABLE "post_review" ADD FOREIGN KEY ("id") REFERENCES "posts" ("id");
