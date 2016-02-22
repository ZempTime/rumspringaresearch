class Paper < ApplicationRecord
  belongs_to :user
  has_many :attachments
  accepts_nested_attributes_for :attachments, reject_if: :all_blank, allow_destroy: true
  validates_presence_of :title, :description
  enum status: [:draft, :published, :flagged]

  searchkick

  def search_data
    {
      title: title,
      description: description,
      attachment_name: attachments.map(&:name),
      attachment_description: attachments.map(&:description),
      attachment_text: attachments.map(&:file_text),
    }
  end
end
