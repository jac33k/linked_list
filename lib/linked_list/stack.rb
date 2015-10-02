module LinkedList
  class Stack

    def initialize
      @elements = []
    end

    def push(element)
      elements << element
    end

    def pop
      elements.pop
    end

    def to_linked_list
      elements_copy = elements.dup
      unstash(elements_copy)
    end

    private
    attr_reader :elements

    def unstash(elements)
      node = elements.pop
      if node.nil?
        return nil
      else
        Node.new(node.value, unstash(elements))
      end
    end
  end
end
