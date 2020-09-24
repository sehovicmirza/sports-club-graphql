# PROJECT REQUIREMENTS
Click [here](PROBLEM_STATEMENT.md) to read the project requirements

# TESTING GUIDE

# Setup

1. Clone the repository and install dependencies
2. Run database migrations and seed script
3. Start the server

# Samples

### Create Training Session
#### Query
```
mutation {
  createTraining(input: {
    schedule: "FREQ=WEEKLY;BYDAY=MO,FR",
    startsAt: "2021-07-16T19:00:00Z",
    teamIds: [1,2] 
  }) {
    training {
      schedule,
      startsAt,
      teams {
        name
      }
    }
    errors
  }
}
```
#### Response
``` json
{
  "data": {
    "createTraining": {
      "training": {
        "schedule": "FREQ=WEEKLY;BYDAY=MO,FR",
        "startsAt": "2021-07-16T19:00:00Z",
        "teams": [
          {
            "name": "Oregon elephants"
          },
          {
            "name": "Georgia zombies"
          }
        ]
      },
      "errors": []
    }
  }
}
```
### Destroy Training Session
#### Query
```
mutation {
  destroyTraining(input: { id: 33 } ) {
    training {
      startsAt,
      teams {
        name
      }
    }
    errors
  }
}
```
#### Response
``` json
{
  "data": {
    "destroyTraining": {
      "training": {
        "startsAt": "2021-07-18T19:00:00Z",
        "teams": []
      },
      "errors": null
    }
  }
}
```
### Update Player Attendance
#### Query
```
mutation {
  updateAttendance(input: {
    attendableId:   1
    attendableType: "Player"
    trainingId:     1
    sessionDate:    "2020-07-11T00:00:00Z"
    presence: 			true
  }) {
    attendance {
      presence
      training {
        startsAt
      }
    }
    errors
  }
}
```
#### Response
``` json
{
  "data": {
    "updateAttendance": {
      "attendance": {
        "presence": true,
        "training": {
          "startsAt": "2020-07-11T00:00:00Z"
        }
      },
      "errors": null
    }
  }
}
```
### Get Player Attendance Rate
#### Query
```
{
    player(id: 1) {
      name
      email
      attendanceRate(
        gameDay: "2020-11-06T00:00:00Z"
        wholeSeason: true
      )
    }
  }
```
#### Response
``` json
{
  "data": {
    "player": {
      "name": "Elizebeth",
      "email": "theodore@monahan.com",
      "attendanceRate": "60%"
    }
  }
}
```
### Get Player Upcomming Schedule
#### Query
```
  {
    player(id: 1) {
      name
      upcommingSchedule(limit: 20) {
        startsAt
        teams {
          name
        }
      }
    }
  }
```
#### Response
``` json
{
  "data": {
    "player": {
      "name": "Elizebeth",
      "upcommingSchedule": [
        {
          "startsAt": "2020-07-11T00:00:00Z",
          "teams": [
            {
              "name": "Oregon elephants"
            }
          ]
        },
        {
          "startsAt": "2020-07-17T00:00:00Z",
          "teams": [
            {
              "name": "Oregon elephants"
            }
          ]
        }
      ]
    }
  }
}
```
# Timesheet
A document listing executed tasks with timings can be found [here](TIMESHEET.md)
