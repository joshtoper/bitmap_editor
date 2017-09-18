require_relative '../image'

module BitmapEditor
  module Command
    class Create
      attr_reader :image

      def initialize(params)
        @width = params[0]
        @height = params[1]
        validate_params_presence
      end

      def run
        @image = Image.new(width, height)
        true
      end

      private

      attr_reader :width, :height

      def validate_params_presence
        raise ArgumentError if width.nil? || height.nil?
      end
    end
  end
end
