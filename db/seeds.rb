#encoding: utf-8

User.create(email: "anton@black-sheep.ru", password: "enlightenment", role: 0)
User.create(email: "adm@sistems.ru", password: "adm@sistems.ru", role: 0)

Page.create(title: "Миссия", short_name: "about")
Page.create(title: "Помощь", short_name: "faq")
Page.create(title: "Вакансии", short_name: "job")
Page.create(title: "Контакты", short_name: "contact")
Page.create(title: "Правила публикации", short_name: "rules")
Page.create(title: "Рекламодателям", short_name: "ads")
Page.create(title: "Правообладателям", short_name: "copyright")

Entity.import

Region.import
Region.where("code in (37, 44, 76)").each do |region|
  region.public = true
  region.save
end

Publication.import
