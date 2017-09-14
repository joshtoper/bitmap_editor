module BitmapEditor
  class Image
    class InvalidWidthError < StandardError; end
    class InvalidHeightError < StandardError; end

    attr_reader :width, :height, :canvas

    ACCEPTED_WIDTH_RANGE = (1..250).freeze
    ACCEPTED_HEIGHT_RANGE = (1..250).freeze

    def initialize(width, height)
      validate_dimensions(width, height)
      @width = width
      @height = height
      initialise_canvas
    end

    def clear_canvas!
      initialise_canvas
    end

    private

    def validate_dimensions(width, height)
      raise InvalidWidthError,  invalid_width_message unless ACCEPTED_WIDTH_RANGE.include?(width.to_i)
      raise InvalidHeightError, invalid_height_message unless ACCEPTED_HEIGHT_RANGE.include?(height.to_i)
    end

    def invalid_width_message
      "Invalid width specified - must be between #{ACCEPTED_WIDTH_RANGE.first} and #{ACCEPTED_WIDTH_RANGE.last}"
    end

    def invalid_height_message
      "Invalid height specified - must be between #{ACCEPTED_HEIGHT_RANGE.first} and #{ACCEPTED_HEIGHT_RANGE.last}"
    end

    def initialise_canvas
      @canvas = []
      height.times { canvas << Array.new(width, 'O') }
    end
  end
end
