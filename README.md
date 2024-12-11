# Unity Care Clinic - Conception et Mise en œuvre de la Base de Données

## Aperçu du Projet
Le projet Unity Care Clinic Database consiste à concevoir et implémenter une base de données qui prend en charge la gestion efficace des données hospitalières. Cette base de données gère les informations sur les départements, les médecins, les patients, les chambres, les admissions, les rendez-vous, les médicaments, les prescriptions et le personnel administratif.

L'objectif est d'assurer une gestion fiable, sécurisée, évolutive et performante des données tout en soutenant divers besoins opérationnels dans un environnement hospitalier.

## Tables de la Base de Données
Le schéma de la base de données comprend les tables suivantes :

1. **Départements** (`departments`)  
   Contient les informations sur les départements de la clinique (par exemple : Cardiologie, Neurologie, Oncologie).

2. **Médecins** (`doctors`)  
   Contient des informations sur les médecins, y compris leur spécialisation et leur affectation à un département.

3. **Patients** (`patients`)  
   Contient les informations personnelles sur les patients (par exemple : nom, date de naissance, sexe, informations de contact).

4. **Chambres** (`rooms`)  
   Contient des informations sur les chambres de l'hôpital, comme le numéro de chambre, le type et le statut de l'occupation.

5. **Admissions** (`admissions`)  
   Enregistre les admissions des patients, y compris l'affectation des chambres et la date d'admission.

6. **Rendez-vous** (`appointments`)  
   Contient des informations sur les rendez-vous entre les patients et les médecins, y compris la date et l'heure.

7. **Médicaments** (`medications`)  
   Liste les médicaments disponibles à la clinique.

8. **Prescriptions** (`prescriptions`)  
   Enregistre les prescriptions des médecins aux patients.

9. **Personnel Administratif** (`administrative_staff`)  
   Contient les informations sur le personnel responsable de la gestion des opérations de l'hôpital.

## Fonctionnalités et Requêtes SQL
Ce projet couvre plusieurs opérations SQL permettant de gérer efficacement les données hospitalières. Ces opérations comprennent :

- **Opérations CRUD** : Création, lecture, mise à jour et suppression des données pour les patients, médecins, départements, etc.
- **Requêtes complexes** : Filtrage, tri et jointure des tables pour récupérer des données spécifiques (par exemple : récupérer les patients par date de naissance, lister les rendez-vous par département).
- **Agrégation** : Utilisation de fonctions agrégées comme `COUNT()`, `SUM()`, `AVG()`, `MAX()` pour analyser les données (par exemple : calculer l'âge moyen des patients).
- **Contraintes** : Mise en place de contraintes pour garantir l'intégrité des données, comme des clés primaires, des clés étrangères et des contraintes uniques.

## Comment Utiliser

1. **Clonez le repository** :  
   Clonez le repository sur votre machine locale en utilisant la commande :
   ```bash
   git clone:
