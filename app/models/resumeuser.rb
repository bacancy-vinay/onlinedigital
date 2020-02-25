class Resumeuser < ApplicationRecord
  belongs_to :resume
  PREFIX_LIST = ["Mr.", "Mrs", "Ms.", "Dr."]
end
