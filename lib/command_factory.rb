module BitmapEditor
  class CommandFactory
    class CommandNotSupportedError < StandardError; end

    def self.build_command(command, params = nil, image = nil)
      case command
      when 'I'
        Command::Create.new(params)
      when 'S'
        Command::Show.new(image)
      when 'C'
        Command::Clear.new(image)
      when 'L'
        Command::Colour.new(image, params)
      when 'V'
        Command::VerticalFill.new(image, params)
      when 'H'
        Command::HorizontalFill.new(image, params)
      else
        raise CommandNotSupportedError, "specified command not supported"
      end
    end
  end
end
