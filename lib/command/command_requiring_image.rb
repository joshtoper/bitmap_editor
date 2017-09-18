module BitmapEditor
  module Command
    class CommandRequiringImage
      class NilImageError < StandardError; end

      def initialize(*args)
        ensure_image_present
      end

      protected

      def ensure_image_present
        raise NilImageError, "you must generate an image using the command 'I X Y' prior to attempting any manipulations" if image.nil?
      end
    end
  end
end
