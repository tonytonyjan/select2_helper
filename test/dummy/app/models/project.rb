class Project < ActiveRecord::Base
  include Select2Concern
  select2_white_list :name
  has_many :tasks
end
