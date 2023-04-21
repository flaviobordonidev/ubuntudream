#User.destroy_all
#puts "setting the User data with I18n :it, :en, :pt"
puts "Zack user with 'bio' I18n :it, :en, :pt"
I18n.locale = :it
User.find_or_create_by!(email: 'zack@test.abc') do |user|
  user.username = "Zack"
  user.password = "passwordz"
  user.password_confirmation = "passwordz"
end
#u = User.new(username: 'Zack', email: 'zack@test.abc', password: 'passwordz', password_confirmation: 'passwordz', bio: 'Questa è la mia biografia in italiano.')
#u.skip_confirmation!
#u.save
I18n.locale = :en
User.where(email: 'zack@test.abc').update(bio: 'This is my biography in english.')
I18n.locale = :pt
User.where(email: 'zack@test.abc').update(bio: 'Esta é a minha biografia em português.')
