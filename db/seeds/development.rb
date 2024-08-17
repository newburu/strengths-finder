100.times do |i|
  p i
  name = Faker::Internet.username
  user = User.new(code: name, name: name)
  strengths = Strength.all.sample(5)
  (1..5).each do |no|
    strength = UserStrength.new(no: no, user: user, strength: strengths[no-1])
    user.user_strengths << strength
  end
  user.save!
end
