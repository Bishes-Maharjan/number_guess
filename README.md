# NUMBER GUESSING GAME

A simple Bash + PostgreSQL game to test your luck and store your scores!

## Setup

### Make the script executable

```bash
chmod +x number_guess.sh #EXECUTABLE PERMISSION FOR THE .SH FILE
```

### IF YOU WANNA CONTINUE FROM THE ALREADY EXISTING DB, run:

```bash
psql -U postgres < number_guess.sql #ASSUMING YOUR USERNAME IS postgres
```

### IF YOU WANNA CREATE THE DB BY YOURSELF

```sql
psql -U YOUR_USERNAME; --MAKE SURE YOU GOT POSTGRES AND ITS IN .number_guess.sh as DB_USERNAME

CREATE DATABASE YOUR_DB; --MAKE SURE THIS VALUE IS THE SAME AS DB_NAME in number_guess.sh

\c YOUR_DB;

CREATE TABLE userdata(
user_id int generated always as identity primary key,
username varchar(22) not null, --YOU CAN MAKE THIS UNIQUE IF YOU WANT
games_played int,
best_game int);

```

🕹️ How to Play

## TO RUN:

```bash
./number_guess.sh
```

## GOOD LUCK!
