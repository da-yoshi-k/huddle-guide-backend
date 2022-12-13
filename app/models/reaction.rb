# == Schema Information
#
# Table name: reactions
#
#  id            :bigint           not null, primary key
#  user_id       :uuid             not null
#  post_id       :bigint           not null
#  reaction_type :integer          not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
class Reaction < ApplicationRecord
  belongs_to :user
  belongs_to :post

  enum reaction_type: { good: 10, me_too: 20, your_story_more: 30 }
end
