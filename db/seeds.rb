# frozen_string_literal: true
TestPassage.delete_all
Answer.delete_all
Question.delete_all
Test.delete_all
Category.delete_all
# User.delete_all

# 1) users
# users = User.create([{ first_name: 'Test', last_name: 'Guruproject',
#                        login: 'testguruproject@gmail.com', password: 'testguru', email: 'testguruproject@gmail.com', type: 'Admin' }])

user_id = User.all.first.id

# 2) category
categories = Category.create([{ title: 'Category1' },
                              { title: 'Category2' },
                              { title: 'Category3' },
                              { title: 'Category4' },
                              { title: 'Category5' },
                              { title: 'Category6' },
                              { title: 'Category7' }])
# 3) tests
tests = Test.create([{ title: 'Test1', level: 1, category: categories[0], author_id: user_id },
                     { title: 'Test2', level: 1, category: categories[0], author_id: user_id },
                     { title: 'Test3', level: 2, category: categories[1], author_id: user_id },
                     { title: 'Test4', level: 2, category: categories[2], author_id: user_id },
                     { title: 'Test5', level: 3, category: categories[3], author_id: user_id },
                     { title: 'Test6', level: 3, category: categories[4], author_id: user_id },
                     { title: 'Test7', level: 4, category: categories[5], author_id: user_id },
                     { title: 'Test8', level: 4, category: categories[6], author_id: user_id }])
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
Answer.create([{ body: 'Answer 1.1 correct', question: questions[0], correct: true },
               { body: 'Answer 1.2', question: questions[0], correct: false },

               { body: 'Answer 2.1', question: questions[1], correct: false },
               { body: 'Answer 2.1 correct', question: questions[1], correct: true },

               { body: 'Answer 3.1 correct', question: questions[2], correct: true },
               { body: 'Answer 3.2', question: questions[2], correct: false },

               { body: 'Answer 4.1', question: questions[3], correct: false },
               { body: 'Answer 4.2 correct', question: questions[3], correct: true },

               { body: 'Answer 5.1', question: questions[4], correct: false },
               { body: 'Answer 5.2 correct', question: questions[4], correct: true },

               { body: 'Answer 6.1 correct', question: questions[5], correct: true },
               { body: 'Answer 6.2', question: questions[5], correct: false },

               { body: 'Answer 7.1 correct', question: questions[6], correct: true },
               { body: 'Answer 7.2', question: questions[6], correct: false },

               { body: 'Answer 8.1 correct', question: questions[7], correct: true },
               { body: 'Answer 8.2', question: questions[7], correct: false },

               { body: 'Answer 9.1 correct', question: questions[8], correct: true },
               { body: 'Answer 9.2', question: questions[8], correct: false },

               { body: 'Answer 10.1', question: questions[9], correct: false },
               { body: 'Answer 10.2 correct', question: questions[9], correct: true },
               { body: 'Answer 10.3', question: questions[9], correct: false },

               { body: 'Answer 11.1 correct', question: questions[10], correct: true },
               { body: 'Answer 11.2', question: questions[10], correct: false },

               { body: 'Answer 12.1', question: questions[11], correct: false },
               { body: 'Answer 12.2 correct', question: questions[11], correct: true },

               { body: 'Answer 13.1', question: questions[12], correct: false },
               { body: 'Answer 13.2 correct', question: questions[12], correct: true },

               { body: 'Answer 14.2', question: questions[13], correct: false },
               { body: 'Answer 14.1 correct', question: questions[13], correct: true },

               { body: 'Answer 15.1', question: questions[14], correct: false },
               { body: 'Answer 15.2 correct', question: questions[14], correct: true },

               { body: 'Answer 16.1', question: questions[15], correct: false },
               { body: 'Answer 16.2 correct', question: questions[15], correct: true }])
