require 'yomu'

class IndexAttachmentJob < ApplicationJob
  queue_as :default

  def perform(attachment)
    data = File.read attachment.file.path
    attachment.file_text = Yomu.read :text, data
    attachment.save
    attachment.paper.reindex
  end
end
