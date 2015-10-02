module LinkedList
  module Utils
    class PrintReversed

      def initialize(stack = Stack.new)
        @stack = stack
      end

      def call(node)
        print_nodes(node)
        reversed = reverse_list(node)
        print_nodes(reversed)
      end

      private
      attr_reader :stack

      def print_nodes(node)
        print "#{node.value} --> "
        if node.next_node.nil?
          print "nil\n"
        else
          print_nodes(node.next_node)
        end
      end

      def reverse_list(node)
        stack_list(node)
        stack.to_linked_list
      end

      def stack_list(node)
        stack.push node
        if node.next_node.nil?
          return
        else
          stack_list(node.next_node)
        end
      end
    end
  end
end
