users = User.create([
    {
        name: "user_1",
        token: "SE5SDF5EF4A5DSF4E48"
    },
    {
        name: "user_2",
        token: "DE4ASF8EFA5SDF4E84A"
    }
])

urls = Url.create([
    {
        o_url: "www.google.com",
        s_url: "fs6fe5e",
        active: 1,
        user: users.first
    },
    {
        o_url: "www.yahoo.com",
        s_url: "e65d3gs",
        active: 1,
        user: users.first
    }
])