#[Ruby Project] - Concert 

##Prerequisites

1. First you need to install [Docker-Engine](https://docs.docker.com/engine/installation/)

2. Then install [docker-compose](https://docs.docker.com/compose/install/) in order to manage multiple containers (PostgreSql and Ruby on rails container)

##Install and use

1. Clone the repository
`git clone https://github.com/NokiDev/RubyKeK.git`

2. Run `docker-compose up`

3. Probably you should have to create databases with `docker-compose run web bin/rails db:create`

4. Go [There](http://localhost:3000/), .. That's it ! 

#Project Informations : 

#Project owners

@Aria Groult , @Kirkiki, @NokiDev

This project is done with the purpose to test our ruby on rails awesome skillz and knowledge haha
For

###Specifications

* 

###Docker Image Informations : 
 * Ruby version 3.1
 * Rails version 5.0.1
 * Run on Ubuntu 14.04
 * PostgreSQL Database 
 
###Routes Detail : 

| Route              |   Request Type          |   Params      |
|:-------------:|:-----------:|:-------:|
|               |             |         |
|               |             |         |
###Tables

####User Table
| Fields        | Types         | Infos  |
|:-------------:|:-------------:|:-----:|
| username      | String        |       |
| password      | String        |  encrypted values     |
| first_name      | String        |       |
| last_name      | String        |       |
| age      | Number        |   Only > 0 value    |
| address      | String        |       |
| mail      | String        |  Check format with this regex :    |
| phone_number      | String        |  Check format with this regex     |
| description | Text      |       |

####Concert Table
| Fields        | Types         | Infos  |
|:-------------:|:-------------:|:-----:|
| name      | String        |       |
| concert_date      | Date        |       |
| remaining_tickets      | Number        |  Updated when buying a tickets     |
| price      | Number        |       |
| style      | String        |  Just a String for now but maybe it will be another table for style    |
| address      | String        |       |
| description | Text            |       |

####Comment Table
| Fields        | Types         | Infos  |
|:-------------:|:-------------:|:-----:|
| authorId      | Number(Foreign Key => UserTable)        |       |
| concertId      | Number(Foreign Key => ConcertTable)        |       |
| comment      | Text        |       |

####Ticket Table
| Fields        | Types         | Infos  |
|:-------------:|:-------------:|:-----:|
| userId      | Number(Foreign Key => UserTable)        |       |
| concertId      | Number(Foreign Key => ConcertTable)        |       |
| price      | Number        |       |
| bougth_date | Date | |

| Fields        | Types         | Infos  |
|:-------------:|:-------------:|:-----:|
| authorId      | Integer(Foreign Key => UserTable)        |       |
| concertId      | Integer(Foreign Key => UserTable)        |       |
| comment      | Text        |       |