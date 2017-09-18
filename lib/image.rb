module BitmapEditor
  class Image
    class InvalidWidthError < StandardError; end
    class InvalidHeightError < StandardError; end
    class InvalidColourError < StandardError; end
    class OutOfBoundsError < StandardError; end

    attr_reader :width, :height, :canvas

    ACCEPTED_WIDTH_RANGE ||= (1..250).freeze
    ACCEPTED_HEIGHT_RANGE ||= (1..250).freeze

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
      x, y = zero_index_coords(x, y)
      validate_input([x], [y], colour)
      canvas[y][x] = colour
    end

    def vertical_fill(x, y1, y2, colour)
      x, y1, y2 = zero_index_coords(x, y1, y2)
      validate_input([x], [y1, y2], colour)
      (y1..y2).each { |row| canvas[row][x] = colour }
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

    def zero_index_coords(*coords)
      coords.map { |coord| coord - 1 }
    end

    def validate_input(x, y, colour)
      check_coords_valid(x, y)
      check_colour_valid(colour)
    end

    def check_coords_valid(x, y)
      x.each { |val| raise OutOfBoundsError, 'X value invalid' if val > width }
      y.each { |val| raise OutOfBoundsError, 'Y value invalid' if val > width }
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
