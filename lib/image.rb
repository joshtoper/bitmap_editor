module BitmapEditor
  class Image
    class InvalidWidthError < StandardError; end
    class InvalidHeightError < StandardError; end
    class InvalidColourError < StandardError; end
    class OutOfBoundsError < StandardError; end

    attr_reader :width, :height, :canvas

    ACCEPTED_WIDTH_RANGE = (1..250).freeze
    ACCEPTED_HEIGHT_RANGE = (1..250).freeze

    def initialize(width, height)
      validate_dimensions(width, height)
      @width = width
      @height = height
      initialise_canvas
    end

    ### Commands

    def clear_canvas!
      initialise_canvas
    end

    def colour(x, y, colour)
      x, y = format_coords(x, y)
      check_coords_valid(x, y)
      check_colour_valid(colour)
      canvas[y][x] = colour
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

    def format_coords(x, y)
      [x - 1, y - 1]
    end

    def check_coords_valid(x, y)
      raise OutOfBoundsError, 'X value invalid' if x > width
      raise OutOfBoundsError, 'Y co-ord invalid' if y > height
    end

    def check_colour_valid(colour)
      raise InvalidColourError, 'Colour must be a single uppercase letter' unless colour_valid?(colour)
    end

    def colour_valid?(colour)
      colour.length == 1 && colour =~ /[A-Z]/
    end

    def initialise_canvas
      @canvas = []
      height.times { canvas << Array.new(width, 'O') }
    end
  end
end
