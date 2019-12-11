require "json"
require "./node.cr"

module Haye
  module Presenters
    class ArrayPresenter
      property nodes : Array(Node), current_node : Node?

      def initialize
        @nodes = [] of Node
        @current_node = nil
      end

      def add
        @current_node = Node.new
        @nodes << @current_node.as(Node)
      end

      def append_key(char : Char)
        if char != '\u0020'
          @current_node.as(Node).name += char
        end
      end

      def append_value(char : Char)
        @current_node.as(Node).args[
          @current_node.as(Node).args.size - 1,
        ] += char
      end

      def shift_value
        @current_node.as(Node).args << ""
      end

      def to_array
        @nodes
      end
    end
  end
end
