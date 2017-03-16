DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS developers;
DROP TABLE IF EXISTS requesters;
DROP TABLE IF EXISTS jobs;
DROP TABLE IF EXISTS feedbacks;

CREATE TABLE users (
  user_id SERIAL4 Primary Key,
  first_name VARCHAR(400) NOT NULL,
  last_name VARCHAR(400) NOT NULL,
  address VARCHAR(400) NOT NULL,
  suburb VARCHAR(400) NOT NULL,
  postcode INTEGER,
  country VARCHAR(400) NOT NULL,
  email VARCHAR(400) NOT NULL,
  contact_person VARCHAR(400) NOT NULL,
  paypal_account VARCHAR(400) NOT NULL,
  abn INTEGER,
  tfn INTEGER,
  password_digest VARCHAR(400) NOT NULL
);

CREATE TABLE developers (
  developer_id SERIAL4 Primary Key,
  feedback_id INTEGER,
  user_id INTEGER
);

CREATE TABLE requesters(
  requester_id SERIAL4 Primary Key,
  feedback_id INTEGER,
  user_id INTEGER
);

CREATE TABLE jobs (
  job_id SERIAL4 Primary Key,
  developer_id INTEGER,
  requester_id INTEGER,
  job_title VARCHAR(400) NOT NULL,
  reward DECIMAL(19,2),
  description TEXT,
  platform VARCHAR(200) NOT NULL,
  post_date DATE,
  due_date DATE,
  status VARCHAR(100)
);

CREATE TABLE feedbacks(
  feedback_id SERIAL4 Primary Key,
  user_id INTEGER,
  job_id INTEGER,
  comment TEXT,
  comment_type VARCHAR (100)
);
