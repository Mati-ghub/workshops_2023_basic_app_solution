class UserMailer < ApplicationMailer

  def loan_created_email(book_loan)

    @book_title = book_loan.book.title
    @due_date = book_loan.due_date

    user_email = book_loan.user.email
    email_subject = "Potwierdzenie wypożyczenia książki: #{@book_title}"

    mail(to: user_email, subject: email_subject)
  end

  def due_date_notification_email(book_loan)
    @title = book_loan.book.title
    @due_date = book_loan.due_date
    mail(to: book_loan.user.email, subject: 'Przypomnienie: termin zwrotu książki mija jutro!')
  end

end
