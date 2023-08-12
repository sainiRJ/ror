class User < ApplicationRecord
    validates :name, presence: true
    validates :email, presence: true, uniqueness: true 
    validates :age, presence: true
    validates :address, presence: true
end
