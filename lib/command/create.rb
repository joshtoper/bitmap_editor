require_relative '../image'

module BitmapEditor
  module Command
    class Create
      attr_reader :image

      def initialize(width, height)
        @width = width
        @height = height
      end

      def run
        @image = Image.new(width, height)
      end

      private

      attr_reader :width, :height
    end
  end
end
