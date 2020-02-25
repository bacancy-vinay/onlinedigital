class Fieldchoice < ApplicationRecord
  belongs_to :resume

  MAIN_FIELD = ["Accounting.", "IT", "CIVIL", "AUTOMOBILE"]
  SUB_FIELD = ["ROR DEVVELOPER","LARAVEL DEVELOPER","IOS DEVELOPER","ANDROID DEVELOPER"]
end
