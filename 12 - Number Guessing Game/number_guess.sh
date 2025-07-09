#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -A -t -c"

echo "Enter your username:"
read USERNAME

GUESSING_GAME() {
SECRET_NUMBER=$(( (RANDOM % 1000 ) +1 ))
GUESS_COUNT=0
echo "Guess the secret number between 1 and 1000:"
while [[ $USER_GUESS != $SECRET_NUMBER ]]
do
read USER_GUESS
if [[ $USER_GUESS =~ ^[^0-9]+$ ]] # if value is not digits
  then
  echo "That is not an integer, guess again: " 
  elif ! [[ $USER_GUESS =~ ^[0-9]{1,4}$ ]] # if value exceeds the range
  then
  echo "The value exceeds the 1-1000 range."
  elif [[ $USER_GUESS -lt $SECRET_NUMBER ]] # guess is lower 
  then
  (( GUESS_COUNT+=1 ))
  echo "It's higher than that, guess again:"
  elif [[ $USER_GUESS -gt $SECRET_NUMBER ]] # guess is lower
  then
  (( GUESS_COUNT+=1 ))
  echo "It's lower than that, guess again:"
  else
  (( GUESS_COUNT+=1 ))
  if [[ $GUESS_COUNT -lt $BEST_GAME || $BEST_GAME -eq 0 ]] # verify if the game was better than the stored in users profile
  then
  UPDATE_GAMES_PLAYED=$($PSQL "UPDATE users SET games_played = games_played + 1 WHERE name = '$USERNAME'")
  UPDATE_BEST_GAME=$($PSQL "UPDATE users SET best_game = $GUESS_COUNT WHERE name = '$USERNAME'")
  fi
  echo "You guessed it in $GUESS_COUNT tries. The secret number was $SECRET_NUMBER. Nice job! "
  fi
done
}


if [[ $USERNAME =~ ^.{1,22}$ ]]
then
QUERY=$($PSQL "SELECT name, games_played, best_game FROM users WHERE name = '$USERNAME';")
if [[ -n  $QUERY ]]
  then # if user exists
  IFS="|" read NAME GAMES_PLAYED BEST_GAME <<< $QUERY
  echo "Welcome back, $NAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
  else # elif user is new
  INSERT_RESULT=$($PSQL "INSERT INTO users(name) VALUES('$USERNAME');")
  echo "Welcome, $USERNAME! It looks like this is your first time here."
  fi
  GUESSING_GAME
else
echo "Invalid input."
fi

