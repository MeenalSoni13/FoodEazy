# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
 
    def example
        UserMailer.example(User.new(email: 'meenalsoni13@gmail.com'))
    end

end
