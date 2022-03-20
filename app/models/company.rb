class Company < ApplicationRecord
  # idカラムに乱数を格納する処理
  before_create SetUuidCallbacks.new
  has_many :users
end
