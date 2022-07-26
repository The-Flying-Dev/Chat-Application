class Post < ApplicationRecord
  #validations
  validates :body, length: { minimu: 1, maximum: 280 }

  #override created_at everywhere
  def created_at
    attributes['created_at'].strftime("%m/%d/%Y %H:%M")
  end

end
