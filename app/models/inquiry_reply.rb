class InquiryReply < ApplicationRecord
  before_create :set_uuid

  mount_uploaders :files, FilesUploader
end
