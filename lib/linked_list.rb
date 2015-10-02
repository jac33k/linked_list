require_relative 'linked_list/autoload'

module LinkedList
  module_function
  def root
    @root ||= Pathname.new(__dir__).parent
  end
end
