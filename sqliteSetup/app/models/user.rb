class User < ApplicationRecord
    validates :name, :age, :address, presence: true
    validates :email, presence: true, uniqueness: true, format: {with: URI::MailTo::EMAIL_REGEXP} 

end
