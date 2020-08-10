# README

To run app:

1. First run rails "db:migrate" to create database, for This project it should create sqllit tables.
2. Once table have been created need to seed db by runing "db:seed"
3. "Rails s" to start service

To test:
using rest client can make api call bellow. Post and Put endpoint will require token to be pass in header. Token are generated based on user but since that functionality is left out there are 3 exists user with token that can be used.
"token" = {"SE5SDF5EF4A5DSF4E48", "DE4ASF8EFA5SDF4E84A", "JSHDF32FS4DG8E43ASS"}

Things you may want to cover:

- Ruby version

- System dependencies

- Configuration

- Database creation

- Database initialization

- How to run the test suite

- Services (job queues, cache servers, search engines, etc.)

- Deployment instructions

- ...
