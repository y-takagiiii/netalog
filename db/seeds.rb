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

Video.create!(
  youtube_id: '7lCDEYXw3mM',
  title: 'Google I/O 101: Q&A On Using Google APIs',
  description: 'Antonio Fuentes speaks to us and takes questions on working with Google APIs and OAuth 2.0.',
  thumbnail: 'https://i.ytimg.com/vi/7lCDEYXw3mM/hqdefault.jpg',
  view_count: 0
)

50.times do
  Post.create!(
    user: User.offset(rand(User.count)).first,
    video: Video.offset(rand(Video.count)).first
  )
end
