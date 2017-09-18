module BitmapEditor
  module Command
    class VerticalFill
      attr_reader :image

      def initialize(image, x, y1, y2, colour)
        @image = image
        @x = x
        @y1 = y1
        @y2 = y2
        @colour = colour
      end

      def run
        image.vertical_fill(x, y1, y2, colour)
      end

      private
      
      attr_reader :x, :y1, :y2, :colour
    end
  end
end
