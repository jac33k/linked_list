module LinkedList
  module Utils
    class FloydsCheck

      def call(node)
        circular?(node)
      end

      private
      def circular?(node)
        tortoise = hare = node

        while true
          return false if hare.next_node.nil? || hare.next_node.next_node.nil?
          hare = hare.next_node.next_node

          tortoise = tortoise.next_node

          if hare == tortoise
            return true
          end
        end
      end
    end
  end
end
