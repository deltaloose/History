class Book < ApplicationRecord
	validates :title, presence: true
	validates :body, presence: true
#	validate :add_error_sample


  def add_error_sample
    if title.blank?
      errors.add(:tytle, "Title can't be blank")
    end
    if body.blank?
      errors.add(:body, "Body can't be blank")
    end
  end

end
