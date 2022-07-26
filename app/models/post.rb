class Post < ApplicationRecord
  #validations
  validates :body, length: { minimu: 1, maximum: 280 }
end
