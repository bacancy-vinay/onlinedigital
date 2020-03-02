class Resumeuser < ApplicationRecord
  belongs_to :resume, optional: true
  PREFIX_LIST = ["Mr.", "Mrs", "Ms.", "Dr."]
end
