#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

echo $($PSQL "TRUNCATE teams, games")

cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  if [[ $YEAR != year ]]
  then

    # GET winner_id
    WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'");

    # IF winner_id NOT FOUND
    if [[ -z $WINNER_ID ]]
    then
      # INSERT winner_id
      INSERT_WINNER_RESULT=$($PSQL "INSERT INTO teams (name) VALUES ('$WINNER')")
      if [[ $INSERT_WINNER_RESULT == 'INSERT 0 1' ]]
      then
        echo Inserted into teams, $WINNER
      fi
      # GET NEWLY INSERTED winner_id
      WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
    fi

    # GET opponent_id
    OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'");

    # IF opponent_id NOT FOUND    
    if [[ -z $OPPONENT_ID ]]
    then
      # INSERT opponent_id
      INSERT_OPPONENT_RESULT=$($PSQL "INSERT INTO teams (name) VALUES ('$OPPONENT')")
      if [[ $INSERT_OPPONENT_RESULT == 'INSERT 0 1' ]]
      then
        echo Inserted into teams, $OPPONENT
      fi
      # GET NEWLY INSERTED opponent_id
      OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")
    fi

    # GET game_id
    GAME_ID=$($PSQL "SELECT game_id FROM games 
      WHERE winner_id='$WINNER_ID' AND opponent_id='$OPPONENT_ID'
      AND year=$YEAR AND winner_goals=$WINNER_GOALS AND opponent_goals=$OPPONENT_GOALS
      AND round='$ROUND'
    ")

    # IF game_id NOT FOUND    
    if [[ -z $GAME_ID ]]
    then
      # INSERT game_id
      INSERT_GAME_RESULT=$($PSQL "INSERT INTO games (year, round, winner_id, opponent_id, winner_goals, opponent_goals) 
        VALUES ($YEAR, '$ROUND', $WINNER_ID, $OPPONENT_ID, $WINNER_GOALS, $OPPONENT_GOALS)
      ")
      if [[ $INSERT_GAME_RESULT == 'INSERT 0 1' ]]
      then
        echo Inserted into games, $YEAR $ROUND $WINNER $OPPONENT $WINNER_GOALS $OPPONENT_GOALS
      fi
      # GET NEWLY INSERTED game_id
      GAME_ID=$($PSQL "SELECT game_id FROM games 
        WHERE winner_id='$WINNER_ID' AND opponent_id='$OPPONENT_ID'
        AND year=$YEAR AND winner_goals=$WINNER_GOALS AND opponent_goals=$OPPONENT_GOALS
        AND round='$ROUND'
      ")
    fi

  fi
done
