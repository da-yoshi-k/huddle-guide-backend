FactoryBot.define do
  factory :participation do
    user { nil }
    workshop { nil }
    is_active { false }
  end
end
