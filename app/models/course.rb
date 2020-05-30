class Course < ApplicationRecord
    has_many :teachings
    has_many :receivings
    has_many :tutors, :class_name => "User", through: :teachings
    has_many :students, :class_name => "User", through: :receivings
end
