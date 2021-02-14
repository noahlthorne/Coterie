require 'faker'

User.destroy_all
Organization.destroy_all
Volunteer.destroy_all

# create admins
ActiveRecord::Base.transaction do
  20.times do
    user = User.new(name: Faker::Name.name, email: Faker::Internet.email, admin: true)
    user.save!
  end

  # create normal users
  200.times do
    user = User.new(name: Faker::Name.name, email: Faker::Internet.email, admin: false)
    user.save!
  end

  # create organizations
  20.times do
    organization = Organization.new(name: Faker::Company.name)
    organization.save!
  end

  # create volunteers
  User.all.each do |user|
    volunteer = Volunteer.new
    volunteer.user = user
    volunteer.organization = Organization.all.sample(rand(1..3)).first
    volunteer.save!
  end
end

