class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  def fullname
    "#{self.name} #{self.surname}"
  end

  def admin?
    self.role == 0 ? true : false;
  end

  def editor?
    (self.role == 1 || self.role == 0) ? true : false;
  end

  def author?
    (self.role == 2 || self.role == 1 || self.role == 0) ? true : false;
  end

end
