class User < ApplicationRecord
    before_save { self.email = email.downcase }
    has_many :documents, dependent: :destroy
    has_many :handled_routes, class_name: "Route", foreign_key: :receiving_user_id
    validates :username, presence: true, uniqueness: { case_sensitive: false }, length: { minimum: 3, maximum: 25 }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, uniqueness: { case_sensitive: false }, length: { maximum: 105}, format: { with: VALID_EMAIL_REGEX }
    has_secure_password
end