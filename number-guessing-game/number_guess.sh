#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess --tuples-only -c"

# global variable
GUESS_COUNT=0

# intro function
INTRO() {
  # ask for username
  echo "Enter your username:"
  read USERNAME

  # check for valid username
  USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME'")

  if [[ -z $USER_ID ]]
  then

    # create user
    CREATE_USER=$($PSQL "INSERT INTO users (username) VALUES ('$USERNAME')")

    # valid username
    if [[ $CREATE_USER == 'INSERT 0 1' ]]
    then

      # get user id
      USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME'")
    
      # successfully created username
      echo "Welcome, $USERNAME! It looks like this is your first time here." 

      # 'generate secret number' function
      GENERATE_SECRET_NUMBER

    fi

  else
    # get user properties
    GAMES_PLAYED=$($PSQL "SELECT count(user_id) FROM games WHERE user_id=$USER_ID")
    BEST_GAME=$($PSQL "SELECT min(guesses) FROM games WHERE user_id=$USER_ID")
    
    # greet returning user
    echo "Welcome back, $USERNAME! You have played $(echo $GAMES_PLAYED | sed -r 's/^ *| *$//g') games, and your best game took $(echo $BEST_GAME | sed -r 's/^ *| *$//g') guesses."

    # 'generate secret number' function
    GENERATE_SECRET_NUMBER
  fi

}

# generate secret number function
GENERATE_SECRET_NUMBER() {

  # generate secret number (1-1000)
  SECRET_NUMBER=$(($RANDOM%1000+1))

  # call 'guess secret number' function 
  GUESS_SECRET_NUMBER
}

# guess secret number function
GUESS_SECRET_NUMBER() {

  # no argument given
  if [[ -z $1 ]]
  then
    # guess secret number
    echo "Guess the secret number between 1 and 1000:"
  else
    # print message (argument)
    echo "$1"
  fi

  # read guess number, increment guess count
  read GUESS_NUMBER
  ((GUESS_COUNT++))

  # evaulate number input
  if [[ ! $GUESS_NUMBER =~ ^[0-9]+$ ]]
  then

    # repeat guess number function
    GUESS_SECRET_NUMBER "That is not an integer, guess again:"

  else 

    # secret number > guess number
    if [[ $SECRET_NUMBER -lt $GUESS_NUMBER ]]
    then
      GUESS_SECRET_NUMBER "It's lower than that, guess again:"

    # secret number < guess number
    elif [[ $SECRET_NUMBER -gt $GUESS_NUMBER ]]
    then
      GUESS_SECRET_NUMBER "It's higher than that, guess again:"

    # correct number
    else 

      # create game
      CREATE_GAME=$($PSQL "INSERT INTO games (user_id, guesses) VALUES ($USER_ID, $GUESS_COUNT)")

      # output result
      echo -e "\nYou guessed it in $(echo $GUESS_COUNT | sed -r 's/^ *| *$//g') tries. The secret number was $SECRET_NUMBER. Nice job!"
    
    fi
  fi
}

INTRO
