# frozen_string_literal: true

# 1) users
users = User.create([{ first_name: 'Firstname1', last_name: 'Lastname1',
                       login: 'login1', password: 'password1', email: 'a1@b.c' }])
users.each do |t|
  t.email = "#{t.first_name}.#{t.last_name}@gmail.com"
  t.save
end

# 2) category
categories = Category.create([{ title: 'Category 1' },
                              { title: 'Category 2' },
                              { title: 'Category 3' },
                              { title: 'Category 4' },
                              { title: 'Category 5' },
                              { title: 'Category 6' },
                              { title: 'Category 7' }])
# 3) tests
tests = Test.create([{ title: 'Test1', level: 1, category: categories[0], author_id: 1 },
                     { title: 'Test2', level: 1, category: categories[0], author_id: 1 },
                     { title: 'Test3', level: 2, category: categories[1], author_id: 1 },
                     { title: 'Test4', level: 2, category: categories[2], author_id: 1 },
                     { title: 'Test5', level: 3, category: categories[3], author_id: 1 },
                     { title: 'Test6', level: 3, category: categories[4], author_id: 1 },
                     { title: 'Test7', level: 4, category: categories[5], author_id: 1 },
                     { title: 'Test8', level: 4, category: categories[6], author_id: 1 }])
# 4) questions
questions = Question.create([{ body: 'Question1', test: tests[0] },
                             { body: 'Question2', test: tests[0] },
                             { body: 'Question3', test: tests[1] },
                             { body: 'Question4', test: tests[1] },
                             { body: 'Question5', test: tests[2] },
                             { body: 'Question6', test: tests[2] },
                             { body: 'Question7', test: tests[3] },
                             { body: 'Question8', test: tests[3] },
                             { body: 'Question9', test: tests[4] },
                             { body: 'Question10', test: tests[4] },
                             { body: 'Question11', test: tests[5] },
                             { body: 'Question12', test: tests[5] },
                             { body: 'Question13', test: tests[6] },
                             { body: 'Question14', test: tests[6] },
                             { body: 'Question15', test: tests[7] },
                             { body: 'Question16', test: tests[7] }])
# 5) answers
Answer.create([{ body: 'Answer 1.1', question: questions[0] },
               { body: 'Answer 1.2', question: questions[0] },
               { body: 'Answer 1.1', question: questions[1] },
               { body: 'Answer 2.1', question: questions[1] },
               { body: 'Answer 2.2', question: questions[2] },
               { body: 'Answer 3.1', question: questions[2] },
               { body: 'Answer 3.2', question: questions[3] },
               { body: 'Answer 4.1', question: questions[3] },
               { body: 'Answer 4.2', question: questions[4] },
               { body: 'Answer 5.1', question: questions[4] },
               { body: 'Answer 5.2', question: questions[5] },
               { body: 'Answer 6.1', question: questions[5] },
               { body: 'Answer 6.2', question: questions[6] },
               { body: 'Answer 7.1', question: questions[6] },
               { body: 'Answer 7.2', question: questions[7] },
               { body: 'Answer 8.1', question: questions[7] },
               { body: 'Answer 8.2', question: questions[8] },
               { body: 'Answer 9.1', question: questions[8] },
               { body: 'Answer 9.2', question: questions[9] },
               { body: 'Answer 10.1', question: questions[9] },
               { body: 'Answer 10.2', question: questions[9] },
               { body: 'Answer 11.1', question: questions[10] },
               { body: 'Answer 11.2', question: questions[10] },
               { body: 'Answer 12.1', question: questions[11] },
               { body: 'Answer 12.2', question: questions[11] },
               { body: 'Answer 13.1', question: questions[12] },
               { body: 'Answer 13.2', question: questions[12] },
               { body: 'Answer 14.2', question: questions[13] },
               { body: 'Answer 14.1', question: questions[13] },
               { body: 'Answer 15.1', question: questions[14] },
               { body: 'Answer 15.2', question: questions[14] },
               { body: 'Answer 16.1', question: questions[15] },
               { body: 'Answer 16.2', question: questions[15] }])
