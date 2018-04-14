# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(:email => 'a@asd',
	        :name_sei => '伊藤', :name_mei => '学',
            :name_kana_sei => 'イトウ', :name_kana_mei => 'マナブ',
            :birthday => '19980812', :sex => 'male',
            :postal_code => '1203455',
            :region => '東京都江東区', :street => '森下４−３−２',
            :phone => '09092839283', :customer_flg => 'false')
User.create(:email => 'a@afr',
	        :name_sei => '砂糖', :name_mei => '香奈美',
            :name_kana_sei => 'サトウ', :name_kana_mei => 'カナミ',
            :birthday => '19870323', :sex => 'female',
            :postal_code => '1201281',
            :region => '東京都麻布', :street => '北芝町４−３−２',
            :phone => '09092894757', :customer_flg => 'false')
User.create(:email => 'a@asdrff',
	        :name_sei => '田中', :name_mei => '麗華',
            :name_kana_sei => 'タナカ', :name_kana_mei => 'レイカ',
            :birthday => '19870107', :sex => 'female',
            :postal_code => '1202128',
            :region => '東京都渋谷区', :street => '森下３−４−２',
            :phone => '09092322343', :customer_flg => 'false')
User.create(:email => 'a@asfrfd',
	        :name_sei => '須藤', :name_mei => '祐介',
            :name_kana_sei => 'スドウ', :name_kana_mei => 'ユウスケ',
            :birthday => '19840813', :sex => 'male',
            :postal_code => '1221128',
            :region => '東京都足立区', :street => '錦糸町４−３−２',
            :phone => '09095769283', :customer_flg => 'false')
User.create(:email => 'a@asfrfd',
	        :name_sei => '坂東', :name_mei => '梨花',
            :name_kana_sei => 'バンドウ', :name_kana_mei => 'リカ',
            :birthday => '19951123', :sex => 'female',
            :postal_code => '1295128',
            :region => '東京都相模原市', :street => '大野台５−３−２',
            :phone => '09092987653', :customer_flg => 'false')
10.times do |n|
  Product.create(cd_title: "タイトル#{n}",
                 artist: "アーティスト#{n}",
                 price: "200#{n}",
                 label: "レーベル#{n}",
                 genre: "ジャンル#{n}",
                 stock: "5",
                 start_date: "2020040#{n}",
                 product_flg: "false")
end
10.times do |n|
  Disc.create(product_id: "#{n}", disc_name: "ディスク１")
end
5.times do |n|
  Disc.create(product_id: "#{n}", disc_name: "ディスク2")
end

3.times do |n|
  Tune.create(disc_id: "1", order: "#{n}", song_title: "ミュージック#{n}")
end
5.times do |n|
  Tune.create(disc_id: "2", order: "#{n}", song_title: "ミュージック#{n}")
end
4.times do |n|
  Tune.create(disc_id: "3", order: "#{n}", song_title: "ミュージック#{n}")
end
3.times do |n|
  Tune.create(disc_id: "4", order: "#{n}", song_title: "ミュージック#{n}")
end
5.times do |n|
  Tune.create(disc_id: "5", order: "#{n}", song_title: "ミュージック#{n}")
end
6.times do |n|
  Tune.create(disc_id: "6", order: "#{n}", song_title: "ミュージック#{n}")
end
5.times do |n|
  Tune.create(disc_id: "7", order: "#{n}", song_title: "ミュージック#{n}")
end
6.times do |n|
  Tune.create(disc_id: "8", order: "#{n}", song_title: "ミュージック#{n}")
end
3.times do |n|
  Tune.create(disc_id: "9", order: "#{n}", song_title: "ミュージック#{n}")
end
2.times do |n|
  Tune.create(disc_id: "10", order: "#{n}", song_title: "ミュージック#{n}")
end
5.times do |n|
  Tune.create(disc_id: "11", order: "#{n}", song_title: "ミュージック#{n}")
end
7.times do |n|
  Tune.create(disc_id: "12", order: "#{n}", song_title: "ミュージック#{n}")
end
3.times do |n|
  Tune.create(disc_id: "13", order: "#{n}", song_title: "ミュージック#{n}")
end
4.times do |n|
  Tune.create(disc_id: "14", order: "#{n}", song_title: "ミュージック#{n}")
end
5.times do |n|
  Tune.create(disc_id: "15", order: "#{n}", song_title: "ミュージック#{n}")
end