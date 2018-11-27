# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Пока не знаю, что тут следует заполнять более конкретно.
# Поэтому тут просто символически заполнено - как болванка для экпериментов.

# 1) users
  users = User.create([
            {first_name: 'Firstname1', last_name: 'Lastname1', login: 'login1', password: 'password1'},
            {first_name: 'Firstname2', last_name: 'Lastname2', login: 'login2', password: 'password2'},
            {first_name: 'Firstname3', last_name: 'Lastname3', login: 'login3', password: 'password3'},
            {first_name: 'Firstname4', last_name: 'Lastname4', login: 'login4', password: 'password4'},
            {first_name: 'Firstname5', last_name: 'Lastname5', login: 'login5', password: 'password5'}])
# 2) category
  categories = Category.create([
                {title: 'Category 1'}, {title: 'Category 2'}, {title: 'Category 3'},
                {title: 'Category 4'}, {title: 'Category 5'}, {title: 'Category 6'},
                {title: 'Category 7'}])
# 3) tests
  tests = Test.create([
                {title: 'Test1', category: categories[0]},
                {title: 'Test2', category: categories[0]},
                {title: 'Test3', category: categories[1]},
                {title: 'Test4', level: 1, category: categories[2]},
                {title: 'Test5', level: 1, category: categories[3]},
                {title: 'Test6', level: 1, category: categories[4]},
                {title: 'Test7', level: 2, category: categories[5]},
                {title: 'Test8', level: 3, category: categories[6]},
                ])
# 4) questions
  questions = Question.create([
                              {body: 'Question1', test: tests[0]},
                              {body: 'Question2', test: tests[0]},
                              {body: 'Question3', test: tests[1]},
                              {body: 'Question4', test: tests[1]},
                              {body: 'Question5', test: tests[2]},
                              {body: 'Question6', test: tests[2]},
                              {body: 'Question7', test: tests[3]},
                              {body: 'Question8', test: tests[3]},
                              {body: 'Question9', test: tests[4]},
                              {body: 'Question10', test: tests[4]},
                              {body: 'Question11', test: tests[5]},
                              {body: 'Question12', test: tests[5]},
                              {body: 'Question13', test: tests[6]},
                              {body: 'Question14', test: tests[6]},
                              {body: 'Question15', test: tests[7]},
                              {body: 'Question16', test: tests[7]}
                              ])
# 5) answers
  answers = Answer.create([
                          {body: 'Answer 1.1', question: questions[0]},
                          {body: 'Answer 1.2', question: questions[0]},
                          {body: 'Answer 1.1',  question: questions[1]},
                          {body: 'Answer 2.1', question: questions[1]},
                          {body: 'Answer 2.2', question: questions[2]},
                          {body: 'Answer 3.1', question: questions[2]},
                          {body: 'Answer 3.2', question: questions[3]},
                          {body: 'Answer 4.1', question: questions[3]},
                          {body: 'Answer 4.2', question: questions[4]},
                          {body: 'Answer 5.1', question: questions[4]},
                          {body: 'Answer 5.2', question: questions[5]},
                          {body: 'Answer 6.1', question: questions[5]},
                          {body: 'Answer 6.2', question: questions[6]},
                          {body: 'Answer 7.1', question: questions[6]},
                          {body: 'Answer 7.2', question: questions[7]},
                          {body: 'Answer 8.1', question: questions[7]},
                          {body: 'Answer 8.2', question: questions[8]},
                          {body: 'Answer 9.1', question: questions[8]},
                          {body: 'Answer 9.2', question: questions[9]},
                          {body: 'Answer 10.1', question: questions[9]},
                          {body: 'Answer 10.2', question: questions[9]},
                          {body: 'Answer 11.1', question: questions[10]},
                          {body: 'Answer 11.2', question: questions[10]},
                          {body: 'Answer 12.1', question: questions[11]},
                          {body: 'Answer 12.2', question: questions[11]},
                          {body: 'Answer 13.1', question: questions[12]},
                          {body: 'Answer 13.2', question: questions[12]},
                          {body: 'Answer 14.2', question: questions[13]},
                          {body: 'Answer 14.1', question: questions[13]},
                          {body: 'Answer 15.1', question: questions[14]},
                          {body: 'Answer 15.2', question: questions[14]},
                          {body: 'Answer 16.1', question: questions[15]},
                          {body: 'Answer 16.2', question: questions[15]}
                          ])
# 6) user_tests
  UserTest.create([{:value=>2, :user_id=>1, :test_id=>1},
                  {:value=>1, :user_id=>1, :test_id=>2},
                  {:value=>3, :user_id=>1, :test_id=>3},
                  {:value=>2, :user_id=>1, :test_id=>4},
                  {:value=>5, :user_id=>1, :test_id=>5},
                  {:value=>3, :user_id=>1, :test_id=>6},
                  {:value=>2, :user_id=>1, :test_id=>7},
                  {:value=>3, :user_id=>1, :test_id=>8},
                  {:value=>4, :user_id=>1, :test_id=>9},
                  {:value=>1, :user_id=>1, :test_id=>10},
                  {:value=>3, :user_id=>1, :test_id=>11},
                  {:value=>4, :user_id=>1, :test_id=>12}])

