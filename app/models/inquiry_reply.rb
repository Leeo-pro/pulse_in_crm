class InquiryReply < ApplicationRecord
  mount_uploaders :files, FilesUploader
end
