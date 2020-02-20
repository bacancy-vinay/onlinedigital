class Address < ApplicationRecord
    belongs_to :resume ,optional: true
    belongs_to :business,optional: true


  
end
