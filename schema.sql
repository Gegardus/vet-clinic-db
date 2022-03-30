/* Database schema to keep the structure of entire database. */

-- Day I

CREATE DATABASE vet_clinic;

CREATE TABLE animals (
id int GENERATED ALWAYS AS IDENTITY,
name varchar(100),
date_of_birth date,
escape_attempts int,
neutered bool,
weight_kg decimal,
PRIMARY KEY(id)
);

-- Day II

ALTER TABLE animals ADD species varchar(100);

-- Day III

CREATE TABLE owners (
id int GENERATED ALWAYS AS IDENTITY,
full_name varchar(100),
age int,
PRIMARY KEY(id)
);

CREATE TABLE species (
id int GENERATED ALWAYS AS IDENTITY,
name varchar(100),
PRIMARY KEY(id)
);

ALTER TABLE animals DROP species;

ALTER TABLE animals
ADD species_id int,
ADD CONSTRAINT species_fk
FOREIGN KEY (species_id)
REFERENCES species (id)
ON DELETE CASCADE;

ALTER TABLE animals
ADD owner_id int,
ADD CONSTRAINT owner_fk
FOREIGN KEY (owner_id)
REFERENCES owners (id)
ON DELETE CASCADE;

