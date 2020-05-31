class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
    
  has_many :teachings
  has_many :receivings
  has_many :tutorCourses, :class_name => "Course", through: :teachings
  has_many :studentCourses, :class_name => "Course", through: :receivings
  has_many :resumes, dependent: :destroy
end
