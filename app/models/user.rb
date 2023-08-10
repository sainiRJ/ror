class User
  include Mongoid::Document
  include Mongoid::Timestamps
  field :name, type: String
  field :age, type: String
  field :email, type: String
  field :address, type: String
end
