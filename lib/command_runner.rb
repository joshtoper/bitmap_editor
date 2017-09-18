module BitmapEditor
  class CommandRunner
    def initialize(commands)
      @commands = commands
    end

    def run
      commands.each do |command|
        begin
          letter = command.shift
          params = command
          cmd = CommandFactory.build_command(letter, params, image)
          cmd.run
          @image = cmd.image
        rescue => e
          raise e, "Command '#{letter} #{params.join(' ')}' failed - #{e.message}"
        end
      end
    end

    private

    attr_reader :commands

    def image
      @image ||= nil
    end
  end
end
