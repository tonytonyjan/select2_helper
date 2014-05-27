module Select2Concern
  extend ActiveSupport::Concern
  module ClassMethods
    include Select2Helper::Errors

    def select2_white_list *names
      @select2_white_list = names
    end

    def select2_allowed_search? column_name
      raise InvalidColumnName unless attribute_method? column_name
      @select2_white_list.include? column_name
    end
  end
end