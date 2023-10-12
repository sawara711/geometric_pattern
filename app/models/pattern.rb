class Pattern < ApplicationRecord
  # association
  belongs_to :user

  # ActiveStorage association
  has_one_attached :picture
  
  with_options presence: true do
    validates :title
    validates :picture
  end

end
