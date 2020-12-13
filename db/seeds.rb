require 'faker'

5.times do
  Author.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name,
                gender: %w[male female].sample, birthday: Faker::Date.between(from: '1990-09-23', to: '2001-09-25'))
end
