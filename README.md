# Schedular API

## Overview

This API enables student to schedule a call with their mentors. The API is RESTFUL and returns results in JSON. The API supports HTTP and HTTPS. It uses token-based authentication.

## Endpoints

- #### Day Schedule

  - ##### Agenda

    ```
      GET localhost:3000/api/v1/mentors/{mentor_id}/agenda?date={date}
    ```

    - mentor_id(Integer): required
    - date(Param): required. Date in format(yyyy-mm-dd)
- #### Appointments

  - ##### Create an Appointment

    ```
      POST localhost:3000/api/v1/mentors/{mentor_id}/appointments
    ```

    - mentor_id(Integer): required
    - Body:

      - student_id(String): required
      - description(String): required
      - begin_at(String): required
  - ##### Get an Appointment

    ```
       GET localhost:3000/api/v1/mentors{mentor_id}/appointments/{id}
    ```

    - mentor_id(Integer): required
    - id(Integer): required
  - ##### Update an Appointment

    ```
    	PUT localhost:3000/api/v1/mentors{mentor_id}/appointments/{id}
    ```

    - mentor_id(Integer): required
    - id(Integer): required
    - Body:

      - student_id(String)
      - description(String)
      - begin_at(String)
  - ##### Delete an Appointment

    ```
    	GET localhost:3000/api/v1/mentors{mentor_id}/appointments/{id}
    ```

    - mentor_id(Integer): required
    - id(Integer): required
- [See more documentation and sample calls here](https://documenter.getpostman.com/view/1302391/Tzm9iDyr)

## Running Locally

- #### Installation

  - Ruby 3.0.0
  - Rails 6.1.3
- #### Setting up

  - git clone
  - Install dependencies: bundle install
  - rails db:setup
  - rails db:migrate
  - rails db:seed
- #### Running

  - rails s
  - Go to localhost:3000/api/v1/{endpoint}
- #### Running Specs

  - rspec
