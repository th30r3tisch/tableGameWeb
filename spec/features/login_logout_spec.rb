require 'rails_helper'

describe "A user can" do
  before :each do
    ['user', 'admin'].each do |role|
      Role.find_or_create_by({name: role})
    end
  end

  it "register" do
    visit '/admins/sign_up'
    within("#new_admin") do
      fill_in 'Email', with: 'test@ex.com'
      fill_in 'Password', with: 'secret'
	    fill_in 'Password confirmation', with: 'secret'
    end
    click_button 'Sign up'
    expect(page).to have_content 'signed up successfully'
  end

  it "login" do
	admin = FactoryBot.create(:admin)
    visit '/admins/sign_in'
    within("#new_admin") do
      fill_in 'Email', with: 'test@ex.com'
      fill_in 'Password', with: 'secret'
    end
    click_button 'Log in'
    expect(page).to have_content 'Signed in successfully'
  end

  it "logout" do
	admin = FactoryBot.create(:admin)
   	login_as(admin, :scope => :admin)
    visit root_path
	  click_link 'Log Out'
    expect(page).to have_content 'Signed out successfully'
  end

  it "unregister" do
	admin = FactoryBot.create(:admin)
   	login_as(admin, :scope => :admin)
    visit '/admins/edit'
	  click_button 'Cancel my account'
    expect(page).to have_content ' successfully cancelled'
  end
end
