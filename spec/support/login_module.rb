module LoginModule
  def login(user, company)
    user.skip_confirmation!
    user.save!
    visit user_login_path(company.id)
    fill_in 'user[email]', with: user.email
    fill_in 'user[password]', with: user.password
    click_button 'ログイン'
  end
end