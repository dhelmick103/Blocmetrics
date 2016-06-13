admin = User.where(email: 'dhelmick103@gmail.com').first
unless admin
  admin = User.new(email: 'dhelmick103@gmail.com', password: 'password1')
  admin.skip_confirmation!
  admin.save!
end

# Create Users
20.times do
  user = User.new(
    email: Faker::Internet.email,
    password: Faker::Internet.password(10),
    )
  user.skip_confirmation!
  user.save!
end

# Create Registered Applications
20.times do
  RegisteredApplication.create!(
    name: Faker::App.name,
    url: Faker::Internet.url,
    user: User.all.sample
    )
  end

20.times do
  Event.create!(
    name: Faker::Name.name,
    registered_application: RegisteredApplication.all.sample
  )
end
