class Diy < ApplicationRecord
    serialize :materials_diy, HashSerializer
    has_many :materials
    has_many :users, through: :materials

    validates :name, presence: true, uniqueness: true
end
