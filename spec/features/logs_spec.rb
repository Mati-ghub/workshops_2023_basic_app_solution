require 'rails_helper'

describe 'Displays logs', type: :feature do
  let!(:user) { create(:user) }
  let!(:book) { create(:book) }

  before do
    expect(FetchLogsFromSideApp).to receive(:get_logs) {
      [{"id"=>5,
      "user_id"=>"7",
      "data"=>{"id"=>35, "status"=>"checked_out", "due_date"=>"2023-10-28T14:11:51.009+02:00", "book_id"=>9, "user_id"=>7, "created_at"=>"2023-10-28T14:06:51.017+02:00", "updated_at"=>"2023-10-28T14:06:51.017+02:00"},
      "created_at"=>"2023-10-28T12:06:51.055Z",
      "updated_at"=>"2023-10-28T12:06:51.055Z"}]
    }

    login_as(user)

    visit logs_path
  end

  context 'when user is logged in and book is available' do
    it 'allows to see logs' do
      expect(page).to have_content('Id')
      expect(page).to have_content('User_id')
    end
  end
end

