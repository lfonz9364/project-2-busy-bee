# Project 2: Busy Bee

## User Story

A lot of people nowadays have many ideas but prevented to create it by expertise limitation. Therefore, a website to connect freelance developers with potential clients would be a way to solve this problem and creating new market for web developers as well.

### Technology Used

- Ruby - 3.4.1
- Bundler - 2.6.8
- Sinatra - 4.1.1
- Postgresql - 17.4
- ActiveRecord - 8.0.2
- Bcrypt - 3.1.20

### Approach

I choose to follow the best practice of doing the documentation and planning at the beginning . First of all, I tried to create a schema and wireframes to aid in development. Second, the database schema then translated into Postgresql tables with relationships notated in ActiveRecord. Third, the coding process was divided into four parts such as developer, requester, jobs and feedbacks. Last but not least, the features for each part also added during development to make it more user friendly.

### What I Learned

Ruby Sinatra could create cleaner web address but it also prone to bugs.

### Unsolved Problems

The current version have several not yet solved problems which are:

- Mobile friendliness
- CSS styling

### To-Do-List

- Media adaptability
- Further styling

### Future Features

- Project reminder
- Payment page

### Deployment

1. Run "Bundle Install"
2. Create database in postgresql named busy_bee_db
3. Run “psql -U username -d busy_bee_db < schema.sql”
4. Run “psql -U username -d busy_bee_db < seed.sql”
5. Run “Ruby main.rb”
6. [open Local](http://localhost:4567/)

[visit page](https://github.com/lfonz9364/project-2-busy-bee)
![alt tag](https://github.com/lfonz9364/project-2/blob/master/documentation/Database%20Schema%20busy_bee.jpg)
![alt tag](https://github.com/lfonz9364/project-2/blob/master/documentation/BusyBeeFlowchart.jpg)
