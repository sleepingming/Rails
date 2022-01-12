# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = User.create!([
  {email: "aaa@example.com", password: '123123', password_confirmation: '123123'}
  ])

categories = Category.create!([
  {title: "frontend"},
  {title: "backend"}
  ])

tests = Test.create!([
  {title: "Rails", level: 1, category: categories[0], author: users[0]},
  {title: "HTML", level: 0, category: categories[0], author: users[0]}
  ])

questions = Question.create!([
  {body: "В каком году был создан Rails?", test: tests[0]},
  {body: "Кто является автором Rails?", test: tests[0]},
  {body: "В каком году был разработан HTML?", test: tests[1]},
  {body: "Кто является разработчиком HTML?", test: tests[1]}
  ])

answers = Answer.create!([
  {title: "2005", correct: 1, question: questions[0]},
  {title: "2001", correct: 0, question: questions[0]},
  {title: "Дэвид Ханссон", correct: 1, question: questions[1]},
  {title: "Тим Бернерс-Ли", correct: 0, question: questions[1]},
  {title: "1993", correct: 1, question: questions[2]},
  {title: "1996", correct: 0, question: questions[2]},
  {title: "Тим Бернерс-Ли", correct: 1, question: questions[3]},
  {title: "Дэвид Ханссон", correct: 0, question: questions[3]}
  ])

results = Result.create!([
  {user: users[0], test: tests[0]},
  {user: users[0], test: tests[1]}
  ])
