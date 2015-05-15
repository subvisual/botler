require 'rails_helper'

RSpec.feature 'create a new expense' do
  def login
    login_as(create(:user))
  end

  scenario 'with valid data' do
    user = create(:user)

    login
    visit new_expense_path

    fill_form(:expense,
      name: 'Jantar',
      amount: 100,
      paid_on: Date.today,
      user: user.name
    )

    attach_file('expense_picture',
      File.join(Rails.root, 'spec', 'support', 'images', 'receipt.jpg'))

    click_on 'Create Expense'

    expect(page).to have_text 'Jantar'
  end

  scenario 'with invalid data' do
    user = create(:user)

    login
    visit new_expense_path

    fill_in 'Name', with: 'Jantar'
    select user.name, from: 'User'

    click_on 'Create Expense'

    expect(page).to have_text "can't be blank"
  end

  scenario 'not authenticated' do
    visit new_expense_path

    expect(page).to have_text 'You are not authorized to access this page.'
  end
end