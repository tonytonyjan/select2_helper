class Project < ActiveRecord::Base
  include Select2Concern
  select2_white_list :name
  has_many :tasks

  def task_ids= value
    value = value.split(',') if value.is_a? String
    super value
  end
end
