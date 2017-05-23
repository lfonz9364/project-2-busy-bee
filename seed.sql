
INSERT INTO users (
  first_name, last_name, address,
  suburb, postcode, country, email,
  contact_person, paypal_account, abn, tfn,
  password_digest
) VALUES (
  'Agatha', 'Christie', '19 Rubina Ct',
  'Noble Park', 3174, 'Australia', 'agatha.christie@yahoo.com',
  'Agatha', 'agatha.christie@gmail.com', NULL, 123234678,
  crypt('password', gen_salt('bf'))
),(
  'Barry', 'Tabios', '19 Clayton Rd',
  'Clayton', 3168, 'Australia', 'barry.tabios@gmail.com',
  'Barry', 'barry.tabios@gmail.com', NULL, 321239678,
  crypt('password', gen_salt('bf'))
),(
  'Martina', 'Hingis', '25 Murrumbeena Rd',
  'Murrumbeena', 3163, 'Australia', 'martina.rocks@yahoo.com',
  'Marta', 'martina.hingis@gmail.com', NULL, 333245876,
  crypt('password', gen_salt('bf'))
),(
  'Arthur', 'Redford', '50 Kooyong Rd',
  'Caulfield North', 3161, 'Australia', 'arthur.thebest@yahoo.com',
  'Arthur', 'arthur.redford@gmail.com', NULL, 165568638,
  crypt('password', gen_salt('bf'))
),(
  'GlassDoor', 'Corp', '1656 Dandenong Rd',
  'Oakleigh East', 3166, 'Australia', 'info@glasdoor.com.au',
  'Danie', 'payment@glassdoor.com.au', 155627908, NULL,
  crypt('password', gen_salt('bf'))
),(
  'Happy', 'Always', '2000 Dandenong Rd',
  'Noble Park', 3174, 'Australia', 'contact@happyalways.com.au',
  'Andrew', 'bill@happyalways.com.au', 187596540, NULL,
  crypt('password', gen_salt('bf'))
),(
  'John', 'Smith', '20 Rubina Ct',
  'Noble Park', 3174, 'Australia', 'john.smith@yahoo.com',
  'John', 'john.smith@gmail.com', 867665640, 785632645,
  crypt('password', gen_salt('bf'))
),(
  'Jane', 'Doe', '50 Kangaroo Rd',
  'Murrumbeena', 3163, 'Australia', 'jane.doe@yahoo.com',
  'Jane', 'jane.doe@gmail.com', 896773465, 365477769,
  crypt('password', gen_salt('bf'))
),(
  'Alfons', 'Caroles', '19/1650 Dandenong Rd',
  'Oakleigh East', 3166, 'Australia', 'cllin7787@gmail.com',
  'Alfons', 'faa_iluvu@yahoo.com', 354668767, 097765650,
  crypt('password', gen_salt('bf'))
),(
  'Michael', 'Constantine', '50 Royalty St',
  'Clayton', 3168, 'Australia', 'me@michaelconstantine.com',
  'Michael', 'payment@michaelconstantine.com', 356566547, 187765554,
  crypt('password', gen_salt('bf'))
);

INSERT INTO requesters (
  user_id
) VALUES (
  1
),(
  2
),(
  3
),(
  4
),(
  5
),(
  6
);

INSERT INTO developers (
  user_id
) VALUES (
  7
),(
  8
),(
  9
),(
  10
);

INSERT INTO jobs (
  developer_id, requester_id, job_title,reward,
  description, platform, post_date,
  due_date, status
) VALUES (
  1, 1, 'Mario Bros Games', 400.00,
  'Create a mario bros games for my daughter in Java.', 'Java', '2017-03-12 19:15:17 +1000',
  '2017-03-15 12:00:00 +1000', 'completed'
),(
  2, 1, 'Candy Crush Games', 200.00,
  'A Candy Crush games for my daughter.', 'Web Application', '2017-05-20 12:00:00 +1000',
  '2017-05-25 12:00:00 +1000', 'completed'
),(
  3, 1, 'Book Finder', 150.00,
  'Book Finder application for my library.', 'Ruby on Rails', '2017-05-19 15:00:00 +1000',
  '2017-05-25 12:00:00 +1000', 'completed'
),(
  4, 1, 'Recipe Blog', 200.00,
  'I need a blog for my recipes.', 'Web Application', '2017-05-18 13:00:00 +1000',
  '2017-05-25 12:00:00 +1000', 'completed'
),(
  1, 2, 'Apparel Games', 500.00,
  'A games like the Sims when people could choose the apparel for each of their avatar.', 'Node.js', '2017-05-17 12:00:00 +1000',
  '2017-05-20 12:00:00 +1000', 'completed'
),(
  2, 5, 'BI Application', 300.00,
  'I need a BI application to monitor my glass business performance.', 'Ruby on Rails', '2017-05-15 09:00:00 +1000',
  '2017-05-20 12:00:00 +1000', 'completed'
),(
  4, 4, 'Skyrim Games', 200.00,
  'A Candy Crush games for my daughter.', 'Web Application', '2017-05-20 14:00:00 +1000',
  '2017-05-25 12:00:00 +1000', NULL
),(
  1, 6, 'Stress Reliever', 1000.00,
  'I need a stress reliever apps. Open to any suggestion.', 'Anything', '2017-05-20 05:00:00 +1000',
  '2017-05-28 12:00:00 +1000', NULL
),(
  2, 4, 'Smoke Stopper', 200.00,
  'Help me build a Mobile apps to quit smoking.', 'IOS', '2017-05-18 14:00:00 +1000',
  '2017-05-29 12:00:00 +1000', NULL
),(
  2, 3, 'Badlands Games', 150.00,
  'I have a party and I would like to have a badlands games for my party.', 'PS3', '2017-05-20 14:00:00 +1000',
  '2017-05-30 12:00:00 +1000', NULL
),(
  3, 3, 'Pandamonium', 100.00,
  'An online games making Panda based product.', 'Web Application', '2017-05-18 10:00:00 +1000',
  '2017-05-25 12:00:00 +1000', NULL
),(
  4, 3, 'King of Aces', 180.00,
  'An online card games.', 'Web Application', '2017-05-12 10:00:00 +1000',
  '2017-06-12 12:00:00 +1000', NULL
),(
  3, 1, 'Wedding Crasher', 250.00,
  'An app to show me where there are weddings started.', 'IOS', '2017-05-20 14:00:00 +1000',
  '2017-05-25 12:00:00 +1000', NULL
),(
  1, 5, 'Food Tracker', 100.00,
  'I need application to track food trucks position in Melbourne.', 'Android', '2017-05-17 14:00:00 +1000',
  '2017-06-17 12:00:00 +1000', NULL
),(
  NULL, 1, 'Disney on Ice', 300.00,
  'I need a ticketing system for an event coming up on June.', 'PHP', '2017-05-01 16:00:00 +1000',
  '2017-05-30 12:00:00 +1000', NULL
),(
  NULL, 2, 'Pinocchio', 250.00,
  'GPS tracking system to check on my daughter activities.', 'IOS', '2017-05-17 20:00:00 +1000',
  '2017-06-15 12:00:00 +1000', NULL
),(
  NULL, 3, 'Score Me', 400.00,
  'An online scoring system connected to twitter for bragging my match score.', 'IOS', '2017-05-12 19:00:00 +1000',
  '2017-05-25 12:00:00 +1000', NULL
),(
  NULL, 4, 'Swordsman', 200.00,
  'I need an app to practice my sword skill.', 'Web Application', '2017-05-20 10:00:00 +1000',
  '2017-05-27 12:00:00 +1000', NULL
),(
  NULL, 5, 'Tint Precise', 1200.00,
  'My company need a VR application to allow customers choose which tint is the most suitable for their house.', 'Mobile Apps', '2017-05-20 12:00:00 +1000',
  '2017-06-30 12:00:00 +1000', NULL
),(
  NULL, 6, 'Online Pshyciatrist', 900.00,
  'A mobile app to connect clients with their phsychiatrist 24/7.', 'Mobile Apps', '2017-05-19 16:00:00 +1000',
  '2017-06-29 12:00:00 +1000', NULL
);

INSERT INTO feedbacks (
  user_id, job_id, comment, comment_type
) VALUES (
  1, 1, 'Great Developer. All on time.', 'positive'
),(
  1, 2, 'Jane is very thoughtful. She add more features than what I expected.', 'positive'
),(
  1, 3, 'Alfons apps have helped me optimise my job. I never lost a book anymore', 'positive'
),(
  1, 4, 'Keep missing when needed. Always busy with his cigarettes.', 'negative'
),(
  2, 5, 'I love the design of the outfit. Good job.', 'positive'
),(
  5, 6, 'Great problem solver. Love your work.', 'positive'
),(
  7, 1, 'Agatha always around when needed.', 'positive'
),(
  8, 2, 'Payment on time.', 'positive'
),(
  9, 3, 'Very clear in explaining problems', 'positive'
),(
  10, 4, 'Impatient customers.', 'negative'
),(
  7, 5, 'Always have a positive things to say.', 'positive'
),(
  8, 6, 'It is a company full of lovely people', 'positive'
);
