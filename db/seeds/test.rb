puts "setting Lessons data with I18n :it :en :pt"
I18n.locale = :it
Lesson.new(name: "Quadro bello di Flavio", duration: "41", picture_author_name: "Flavio Bordoni").save
I18n.locale = :en
Lesson.last.update(name: "Nice picture by Flav")
I18n.locale = :pt
Lesson.last.update(name: "Bela pintura do Flàvio")
