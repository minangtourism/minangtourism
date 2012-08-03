# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

dummy_images = {
  :image_event => (open(Rails.root.join("app/assets/images/acara_wisata.jpg")) rescue nil),
  :image_folktale => (open(Rails.root.join("app/assets/images/cerita_rakyat.jpg")) rescue nil),
  :image_location_tourism => (open(Rails.root.join("app/assets/images/logo-sumbar.png")) rescue nil),
  :image_slideshow => (open(Rails.root.join("app/assets/images/slideshow.jpg")) rescue nil),
  :image_tips_trick => (open(Rails.root.join("app/assets/images/tips_wisata.jpg")) rescue nil),
  :image_tourism_article => (open(Rails.root.join("app/assets/images/berita_wisata.jpg")) rescue nil)
}

#Setting.destroy_all
#
#Setting.create(
#  key: Faker::Lorem.sentence.gsub(/\.$/, ""),
#  alt: Faker::Lorem.sentence.gsub(/\.$/, ""),
#  value: Faker::Lorem.sentence.gsub(/\.$/, "")
#)

User.destroy_all #menghapus user, jika ditambah data user baru id:integer, id = 1, (rake db:reset)
User.valid_roles.each do |role|
  User.new(
    :username => "#{role}",
    :email => "#{role}@sumbar-tourism.com",
    :password => "password",
    :password_confirmation => "password",
    :state => "enabled"
  ) do |user|
    user.roles = role
    user.save!
  end
end

admins = User.all.select do |user|
  user.is? :admin
end
operators = User.all.select do |user|
  user.is? :operator
end
members = User.all.select do |user|
  user.is? :member
end

CategoryLocTourism.destroy_all

first_category = CategoryLocTourism.create(
  :name => "Wisata Alam",
  :parent_id => nil
)

CategoryLocTourism.create([
    {:name => "Air Terjun", :parent_id => first_category.id},
    {:name => "Air Panas", :parent_id => first_category.id},
    {:name => "Bahari", :parent_id => first_category.id},
    {:name => "Bukit/Puncak", :parent_id => first_category.id},
    {:name => "Cagar Alam", :parent_id => first_category.id},
    {:name => "Danau", :parent_id => first_category.id},
    {:name => "Gunung", :parent_id => first_category.id},
    {:name => "Gua", :parent_id => first_category.id},
    {:name => "Hutan/Hutan Lindung", :parent_id => first_category.id},
    {:name => "Jembatan", :parent_id => first_category.id},
    {:name => "Lembah/Ngarai", :parent_id => first_category.id},
    {:name => "Pantai", :parent_id => first_category.id},
    {:name => "Pulau", :parent_id => first_category.id},
    {:name => "Selat", :parent_id => first_category.id},
    {:name => "Sungai", :parent_id => first_category.id},
    {:name => "Taman Nasional", :parent_id => first_category.id},
    {:name => "Taman Laut", :parent_id => first_category.id}
  ])

second_category = CategoryLocTourism.create(
  :name => "Wisata Sejarah",
  :parent_id => nil
)

CategoryLocTourism.create([
    {:name => "Benteng", :parent_id => second_category.id},
    {:name => "Gedung", :parent_id => second_category.id},
    {:name => "Keraton/Istana", :parent_id => second_category.id},
    {:name => "Makam", :parent_id => second_category.id},
    {:name => "Menara", :parent_id => second_category.id},
    {:name => "Monumen", :parent_id => second_category.id},
    {:name => "Museum", :parent_id => second_category.id},
    {:name => "Pelabuhan", :parent_id => second_category.id},
    {:name => "PLTA", :parent_id => second_category.id},
    {:name => "Prasasti/Situs", :parent_id => second_category.id},
    {:name => "Rumah", :parent_id => second_category.id},
    {:name => "Stasiun", :parent_id => second_category.id}
  ])

third_category = CategoryLocTourism.create(
  :name => "Wisata Kuliner",
  :parent_id => nil
)

CategoryLocTourism.create([
    {:name => "Cafe dan Resto", :parent_id => third_category.id},
    {:name => "Makanan Tradisional", :parent_id => third_category.id},
    {:name => "Pusat Jajanan & Makanan", :parent_id => third_category.id},
    {:name => "Pusat Oleh-Oleh", :parent_id => third_category.id}
  ])

fourth_category = CategoryLocTourism.create(
  :name => "Wisata Belanja",
  :parent_id => nil
)

CategoryLocTourism.create([
    {:name => "Pasar Seni", :parent_id => fourth_category.id},
    {:name => "Pasar Tradisional", :parent_id => fourth_category.id},
    {:name => "Pasar Modern", :parent_id => fourth_category.id}
  ])

fourth_category = CategoryLocTourism.create(
  :name => "Wisata Seni dan Budaya",
  :parent_id => nil
)

CategoryLocTourism.create([
    {:name => "Seni Pertunjukan", :parent_id => fourth_category.id},
    {:name => "Senjata Tradisional", :parent_id => fourth_category.id},
    {:name => "Tradisi Adat", :parent_id => fourth_category.id},
    {:name => "Upacara Adat", :parent_id => fourth_category.id}
  ])

fifth_category = CategoryLocTourism.create(
  :name => "Wisata Adventure",
  :parent_id => nil
)

CategoryLocTourism.create([
    {:name => "Arung Jeram", :parent_id => fifth_category.id},
    {:name => "Bungy Jumping", :parent_id => fifth_category.id},
    {:name => "Dayung dan Sky Air", :parent_id => fifth_category.id},
    {:name => "Diving dan snorkeling", :parent_id => fifth_category.id},
    {:name => "Fishing", :parent_id => fifth_category.id},
    {:name => "Flaying Fish", :parent_id => fifth_category.id},
    {:name => "Pacuan Kuda", :parent_id => fifth_category.id},
    {:name => "Panjat Tebing", :parent_id => fifth_category.id},
    {:name => "Paralayang", :parent_id => fifth_category.id},
    {:name => "Parasailing", :parent_id => fifth_category.id},
    {:name => "Surfing", :parent_id => fifth_category.id},
    {:name => "Terbang Layang", :parent_id => fifth_category.id}
  ])

sixth_category = CategoryLocTourism.create(
  :name => "Wisata Rekreasi",
  :parent_id => nil
)

CategoryLocTourism.create([
    {:name => "Alun-alun", :parent_id => sixth_category.id},
    {:name => "Kawasan Wisata", :parent_id => sixth_category.id},
    {:name => "Konservasi/Suaka Margasatwa", :parent_id => sixth_category.id},
    {:name => "Kebun Binatang", :parent_id => sixth_category.id},
    {:name => "Taman Kota", :parent_id => sixth_category.id},
    {:name => "Taman Pemancingan", :parent_id => sixth_category.id},
    {:name => "Taman Pemandian", :parent_id => sixth_category.id},
    {:name => "Taman Wisata", :parent_id => sixth_category.id},
    {:name => "Waduk", :parent_id => sixth_category.id}
  ])

seventh_category = CategoryLocTourism.create(
  :name => "Wisata Religi",
  :parent_id => nil
)

CategoryLocTourism.create([
    {:name => "Candi", :parent_id => seventh_category.id},
    {:name => "Gereja", :parent_id => seventh_category.id},
    {:name => "Klenteng", :parent_id => seventh_category.id},
    {:name => "Mesjid", :parent_id => seventh_category.id},
    {:name => "Pura", :parent_id => seventh_category.id},
    {:name => "Vihara", :parent_id => seventh_category.id}
  ])

Event.destroy_all

1.upto(5).each do |i|
  member = members[i.pred % members.count]
  member.events.create!(
    title: Faker::Lorem.sentence.gsub(/\.$/, ""),
    description: Faker::Lorem.paragraph(6),
    start_date: "2012-01-01".to_date,
    end_date: "2012-02-01".to_date,
    image: dummy_images[:image_event],
    state: "unpublished"
  )
end

Folktale.destroy_all

1.upto(5).each do |i|
  member = members[i.pred % members.count]
  member.folktales.create!(
    title: Faker::Lorem.sentence.gsub(/\.$/, ""),
    description: Faker::Lorem.paragraph(6),
    image: dummy_images[:image_folktale],
    state: "published"
  )
end

LocationTourism.destroy_all

1.upto(1).each do |i|
  admin = admins[i.pred % admins.count]
  admin.location_tourisms.create!(
    name: "Pantai Padang",
    category_loc_tourism_id: CategoryLocTourism.find_by_name("Pantai").id,
    address: "2 KM dari pusat Kota Padang",
    city: "Kota Padang",
    zip: " ",
    phone: " ",
    web: " ",
    facebook: " ",
    twitter: " ",
    hours_description: " ",
    facility: " ",
    image: dummy_images[:image_location_tourism],
    description: "Pantai Padang adalah salah satu pantai indah di sisi barat Sumatera Barat",
    state: "published"
  )
end

1.upto(1).each do |i|
  admin = admins[i.pred % admins.count]
  admin.location_tourisms.create!(
    name: "Jembatan Siti Nurbaya",
    category_loc_tourism_id: CategoryLocTourism.find_by_name("Jembatan").id,
    address: "Kota Padang",
    city: "Kota Padang",
    zip: " ",
    phone: " ",
    web: " ",
    facebook: " ",
    twitter: " ",
    hours_description: " ",
    facility: " ",
    image: dummy_images[:image_location_tourism],
    description: "Jembatan sepanjang 60 meter membentang di atas Muara Batang ini menghubungkan kota tua Padang
    dengan Taman Bukit Gunung Padang. Dari atas jembatan, pengunjung bisa melihat pemandangan Bukit Gunung Padang.
    Di Bukit itulah Siti Nurbaya dikubur, mungkin karena itu jembatan ini dinamakan Jembatan Siti Nurbaya",
    state: "published"
  )
end

Slideshow.destroy_all

1.upto(5).each do |i|
  Slideshow.create(
    title: Faker::Lorem.sentence.gsub(/\.$/, ""),
    description: Faker::Lorem.paragraph(1),
    image: dummy_images[:image_slideshow],
    state: "published"
  )
end

TipsTrick.destroy_all

1.upto(5).each do |i|
  member = members[i.pred % members.count]
  member.tips_tricks.create!(
    title: Faker::Lorem.sentence.gsub(/\.$/, ""),
    description: Faker::Lorem.paragraph(6),
    image: dummy_images[:image_tips_trick],
    state: "published"
  )
end

TourismArticle.destroy_all

1.upto(5).each do |i|
  member = members[i.pred % members.count]
  member.tourism_articles.create!(
    title: Faker::Lorem.sentence.gsub(/\.$/, ""),
    content: Faker::Lorem.paragraph(6),
    image: dummy_images[:image_tourism_article],
    state: "published"
  )
end