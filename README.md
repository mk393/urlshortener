# README

This app allows users to create new short urls for any url and manage their create url by enabling and disabling them. This doesn’t allow creation of a user, users must be added manually using seed.rb. Each short url is tied to the user and they can only be modified by the user that created it. Anyone with access to a short url can use it without any authentication. This app uses sqlite for storing all of the data. Sqlite chosen since it allows it to be easily created in any computer without extra setup for testing.

To run app:

1. First run rails "db:migrate" to create database, for This project it should create sqlite tables.
2. Once table have been created need to seed db by runing "db:seed"
3. "Rails s" to start service

To test:
using rest client can make api call bellow. Post and Put endpoint will require token to be pass in header. Token are generated based on user but since that functionality is left out there are 3 exists user with token that can be used.
"token" = {"SE5SDF5EF4A5DSF4E48", "DE4ASF8EFA5SDF4E84A", "JSHDF32FS4DG8E43ASS"}

    Endpoints:
        post "api/v1/urls"
            Header:
                "token" : {token}
            Body:{
                "o_url" : "somesite.com",
                "s_url" : "sde5sfe" (Optional)
            }

        put "api/v1/urls"
            Header:
                "token" : {token}
            Body:{
                "s_url" : "sde5sfe",
                "active": {false|true}
            }

To test redirect:
You can generate new short url using api endpoints above or use one of the existing {"localhost:3000/u/fs6fe5e", "localhost:3000/u/e65d3gs", "localhost:3000/u/e6693gk"}
