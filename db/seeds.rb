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

# Video.create!(
#   youtube_id: 'm9WzUSyOZYE',
#   title: 'ヨネダ2000【決勝ネタ】1st Round〈ネタ順8〉M-1グランプリ2022',
#   description: '【ヨネダ2000】 https://www.m-1gp.com/combi/12971.html ◇他の決勝ネタはこちら ...',
#   thumbnail: 'https://i.ytimg.com/vi/m9WzUSyOZYE/hqdefault.jpg',
#   view_count: 4_290_000
# )

# Video.create!(
#   youtube_id: 'LkmtzH5Z91o',
#   title: 'さや香【決勝ネタ】1st Round〈ネタ順5〉M-1グランプリ2022',
#   description: '【さや香】 https://www.m-1gp.com/combi/1125.html ◇他の決勝ネタはこちら ...',
#   thumbnail: 'https://i.ytimg.com/vi/LkmtzH5Z91o/hqdefault.jpg',
#   view_count: 73_100_000
# )

# Video.create!(
#   youtube_id: 'anC1McMAycw',
#   title: 'ウエストランド【決勝ネタ】最終決戦〈ネタ順1〉M-1グランプリ2022',
#   description: '【ウエストランド】 https://www.m-1gp.com/combi/1984.html ◇他の決勝ネタはこちら ...',
#   thumbnail: 'https://i.ytimg.com/vi/anC1McMAycw/hqdefault.jpg',
#   view_count: 5_250_000
# )

# 50.times do
#   Post.create!(
#     user: User.offset(rand(User.count)).first,
#     video: Video.offset(rand(Video.count)).first
#   )
# end
