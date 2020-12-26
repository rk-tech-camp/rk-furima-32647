FactoryBot.define do
  factory :user do
    nick_name             {"test"}
    email                 {Faker::Internet.free_email}  
    password              {"0000aa"}
		password_confirmation {"0000aa"}
		first_name            {"高坂"}
		last_name             {"竜"}
		fname_kana            {"カナ"}
		lname_kana            {"カナ"}
		birthday              {"2000-01-01"}




  end
end