# frozen_string_literal: true

class User < ActiveRecord::Base
  has_many :articles

  

  #  validates :email, presence: true
  #  validates :password, presence: true, length: { minimum: 6 }
  
  extend Devise::Models #added this line to extend devise model
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  include DeviseTokenAuth::Concerns::User

  

   


end
