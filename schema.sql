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
