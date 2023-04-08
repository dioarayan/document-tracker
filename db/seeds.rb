# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


User.destroy_all
users = User.create!([
    {
        username: "admin",
        email: "admin@test.com",
        password: "admin123",
        admin: true
    },
    {
        username: "user",
        email: "user@test.com",
        password: "user123",
        admin: false
    }
])

Doctype.destroy_all

doctypes = Doctype.create!([
    {
        name: "Travel Order"
    },
    {
        name: "Letter"
    },
    {
        name: "Activity Completion Report"
    },
])

Document.destroy_all

Document.create!([
    {
        name: "Dio Arayan",
        description: "April 17 @ Ormoc City",
        user_id: users.first,
        doctype_id: doctypes.first
    },
    {
        name: "Request conduct study",
        description: "from John Smith, Harvard University",
        user_id: users.last,
        doctype_id: doctypes.last
    },
    {
        name: "John Doe",
        description: "April 13 @ Tacloban City",
        user_id: users.first,
        doctype_id: doctypes.first
    },
    {
        name: "Capability Building Program",
        description: "August 31 @ BCDEC",
        user_id: users.first,
        doctype_id: doctypes.last
    },
])

p "Created #{User.count} Users"
p "Created #{Doctype.count} Doctypes"
p "Created #{Documents.count} Documents"