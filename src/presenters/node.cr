require "json"

module Haye
  module Presenters
    class Node
      property name : String, args : Array(String)

      JSON.mapping(
        name: String,
        args: Array(String)
      )

      def initialize
        @name = ""
        @args = [] of String
      end
    end
  end
end
