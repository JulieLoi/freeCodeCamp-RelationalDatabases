#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=periodic_table --tuples-only -c"

if [[ -z $1 ]]
then
  echo "Please provide an element as an argument."
else 

  # check $1 is atomic_number
  if [[ "$1" =~ ^[0-9]+$ ]]
  then
    ELEMENT=$($PSQL "SELECT atomic_number, symbol, name FROM elements WHERE atomic_number=$1")

  # check $1 is element_symbol
  elif [[ "$1" =~ ^[A-Z][a-z]?$ ]]
  then
    ELEMENT=$($PSQL "SELECT * FROM elements WHERE symbol='$1'")
  
  # check $1 is element_name
  elif [[ "$1" =~ ^[A-Z][a-z]+$ ]]
  then
    ELEMENT=$($PSQL "SELECT * FROM elements WHERE name='$1'")
  fi

  # no element found
  if [[ -z $ELEMENT ]] 
  then
    echo "I could not find that element in the database."

  # element found
  else
    echo -e "$ELEMENT" | while read ATOMIC_NUMBER BAR SYMBOL BAR NAME
    do
      # get element properties
      PROPERTIES=$($PSQL "SELECT * FROM properties WHERE atomic_number=$ATOMIC_NUMBER")

      echo -e "$PROPERTIES" | while read ATOMIC_NUMBER BAR TYPE_ID BAR ATOMIC_MASS BAR MELTING_POINT BAR BOILING_POINT
      do
        # get element type
        TYPE=$($PSQL "SELECT type FROM types WHERE type_id=$TYPE_ID")

        # print output
        echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $(echo $TYPE | sed -r 's/^ *| *$//g'), with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
      done


      
    done

  fi

fi


