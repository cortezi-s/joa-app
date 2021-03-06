# frozen_string_literal: true

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
	extend Devise::Models 
  devise :database_authenticatable, :recoverable, :rememberable, authentication_keys: [ :username ]
  include DeviseTokenAuth::Concerns::User
end
