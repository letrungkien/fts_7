# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
(1..10).each do |i|
	Subject.create(name: "subject#{i}")
end
(1..5).each do |i|
	Level.create(name: "Level#{i}")
end

(1..100).each do |i| 
  Question.create(content: "description#{i}", subject_id: i%10, level_id: i%5, answer_type: "R")
  Answer.create(content: "Answer#{i}", question_id: i, right_answer: true)
  (1..3).each do |j|
  	Answer.create(content: "Answer#{i+j*100}", question_id: i , right_answer: false)
  end
end
(101..200).each do |i| 
  Question.create(content: "description#{i}", subject_id: i%10, level_id: i%5, answer_type: "C")
  (1..2).each do |j|
  	Answer.create(content: "Answer#{i+j*100}", question_id: i , right_answer: false)
  end
  Answer.create(content: "Answer#{i}", question_id: i, right_answer: true)
  Answer.create(content: "Answer#{i}", question_id: i, right_answer: true)
end
(201..300).each do |i| 
  Question.create(content: "description#{i}", subject_id: i%10, level_id: i%5, answer_type: "T")
end
(1..50).each do |i|
  ExamQuestionDetail.create(exam_question_id: i, quantity: 5, answer_type: "T" )
end
(1..50).each do |i|
  ExamQuestionDetail.create(exam_question_id: i, quantity: 5, answer_type: "T" )
end
(1..50).each do |i|
  ExamQuestionDetail.create(exam_question_id: i, quantity: 5, answer_type: "T" )
end

(1..10).each do |i|
  (0..4).each do |j|
	  ExamQuestion.create(subject_id: "#{i}", level_id: "#{j+1}", name: "exam#{i + j*10}")
  end
end