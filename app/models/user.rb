class User < ApplicationRecord
    validates :title,presence: true
    validates :first_day,presence: true
    validates :last_day,presence: true
end