/*Queries that provide answers to the questions from all projects.*/

-- Day I

SELECT * FROM animals WHERE name LIKE '%mon';
SELECT name FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';
SELECT name FROM animals WHERE neutered = TRUE AND escape_attempts < 3;
SELECT date_of_birth FROM animals WHERE name = 'Agumon' OR name = 'Pikachu';
SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;
SELECT * FROM animals WHERE neutered = TRUE;
SELECT * FROM animals WHERE name != 'Gabumon';
SELECT * FROM animals WHERE weight_kg >= 10.4 AND weight_kg <= 17.3;

-- Day II

BEGIN;
UPDATE animals SET species = 'unspecified';
SELECT species FROM animals;
ROLLBACK;
SELECT species FROM animals;

BEGIN;
UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon';
UPDATE animals SET species = 'pokemon' WHERE species IS NULL;
COMMIT;
SELECT species FROM animals;

BEGIN;
DELETE FROM animals;
ROLLBACK;
SELECT * FROM animals;

BEGIN;
DELETE FROM animals WHERE date_of_birth > '2022-01-01';
SAVEPOINT DOF;
UPDATE animals SET weight_kg = weight_kg * -1;
ROLLBACK TO DOF;
UPDATE animals SET weight_kg = weight_kg * -1 WHERE weight_kg < 0;
COMMIT;

SELECT COUNT (name) AS number_of_animals FROM animals;
SELECT COUNT (name) AS number_of_animals_not_escaped FROM animals WHERE escape_attempts = 0;
SELECT AVG (weight_kg) AS avarage_age FROM animals;
SELECT SUM (escape_attempts), neutered AS escape_attempts FROM animals GROUP BY neutered;
SELECT MIN(weight_kg), MAX(weight_kg), species FROM animals GROUP BY species;
SELECT AVG(escape_attempts), species AS average_escape_attempts FROM animals WHERE date_of_birth BETWEEN '1990-12-31' AND '2000-01-01' GROUP BY species;

-- Day III

SELECT animals.name, owners.full_name FROM animals 
JOIN owners ON animals.owner_id = owners.id 
WHERE owners.full_name = 'Melody Pond';

SELECT animals.name, species.name FROM animals 
JOIN species ON animals.species_id = species.id 
WHERE species.name = 'Pokemon';

SELECT animals.name, owners.full_name FROM animals 
RIGHT JOIN owners ON animals.owner_id = owners.id;

SELECT species.name, COUNT(animals.name) AS animals_count FROM species 
JOIN animals ON animals.species_id = species.id GROUP BY species.name;

SELECT animals.name AS animal_name, owners.full_name AS owner_name FROM animals
JOIN owners ON animals.owner_id = owners.id
JOIN species ON animals.species_id = species.id
WHERE owners.full_name = 'Jennifer Orwell' AND species.name = 'Digimon';

SELECT animals.name, owners.full_name FROM animals
JOIN owners ON animals.owner_id = owners.id
WHERE owners.full_name = 'Dean Winchester' AND animals.escape_attempts = 0;

SELECT owners.full_name, COUNT(animals.name) FROM owners
JOIN animals ON animals.owner_id = owners.id
GROUP BY owners.full_name ORDER BY COUNT DESC LIMIT 1;
