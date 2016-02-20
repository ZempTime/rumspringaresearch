class Attachment < ApplicationRecord
  belongs_to :paper
  mount_uploader :file, FileUploader
  validates_presence_of :name
end
