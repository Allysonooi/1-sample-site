if Record.count < 100
  100.times do
    Record.create!(
      name: Faker::Name.name,
      email: Faker::Internet.email,
      created_at: Faker::Time.between(DateTime.now - 30, DateTime.now)
    )
  end
end
