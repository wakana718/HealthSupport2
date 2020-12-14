# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


    User.create!(
      email: "test1@test.com",
      name: "女性1",
      password: "123456",
      intoduction: "女性1です。よろしくお願いします。",
      profile_image: File.open('./app/assets/images/女性1.png')
    )

    User.create!(
      email: "test2@test.com",
      name: "女性2",
      password: "123456",
      intoduction: "女性2です。よろしくお願いします。",
      profile_image: File.open('./app/assets/images/女性2.png')
    )

    User.create!(
      email: "test3@test.com",
      name: "女性3",
      password: "123456",
      intoduction: "女性3です。よろしくお願いします。",
      profile_image: File.open('./app/assets/images/女性3.png')
    )

    User.create!(
      email: "test4@test.com",
      name: "女性4",
      password: "123456",
      intoduction: "女性4です。よろしくお願いします。",
      profile_image: File.open('./app/assets/images/女性4.png')
    )

    User.create!(
      email: "test5@test.com",
      name: "女性5",
      password: "123456",
      intoduction: "女性5です。よろしくお願いします。",
      profile_image: File.open('./app/assets/images/女性5.png')
    )

    User.create!(
      email: "test6@test.com",
      name: "男性1",
      password: "123456",
      intoduction: "男性1です。よろしくお願いします。",
      profile_image: File.open('./app/assets/images/男性1.png')
    )

    User.create!(
      email: "test7@test.com",
      name: "男性2",
      password: "123456",
      intoduction: "男性2です。よろしくお願いします。",
      profile_image: File.open('./app/assets/images/男性2.png')
    )

    User.create!(
      email: "test8@test.com",
      name: "男性3",
      password: "123456",
      intoduction: "男性1です。よろしくお願いします。",
      profile_image: File.open('./app/assets/images/男性3.png')
    )

    User.create!(
      email: "test9@test.com",
      name: "男性4",
      password: "123456",
      intoduction: "男性4です。よろしくお願いします。",
      profile_image: File.open('./app/assets/images/男性4.png')
    )

    User.create!(
      email: "test10@test.com",
      name: "男性5",
      password: "123456",
      intoduction: "男性5です。よろしくお願いします。",
      profile_image: File.open('./app/assets/images/男性5.png')
    )


