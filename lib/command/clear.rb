require_relative 'command_requiring_image'

module BitmapEditor
  module Command
    class Clear < CommandRequiringImage
      attr_reader :image

      def initialize(image)
        @image = image
        super
      end

      def run
        image.clear!
      end
    end
  end
end
