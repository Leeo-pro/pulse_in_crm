# frozen_string_literal: true

class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  # idカラムに乱数を格納する処理
  def set_uuid
    self.id = SecureRandom.uuid
  end
end
