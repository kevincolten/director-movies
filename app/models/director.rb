class Director < ApplicationRecord
  include ActiveModel::Validations

  has_many :movies
end
