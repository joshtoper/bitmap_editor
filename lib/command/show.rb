require_relative 'command_requiring_image'

module BitmapEditor
  module Command
    class Show < CommandRequiringImage
      attr_reader :image

      def initialize(image)
        @image = image
        super
      end

      def run
        image.render
      end
    end
  end
end
