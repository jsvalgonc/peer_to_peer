class User < ActiveRecord::Base
  enum role: [:user, :vip, :admin, :finance, :investor, :entrepreneur]
  after_initialize :set_default_role, :if => :new_record?
  has_many :investors
  has_many :entrepreneurs
  has_many :invitations

  def set_default_role
    self.role ||= :user
  end
  
  def set_default_agent
    self.agent ||= :false
  end
  
  
  def admin?
    self.role == "admin" ? true : false
  end

  def finance?
    self.role == "finance" ? true : false
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
