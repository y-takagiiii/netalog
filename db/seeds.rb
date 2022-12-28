User.create!(
  name: "test",
  email: "test@example.com",
  password: "password",
  password_confirmation: "password"
)

10.times do
  User.create!(
    name: Faker::Name.unique.first_name,
    email: Faker::Internet.email,
    password: 'password',
    password_confirmation: 'password'
  )
end

50.times do
  Post.create!(
    user: User.offset(rand(User.count)).first
  )
end
