require_relative 'command_requiring_image'

module BitmapEditor
  module Command
    class Colour < CommandRequiringImage
      attr_reader :image

      def initialize(image, params)
        @image = image
        @x = params[0]
        @y = params[1]
        @colour = params[2]
        validate_params_presence
        super
      end

      def run
        image.colour(x, y, colour)
      end

      private

      attr_reader :x, :y, :colour

      def validate_params_presence
        raise ArgumentError if x.nil? || y.nil? || colour.nil?
      end
    end
  end
end
