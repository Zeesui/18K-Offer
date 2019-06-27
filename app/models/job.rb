class Job < ApplicationRecord

  validates :title, presence: true
  validates :company, presence: true
  validates :city, presence: true
  validates :wage_lower_bound, presence: true
  validates :wage_upper_bound, presence: true
  validates :wage_lower_bound, numericality: { greater_than: 0}

  has_many :resumes

  scope :published, -> { where(is_hidden: false) }

end
