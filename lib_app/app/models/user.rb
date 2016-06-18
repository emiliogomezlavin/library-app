class User < ActiveRecord::Base
  validates :email, uniqueness: true, presence: true
  validates :password, :first_name, :last_name, presence: true

  has_many :library_users
  has_many :libraries, through: :library_users

  has_secure_password

  def self.confirm(params)
    @user = User.find_by({email: params[:email]})
    @user.try(:authenticate, params[:password])
  end



end
