FactoryBot.define do
  factory :result do
    name { 'Introvert' }
    content { 'You are an introvert' }
    min_score { 0 }
    max_score { 20 }
  end
end
