# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

dummy_images = {
  :image_tourism_article => (open(Rails.root.join("app/assets/images/tourism_article.jpg")) rescue nil),
  :image_folktale => (open(Rails.root.join("app/assets/images/acara_wisata.jpg")) rescue nil),
  :image_tips_trick => (open(Rails.root.join("app/assets/images/tips_trik_wisata.jpg")) rescue nil),
  :image_event => (open(Rails.root.join("app/assets/images/acara.jpg")) rescue nil)
}

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

members = User.all.select do |user|
  user.is? :member
end

TourismArticle.destroy_all

1.upto(15).each do |i|
  member = members[i.pred % members.count]
  member.tourism_articles.create!(
    title: Faker::Lorem.sentence.gsub(/\.$/, ""),
    content: Faker::Lorem.paragraph(6),
    image: dummy_images[:image_tourism_article],
    state: "unpublished"
  )
end

Folktale.destroy_all

1.upto(15).each do |i|
  member = members[i.pred % members.count]
  member.folktales.create!(
    title: Faker::Lorem.sentence.gsub(/\.$/, ""),
    description: Faker::Lorem.paragraph(6),
    image: dummy_images[:image_folktale],
    state: "unpublished"
  )
end

TipsTrick.destroy_all

1.upto(15).each do |i|
  member = members[i.pred % members.count]
  member.tips_tricks.create!(
    title: Faker::Lorem.sentence.gsub(/\.$/, ""),
    description: Faker::Lorem.paragraph(6),
    image: dummy_images[:image_tips_trick],
    state: "unpublished"
  )
end

Event.destroy_all

1.upto(15).each do |i|
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