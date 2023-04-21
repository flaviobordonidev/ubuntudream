puts "setting Lessons data with I18n :it :en :pt"
I18n.locale = :it
Lesson.new(name: "Quadro bello di Flavio", duration: "41", picture_author_name: "Flavio Bordoni").save
I18n.locale = :en
Lesson.last.update(name: "Nice picture by Flav")
I18n.locale = :pt
Lesson.last.update(name: "Bela pintura do Flàvio")



#User.destroy_all
#puts "setting the User data with I18n :it, :en, :pt"
puts "Zack user with 'bio' I18n :it, :en, :pt"
I18n.locale = :it
u = User.new(username: 'Zack', email: 'zack@test.abc', password: 'passwordz', password_confirmation: 'passwordz', bio: 'Questa è la mia biografia in italiano.')
u.skip_confirmation!
u.save
I18n.locale = :en
User.where(username: 'Zack').update(bio: 'This is my biography in english.')
I18n.locale = :pt
User.where(username: 'Zack').update(bio: 'Esta é a minha biografia em português.')
