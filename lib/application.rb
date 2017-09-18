module BitmapEditor
  class Application
    class FileNotFoundError < StandardError; end
    class EmptyFileError < StandardError; end

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
      raise FileNotFoundError, "File '#{file_path}' not found" unless File.file?(file_path)
      @file = File.open(file_path, "r")
    end

    def split_commands
      lines = file.read.split("\n")
      raise EmptyFileError, 'File is empty' if lines.empty?
      @commands = lines.map { |line| line.split(/ /) }
    end

    def run_commands
      CommandRunner.new(commands).run
    end
  end
end
