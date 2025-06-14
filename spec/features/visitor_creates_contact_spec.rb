require 'rails_helper'

feature "Contact creation" do
  scenario "allows access to contact page" do
    visit new_contacts_path

    expect(page).to have_content I18n.t('contacts.contact_us')
  end


scenario "allows a guest to create contact" do
  visit new_contacts_path
  fill_in :contact_email, with: 'exemp@mail.com'
  fill_in :contact_text, with: 'yooooooooooooooooooooooooo'

  click_button I18n.t('contacts.submit')
  expect(page).to have_content "Your message sent!"
end
end
