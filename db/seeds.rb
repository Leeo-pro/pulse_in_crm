# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

5.times do |i|

  user = User.new(
    email: "test_user#{i}@example.com", # sample: test_user1@example.com
    name: "テストuser#{i}",
    password: 'Password0123456789',
    company_id: SecureRandom.uuid,
    company_attributes:
      {
        name: "company#{i}",
        email: "company#{i}@example.com"
      }
  )

  user.skip_confirmation! # deviseの確認メールをスキップ
  user.save!
end

admin = Admin.new(
  email: 'test_admin@example.com',
  name: 'テストadmin1',
  password: 'Password0123456789'
)

admin.skip_confirmation! # deviseの確認メールをスキップ
admin.save!

5.times do |i|

  privacy_policy = PrivacyPolicy.new(
    company_id: Company.find_by(name: "company#{i}").id,
    content: "プライバシーポリシー雛形#{i}"
  )

  privacy_policy.save!
end
