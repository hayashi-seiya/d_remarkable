FactoryBot.define do
  factory :attraction do
    park
    name "スペースマウンテン"
    duration_time 10
    waiting_time 120
    fastpass_flag true
    business_hours_open "10:00:00"
    business_hours_close "21:00:00"
  end
end
