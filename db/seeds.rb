14.times do |i|
  Question.create(content: "question # #{i}")
end
56.times do |i|
  Answer.create(content: "answer # #{i}", score: i % 4 + 1)
end
56.times do |i|
  QuestionAnswer.create(question_id: i / 4 + 1, answer_id: i + 1)
end

# move to csv or whatever
results = [{ name: "More of an introvert", content: "dasfgadjkfda", min_score: 0, max_score: 13 },
           { name: "Public extrovert, private introvert", content: "jklk", min_score: 14, max_score: 27 },
           { name: "Public introvert, private extrovert", content: "oilnnhsgos", min_score: 28, max_score: 41 },
           { name: "More of an extrovert", content: "dasda", min_score: 42, max_score: 55 }]
4.times do |i|
  res = results[i]
  Result.create(name: res[:name], content: res[:content], min_score: res[:min_score], max_score: res[:max_score])
end
