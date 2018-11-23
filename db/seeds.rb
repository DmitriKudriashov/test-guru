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
  users ||= [{first_name: 'Firstname1', last_name: 'Lastname1', login: 'login1', password: 'password1'}]
  users << {first_name: 'Firstname2', last_name: 'Lastname2', login: 'login2', password: 'password2'}
  users << {first_name: 'Firstname3', last_name: 'Lastname3', login: 'login3', password: 'password3'}
  users << {first_name: 'Firstname4', last_name: 'Lastname4', login: 'login4', password: 'password4'}
  users << {first_name: 'Firstname5', last_name: 'Lastname5', login: 'login5', password: 'password5'}
  User.create(users)
# 2) category
  categories ||= [{title: 'Category 1'}]
  categories << {title: 'Category 2'}
  categories << {title: 'Category 3'}
  categories << {title: 'Category 4'}
  categories << {title: 'Category 5'}
  categories << {title: 'Category 6'}
  categories << {title: 'Category 7'}
  Category.create(categories)
# 3) tests
  tests ||= [{title: 'Test1',  category_id: 1}]
  tests << {title: 'Test2',  category_id: 1}
  tests << {title: 'Test3',  category_id: 1}
  tests << {title: 'Test4', level: 1, category_id: 2}
  tests << {title: 'Test5', level: 1, category_id: 2}
  tests << {title: 'Test6', level: 1, category_id: 3}
  tests << {title: 'Test7', level: 2, category_id: 4}
  tests << {title: 'Test8', level: 3, category_id: 4}
  tests << {title: 'Test9', level: 3, category_id: 5}
  tests << {title: 'Test10', level: 4, category_id: 5}
  tests << {title: 'Test11', level: 4, category_id: 6}
  tests << {title: 'Test12', level: 4, category_id: 7}
  Test.create(tests)
# 4) questions
  questions ||= [{body: 'Question1', test_id: 1}]
  questions << {body: 'Question2', test_id: 1}
  questions << {body: 'Question3', test_id: 1}
  questions << {body: 'Question4', test_id: 1}
  questions << {body: 'Question5', test_id: 1}
  questions << {body: 'Question6', test_id: 2}
  questions << {body: 'Question7', test_id: 2}
  questions << {body: 'Question8', test_id: 2}
  questions << {body: 'Question9', test_id: 3}
  questions << {body: 'Question10', test_id: 3}
  questions << {body: 'Question11', test_id: 4}
  questions << {body: 'Question12', test_id: 4}
  questions << {body: 'Question13', test_id: 5}
  questions << {body: 'Question14', test_id: 5}
  questions << {body: 'Question15', test_id: 6}
  questions << {body: 'Question16', test_id: 7}
  Question.create(questions)
# 5) answers
  answers ||= [{body: 'Answer1', question_id: 1}]
  answers << {body: 'Answer 1.2', question_id: 1}
  answers << {body: 'Answer 1.1', question_id: 1}
  answers << {body: 'Answer 2.1', question_id: 2}
  answers << {body: 'Answer 2.2', question_id: 2}
  answers << {body: 'Answer 3.1', question_id: 3}
  answers << {body: 'Answer 3.2', question_id: 3}
  answers << {body: 'Answer 4.1', question_id: 4}
  answers << {body: 'Answer 4.2', question_id: 4}
  answers << {body: 'Answer 5.1', question_id: 5}
  answers << {body: 'Answer 5.2', question_id: 5}
  answers << {body: 'Answer 6.1', question_id: 6}
  answers << {body: 'Answer 6.2', question_id: 6}
  answers << {body: 'Answer 7.1', question_id: 7}
  answers << {body: 'Answer 7.2', question_id: 7}
  answers << {body: 'Answer 8.1', question_id: 8}
  answers << {body: 'Answer 8.2', question_id: 8}
  answers << {body: 'Answer 9.1', question_id: 9}
  answers << {body: 'Answer 9.2', question_id: 9}
  answers << {body: 'Answer 10.1', question_id: 10}
  answers << {body: 'Answer 10.2', question_id: 10}
  answers << {body: 'Answer 11.1', question_id: 11}
  answers << {body: 'Answer 11.2', question_id: 11}
  answers << {body: 'Answer 12.1', question_id: 12}
  answers << {body: 'Answer 12.2', question_id: 12}
  answers << {body: 'Answer 13.1', question_id: 13}
  answers << {body: 'Answer 13.2', question_id: 13}
  answers << {body: 'Answer 14.2', question_id: 14}
  answers << {body: 'Answer 14.1', question_id: 14}
  answers << {body: 'Answer 15.1', question_id: 15}
  answers << {body: 'Answer 15.2', question_id: 15}
  Answer.create(answers)
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

