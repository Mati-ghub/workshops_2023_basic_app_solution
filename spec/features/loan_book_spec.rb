require 'rails_helper'

describe 'Loan a book', type: :feature do
  let!(:user) { create(:user) }
  let!(:book) { create(:book) }

  before do
    login_as(user)

    visit books_path
  end

  context 'when user is logged in and book is available' do
    it 'allows to loan a book' do
      expect(page).to have_content(book.title)

      click_button 'Loan'
      sleep(10)

      expect(page).to have_current_path(book_path(book))
      expect(page).to have_content("Book Loan was successfully created.")
    end
  end
end

