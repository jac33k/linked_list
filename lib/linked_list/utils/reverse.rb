module LinkedList
  module Utils
    class Reverse

      def call(node)
        print_nodes(node)
        new_head = reverse_list(node)
        print_nodes new_head
      end

      private
      def print_nodes(node)
        print "#{node.value} --> "
        if node.next_node.nil?
          print "nil\n"
        else
          print_nodes(node.next_node)
        end
      end

      def reverse_list(list, previous_node = nil)
        next_node = list.next_node
        list.next_node = previous_node
        if next_node.nil?
          list
        else
          reverse_list(next_node, list)
        end
      end
    end
  end
end
