# frozen_string_literal: true

class User < ApplicationRecord
  before_create :set_uuid

  has_one :access_authorization, dependent: :destroy
  accepts_nested_attributes_for :access_authorization

  belongs_to :company
  accepts_nested_attributes_for :company
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable,
    :confirmable

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[A-Z])(?=.*?\d)[a-zA-Z\d]+\z/
  validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
  validates :name,  presence: true, length: { in: 1..10 }
  validates :age,   allow_nil: true, numericality: { greater_than_or_equal_to: 10 }
  validates :password, length: { minimum: 12 },
    format: { with: VALID_PASSWORD_REGEX }, if: :password_required?
  enum role: { other: 0, admin: 1 }, _prefix: true

  def password_required?
    persisted? ? false : super
  end
end
