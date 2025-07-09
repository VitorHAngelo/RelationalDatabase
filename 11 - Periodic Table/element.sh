#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=periodic_table -A -t --no-align -c"

if [[ -z $1 ]]
then
  echo 'Please provide an element as an argument.'
else
  if [[ $1 =~ ^[0-9]+$ ]] # is numeric
  then
  QUERY=$($PSQL "SELECT name, symbol, properties.atomic_number, atomic_mass, melting_point_celsius, boiling_point_celsius, type FROM properties LEFT JOIN elements ON properties.atomic_number = elements.atomic_number LEFT JOIN types ON properties.type_id = types.type_id WHERE properties.atomic_number = $1;")
  if [[ -n $QUERY ]]
    then
    IFS="|" read NAME SYMBOL ATOMIC_NUMBER MASS MELTING BOILING TYPE <<< $QUERY
    echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $MASS amu. $NAME has a melting point of $MELTING celsius and a boiling point of $BOILING celsius."
    else
    echo 'I could not find that element in the database.'  
  fi
  elif [[ $1 =~ ^[a-zA-Z]{1,2}$ ]] # is char
  then
  QUERY=$($PSQL "SELECT name, symbol, properties.atomic_number, atomic_mass, melting_point_celsius, boiling_point_celsius, type FROM properties LEFT JOIN elements ON properties.atomic_number = elements.atomic_number LEFT JOIN types ON properties.type_id = types.type_id WHERE elements.symbol = '$1';")
  if [[ -n $QUERY ]]
    then
    IFS="|" read NAME SYMBOL ATOMIC_NUMBER MASS MELTING BOILING TYPE <<< $QUERY
    echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $MASS amu. $NAME has a melting point of $MELTING celsius and a boiling point of $BOILING celsius."
    else
    echo 'I could not find that element in the database.'
  fi
  elif [[ $1 =~ ^[a-zA-Z]+$ ]] # is string
  then
  QUERY=$($PSQL "SELECT name, symbol, properties.atomic_number, atomic_mass, melting_point_celsius, boiling_point_celsius, type FROM properties LEFT JOIN elements ON properties.atomic_number = elements.atomic_number LEFT JOIN types ON properties.type_id = types.type_id WHERE elements.name = '$1';")
  if [[ -n $QUERY ]]
    then
    IFS="|" read NAME SYMBOL ATOMIC_NUMBER MASS MELTING BOILING TYPE <<< $QUERY
    echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $MASS amu. $NAME has a melting point of $MELTING celsius and a boiling point of $BOILING celsius."
    else
    echo 'I could not find that element in the database.'
  fi
  else # invalid
  echo 'I could not find that element in the database.'  
  fi
fi