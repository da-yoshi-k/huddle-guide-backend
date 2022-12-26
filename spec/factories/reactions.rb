# == Schema Information
#
# Table name: reactions
#
#  id            :bigint           not null, primary key
#  reaction_type :integer          not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  post_id       :bigint           not null
#  user_id       :uuid             not null
#
# Indexes
#
#  index_reactions_on_post_id  (post_id)
#  index_reactions_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (post_id => posts.id)
#  fk_rails_...  (user_id => users.id)
#
FactoryBot.define do
  factory :reaction do
    user { nil }
    post { nil }
    reaction_type { 1 }
  end
end
