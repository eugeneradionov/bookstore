FactoryGirl.define do
  factory :book do
    title FFaker::Lorem.sentence
    description FFaker::Lorem.paragraph
    publication_year 2015
    price 9.99
    height 9.99
    width 9.99
    depth 9.99
    cover_url FFaker::Lorem.sentence
  end
end
