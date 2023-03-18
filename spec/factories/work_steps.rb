# == Schema Information
#
# Table name: work_steps
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :work_step do
    trait :waiting do
      name { '待機' }
    end

    trait :being_posted do
      name { '投稿' }
    end

    trait :presentation do
      name { '発表' }
    end

    trait :chatting do
      name { '雑談中' }
    end

    trait :closed do
      name { '終了' }
    end
  end
end
