class DueDateNotificationJob
  include Sidekiq::Worker

  def perform
    BookLoan.checked_out.where(due_date: Time.zone.now..Time.zone.now + 4.minutes).each do |book_loan|
      UserMailer.due_date_notification_email(book_loan).deliver_now
    end
  end
end
