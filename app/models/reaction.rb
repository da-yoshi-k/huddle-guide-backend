class Reaction < ApplicationRecord
  belongs_to :user
  belongs_to :post

  enum reaction_type: { good: 10, me_too: 20, your_story_more: 30 }
end
