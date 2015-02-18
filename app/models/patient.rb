class Patient < ActiveRecord::Base
  belongs_to :hospital
  has_many :meds, dependent: :destroy
end
