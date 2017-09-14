module BitmapEditor
  module Command
    class Clear
      attr_reader :image

      def initialize(image)
        @image = image
      end

      def run
        image.clear!
      end
    end
  end
end
