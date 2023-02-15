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
  search_word: 'M1グランプリ',
  youtube_id: 'LkmtzH5Z91o',
  title: 'さや香【決勝ネタ】1st Round〈ネタ順5〉M-1グランプリ2022',
  description: "【さや香】 https://www.m-1gp.com/combi/1125.html ◇他の決勝ネタはこちら ...",
  thumbnail: "https://i.ytimg.com/vi/LkmtzH5Z91o/hqdefault.jpg",
  view_count: 9094822,
)

Video.create!(
  search_word: "M1グランプリ",
  youtube_id: "m9WzUSyOZYE",
  title: "ヨネダ2000【決勝ネタ】1st Round〈ネタ順8〉M-1グランプリ2022",
  description: "【ヨネダ2000】 https://www.m-1gp.com/combi/12971.html ◇他の決勝ネタはこちら ...",
  thumbnail: "https://i.ytimg.com/vi/m9WzUSyOZYE/hqdefault.jpg",
  view_count: 5728906,
)

Video.create!(
  search_word: "M1グランプリ",
  youtube_id: "uQpMUHN_lK4",
  title: "真空ジェシカ【決勝ネタ】1st Round〈ネタ順2〉M-1グランプリ2022",
  description: "【真空ジェシカ】 https://www.m-1gp.com/combi/766.html ◇他の決勝ネタはこちら ...",
  thumbnail: "https://i.ytimg.com/vi/uQpMUHN_lK4/hqdefault.jpg",
  view_count: 3445120,
)

Video.create!(
  search_word: "M1グランプリ",
  youtube_id: "erTRp2hUSSI",
  title: "男性ブランコ【決勝ネタ】1st Round〈ネタ順6〉M-1グランプリ2022",
  description: "【男性ブランコ】 https://www.m-1gp.com/combi/1372.html ◇他の決勝ネタはこちら ...",
  thumbnail: "https://i.ytimg.com/vi/erTRp2hUSSI/hqdefault.jpg",
  view_count: 3195947,
)

Video.create!(
  search_word: "M1グランプリ",
  youtube_id: "B2IMl1Q3l_U",
  title: "ロングコートダディ【決勝ネタ】1st Round〈ネタ順4〉M-1グランプリ2022",
  description: "【ロングコートダディ】 https://www.m-1gp.com/combi/1525.html ◇他の決勝ネタはこちら ...",
  thumbnail: "https://i.ytimg.com/vi/B2IMl1Q3l_U/hqdefault.jpg",
  view_count: 3141369,
)

100.times do
  Post.create!(
    user: User.offset(rand(User.count)).first,
    video: Video.offset(rand(Video.count)).first
  )
end

2000.times do
  LaughLog.create!(
    post: Post.offset(rand(Post.count)).first,
    button_pressed_time: Random.rand(0.0..100.0)
  )
end
