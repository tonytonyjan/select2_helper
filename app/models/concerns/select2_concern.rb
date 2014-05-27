module Select2Concern
  extend ActiveSupport::Concern
  included do
    after_initialize do
      self.class.instance_methods.grep(/ids=$/) do |method_name|
        self.class.send(:define_method, method_name) do |value|
          value = value.split(',') if value.is_a? String
          super value
        end
      end
    end
  end

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