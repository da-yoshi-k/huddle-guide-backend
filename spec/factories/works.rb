# == Schema Information
#
# Table name: works
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :work do
    trait :finding_common_interets do
      name { "共通点探し" }
    end
    trait :good_and_new do
      name { "Good & New" }
    end
  end
end
