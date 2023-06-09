# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


User.destroy_all
User.create!([
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
    },
    {
        username: "dio",
        email: "dio@test.com",
        password: "dio123",
        admin: false
    }
])

Category.destroy_all

Category.create!([
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

Status.destroy_all

Status.create!([
    {
        statusName: "pending"
    },
    {
        statusName: "processing"
    },
    {
        statusName: "completed"
    }
])

Division.destroy_all

Division.create!([
    {
        name: "Office of the Schools Division Superintendent"
    },
    {
        name: "Schools Governance Operations Division"
    },
    {
        name: "Curriculum Implementation Division"
    }
])

Section.destroy_all

Section.create!([
    {
        division_id: 1,
        name: "Office of the SDS-Proper"
    },
    {
        division_id: 1,
        name: "Office of the ASDS"
    },
    {
        division_id: 1,
        name: "Records"
    },
    {
        division_id: 2,
        name: "Office of the CES_SGOD"
    },
    {
        division_id: 2,
        name: "School Monitoring and Management Evaluation"
    },
    {
        division_id: 3,
        name: "Office of the CES-CID",
    },
    {
        division_id: 3,
        name: "Learning Resource Management"
    }
])

p "Created #{User.count} Users"
p "Created #{Category.count} Category"
p "Created #{Status.count} Status"
p "Created #{Division.count} Division"
p "Created #{Section.count} Section"