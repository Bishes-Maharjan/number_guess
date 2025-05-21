#!/bin/bash

PSQL="psql --username=postgres --dbname=number_guess -t --no-align -c"

generate_random_number() {
  echo $(( ( RANDOM % 1000 ) + 1 ))
}




GAME() {
  RANDOM_NUM=$(generate_random_number)
  echo "Guess the secret number between 1 and 1000:"
  COUNT=0

  while true; do
    ((COUNT++))
    read GUESS

    if [[ ! $GUESS =~ ^[0-9]+$ ]]; then
      echo "That is not an integer, guess again:"
      continue
    fi

    if (( GUESS == RANDOM_NUM )); then
      echo "You guessed it in $COUNT tries. The secret number was $RANDOM_NUM. Nice job!"
      break
    elif (( GUESS < RANDOM_NUM )); then
      echo "It's higher than that, guess again:"
    else
      echo "It's lower than that, guess again:"
    fi
  done

  GAMES_PLAYED=$1
  USERNAME=$2
  BEST_GAME=$3

  GAMES_PLAYED=$((GAMES_PLAYED + 1))

  if [[ -z $BEST_GAME ]] || (( COUNT < BEST_GAME )); then
    BEST_GAME=$COUNT
  fi

  USER_EXIST=$($PSQL "SELECT username FROM userdata WHERE username='$USERNAME'")
  if [[ -z $USER_EXIST ]]; then

    INSERT=$($PSQL "INSERT INTO userdata(username, games_played, best_game) VALUES('$USERNAME', $GAMES_PLAYED, $BEST_GAME)")
  else

    UPDATE=$($PSQL "UPDATE userdata SET games_played=$GAMES_PLAYED, best_game=$BEST_GAME WHERE username='$USERNAME'")
  fi
}

MAIN_MENU() {
echo "Enter your username:";
read USERNAME;

USEREXIST=$($PSQL "select * from userdata where username='$USERNAME'" | sed 's/|/ /g');
read ID USERSNAME GAMES_PLAYED BEST_GAME<<< "$USEREXIST";
if [[ $USEREXIST ]]; then
 echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
else 
  echo "Welcome, $USERNAME! It looks like this is your first time here."
  GAMES_PLAYED=0
  BEST_GAME=
  fi

GAME $GAMES_PLAYED $USERNAME $BEST_GAME
}
MAIN_MENU
