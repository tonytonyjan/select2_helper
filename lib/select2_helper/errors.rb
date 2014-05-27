module Select2Helper
  module Errors
    class InvalidModel < StandardError; end
    class InvalidColumnName < StandardError; end
    class NotInWhiteList < StandardError; end
  end
end