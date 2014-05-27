class Task < ActiveRecord::Base
  include Select2Concern
  select2_white_list :status
  belongs_to :project
end
