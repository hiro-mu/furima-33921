FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials}
    email                 {Faker::Internet.free_email}
    password              {"111aaa"}
    password_confirmation {password}
    kanji_name            {Gimei.first.kanji}
    kanji_lastname        {Gimei.last.kanji}
    kana_name             {Gimei.first.katakana}
    kana_lastname         {Gimei.last.katakana}
    birthday              {"2000-01-01"}
  end
end
