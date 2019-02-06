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

admin_id = User.all.last.id

# 2) category
categories = Category.create([{ title: 'Backend' },
                              { title: 'Frontend' },
                              { title: 'Full stack' },
                              { title: 'for debug' },
                              { title: 'Category5' },
                              { title: 'Category6' },
                              { title: 'Category7' }])

# 3) tests
tests = Test.create([{ title: 'Ruby', level: 1, category: categories[0], author_id: admin_id },
                     { title: 'Java', level: 1, category: categories[1], author_id: admin_id },
                     { title: 'HTML', level: 2, category: categories[0], author_id: admin_id },
                     { title: 'Test (for debug project)', level: 2, category: categories[2], author_id: admin_id },
                     { title: 'Test5', level: 3, category: categories[3], author_id: admin_id },
                     { title: 'Test6', level: 3, category: categories[4], author_id: admin_id },
                     { title: 'Test7', level: 4, category: categories[5], author_id: admin_id },
                     { title: 'Test8', level: 4, category: categories[6], author_id: admin_id }])
# 4) questions
questions = Question.create([{ body: 'What is Popular Framework Ruby?', test: tests[0] },
                             { body: 'Author Ruby?', test: tests[0] },

                             { body: 'What is Java?', test: tests[1] },
                             { body: 'Where use Java?', test: tests[1] },

                             { body: 'What is HTML?', test: tests[2] },
                             { body: 'What extension should have HTML documents?', test: tests[2] },

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
Answer.create([{ body: 'Ruby on Rails', question: questions[0], correct: true },
               { body: 'CakePHP', question: questions[0], correct: false },

               { body: 'Matz', question: questions[1], correct: true },
               { body: 'Jessica Alba', question: questions[1], correct: false },
               { body: 'Tom Kruz', question: questions[1], correct: false },

               { body: 'Programming language', question: questions[2], correct: true },
               { body: 'Town USA', question: questions[2], correct: false },

               { body: 'Cookings development', question: questions[3], correct: false },
               { body: 'Web developments', question: questions[3], correct: true },

               { body: 'Programming language', question: questions[4], correct: false },
               { body: 'Markup Language', question: questions[4], correct: true },

               { body: '.php or .asp', question: questions[5], correct: false },
               { body: '.txt or .doc', question: questions[5], correct: false },
               { body: '.xls or .xlm', question: questions[5], correct: false },
               { body: '.html or .htm', question: questions[5], correct: true },

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
