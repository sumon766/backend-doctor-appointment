# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# This is a Ruby comment. The code below will be executed when you run `rails db:seed`.
# The code below creates a new doctor in the database.
# The `!` at the end of `create!` means that if there is an error, it will raise an exception.
# Create five doctors with different names, photos, and descriptions:
Doctor.create!(name: "Dr. John Doe", photo: "https://www.w3schools.com/howto/img_avatar.png", description: "Dr. John Doe is a board-certified physician with over 20 years of experience.")
Doctor.create!(name: "Dr. John Smith", photo: "https://www.w3schools.com/howto/img_avatar.png", description: "Dr. John Smith is a board-certified physician with over 20 years of experience.")
Doctor.create!(name: "Dr. Jane Jones", photo: "https://www.w3schools.com/howto/img_avatar.png", description: "Dr. Jane Jones is a board-certified physician with over 20 years of experience.")
Doctor.create!(name: "Dr. Jane Williams", photo: "https://www.w3schools.com/howto/img_avatar.png", description: "Dr. Jane Williams is a board-certified physician with over 20 years of experience.")
Doctor.create!(name: "Dr. John Brown", photo: "https://www.w3schools.com/howto/img_avatar.png", description: "Dr. John Brown is a board-certified physician with over 20 years of experience.")
Doctor.create!(name: "Dr. John Davis", photo: "https://www.w3schools.com/howto/img_avatar.png", description: "Dr. John Davis is a board-certified physician with over 20 years of experience.")
