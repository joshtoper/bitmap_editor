module BitmapEditor
  module Command
    class Show
      attr_reader :image

      def initialize(image)
        @image = image
      end

      def run
        image.render
      end
    end
  end
end
