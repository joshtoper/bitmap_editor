require_relative 'command_requiring_image'
module BitmapEditor
  module Command
    class VerticalFill < CommandRequiringImage
      attr_reader :image

      def initialize(image, params)
        @image = image
        @x = params[0]
        @y1 = params[1]
        @y2 = params[2]
        @colour = params[3]
        validate_params_presence
        super
      end

      def run
        image.vertical_fill(x, y1, y2, colour)
      end

      private
      
      attr_reader :x, :y1, :y2, :colour

      def validate_params_presence
        raise ArgumentError if x.nil? || y1.nil? || y2.nil? || colour.nil?
      end
    end
  end
end
