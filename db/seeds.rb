# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = User.create!([
  {name: "Даниил", password: 123}
  ])

categories = Category.create!([
  {title: "frontend"}
  {title: "backend"}
  ])

tests = Test.create!([
  {title: "Rails", level: 1, category_id: categories[0].id, user_id: users[0].id}
  {title: "HTML", level: 0, category_id: categories[0].id, user_id: users[0].id}
  ])

questions = Question.create!([
  {title: "В каком году был создан Rails?", test_id: tests[0].id}
  {title: "Кто является автором Rails?", test_id: tests[0].id}
  {title: "В каком году был разработан HTML?", test_id: tests[1].id}
  {title: "Кто является разработчиком HTML?", test_id: tests[1].id}
  ])

answers = Answer.create!([
  {title: "2005", correct: 1, question_id: questions[0].id}
  {title: "2001", correct: 0, question_id: questions[0].id}
  {title: "Дэвид Ханссон", correct: 1, question_id: questions[1].id}
  {title: "Тим Бернерс-Ли", correct: 0, question_id: questions[1].id}
  {title: "1993", correct: 1, question_id: questions[2].id}
  {title: "1996", correct: 0, question_id: questions[2].id}
  {title: "Тим Бернерс-Ли", correct: 1, question_id: questions[3].id}
  {title: "Дэвид Ханссон", correct: 0, question_id: questions[3].id}
  ])

results = Result.create!([
  {user.id: users[0].id, test_id: tests[0].id}
  {user.id: users[0].id, test_id: tests[1].id}
  ])
