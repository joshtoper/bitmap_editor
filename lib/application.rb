module BitmapEditor
  class Application
    class FileNotFoundError < StandardError; end
    class InvalidFileTypeError < StandardError
      def message
        'File is either empty or of an invalid type - please supply only text files.'
      end
    end

    def run(file_path)
      load_input_file(file_path)
      split_commands
      run_commands
    rescue => e
      $stderr.puts e.message
    end

    private

    attr_reader :file, :commands

    def load_input_file(file_path)
      do_file_checks(file_path)
      @file = File.open(file_path, 'r')
    end

    def split_commands
      lines = file.read.split("\n")
      @commands = lines.map { |line| line.strip.squeeze(' ').split(/ /) }
    end

    def run_commands
      CommandRunner.new(commands).run
    end

    def do_file_checks(file_path)
      raise FileNotFoundError, "File '#{file_path}' not found" unless File.file?(file_path)
      mime_type = `file --mime -b #{file_path}`.chomp
      raise InvalidFileTypeError unless mime_type.include?('text/plain;')
    end
  end
end
