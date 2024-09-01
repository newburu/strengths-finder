20.times do |i|
  name = Faker::Internet.username
  email = Faker::Internet.email
  uid = Faker::Device.unique.serial
  user = User.new(code: name, name: name, email: email, password: "123456", uid: uid)
  strengths = Strength.all.sample(5)
  (1..5).each do |no|
    strength = UserStrength.new(no: no, user: user, strength: strengths[no-1])
    user.user_strengths << strength
  end
  user.save!
end
