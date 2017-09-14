module BitmapEditor
  class Image
    class InvalidWidthError < StandardError; end
    class InvalidHeightError < StandardError; end
    
    attr_reader :width, :height
    
    ACCEPTED_WIDTH_RANGE = (1..250).freeze
    ACCEPTED_HEIGHT_RANGE = (1..250).freeze

    def initialize(width, height)
      validate_dimensions(width, height)
      @width = width
      @height = height
    end

    private

    def validate_dimensions(width, height)
      raise InvalidWidthError, 'Invalid width specified' unless ACCEPTED_WIDTH_RANGE.include?(width.to_i)
      raise InvalidHeightError, 'Invalid height specified' unless ACCEPTED_HEIGHT_RANGE.include?(height.to_i)
    end
  end
end
