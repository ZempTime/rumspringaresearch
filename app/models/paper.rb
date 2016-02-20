class Paper < ApplicationRecord
  belongs_to :user
  has_many :attachments
  accepts_nested_attributes_for :attachments, reject_if: :all_blank, allow_destroy: true
  validates_presence_of :title, :description
  enum status: [:draft, :published, :flagged]
end
