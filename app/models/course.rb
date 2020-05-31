class Course < ApplicationRecord
    validates_uniqueness_of :code

    has_many :teachings, dependent: :destroy
    has_many :receivings, dependent: :destroy
    has_many :tutors, :class_name => "User", through: :teachings
    has_many :students, :class_name => "User", through: :receivings
end
