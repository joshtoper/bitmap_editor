module BitmapEditor
  module Command
    class Colour
      attr_reader :image

      def initialize(image, x, y, colour)
        @image = image
        @x = x
        @y = y
        @colour = colour
      end

      def run
        image.colour(x, y, colour)
      end

      private

      attr_reader :x, :y, :colour
    end
  end
end
