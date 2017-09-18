require_relative 'command_requiring_image'

module BitmapEditor
  module Command
    class HorizontalFill < CommandRequiringImage
      attr_reader :image

      def initialize(image, params)
        @image = image
        @x1 = params[0]
        @x2 = params[1]
        @y = params[2]
        @colour = params[3]
        validate_params_presence
        super
      end

      def run
        image.horizontal_fill(x1, x2, y, colour)
      end

      private

      attr_reader :x1, :x2, :y, :colour

      def validate_params_presence
        raise ArgumentError if x1.nil? || x2.nil? || y.nil? || colour.nil?
      end
    end
  end
end
