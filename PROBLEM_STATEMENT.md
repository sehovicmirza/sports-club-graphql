# PROBLEM STATEMENT

# Context

The Belighted Test Sports Club is a Über Ball sports club composed of 4 teams.
Each team is composed of 12 to 18 players, players can be part of 2 different teams.
The whole club trains at the same venue.

## Training sessions
Each team trains usually twice a week.
A training session concerns 1 or 2 teams.

Training session are mostly regular but due to venue access limitation (during holidays) and games schedule (one or 2 games / month), some sessions can be deleted or created at "irregular dates".

Teams training sessions can be defined either 
- with a recurrent rule, ex: training session for team C every Monday and Sunday
- with a unique definition, ex: training session for team B on Tuesday 23rd

Training session can also be deleted.

## Attendance
For organisational reason, players have to communicate their attendance for each training session.
Attendance is a binary info : presence / absence. 

Each player can set their attendance for each training session individually but also has a default status.

A player can only update their attendance for training session in the future.

As games rosters are limited, only players with the best attendance rate get to play.
For a game day, team manager take into account
- the attendance rate for the 10 training sessions previous to the game day
- the attendance rate for the whole season until game day

# Project goals

## Training

- BTSC members should be able to create training sessions for teams, either unique ones or regular ones following a recurrent rule
- BTSC members should be able to delete training sessions

## Attendance

- BTSC members should be able to update their attendance for a specific training session
- BTSC members should be able to retrieve the schedule of their upcoming team(s) training sessions
- BTSC members should be able, for any game day, to retrieve the attendance rates for a player / a team

# Requirements

- Project goals should be met using a backend only application providing a GraphQL API
- Authentication is not needed, everyone should be able to use the API
- Project should take a maximum of 6 hours and be completed within 8 days
- A document listing executed tasks with timings should be sent with the project

# Any question ?

Feel free to ask any question you would have to the Überball champion and president of the Belighted Test Sports Club at kcl@belighted.com