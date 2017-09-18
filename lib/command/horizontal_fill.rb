module BitmapEditor
  module Command
    class HorizontalFill
      attr_reader :image

      def initialize(image, x1, x2, y, colour)
        @image = image
        @x1 = x1
        @x2 = x2
        @y = y
        @colour = colour
      end

      def run
        image.horizontal_fill(x1, x2, y, colour)
      end

      private

      attr_reader :x1, :x2, :y, :colour
    end
  end
end
