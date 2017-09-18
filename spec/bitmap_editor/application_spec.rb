require 'spec_helper'

module BitmapEditor
  RSpec.describe Application do
    let(:sample_files_folder) { "#{RSPEC_ROOT}/support/sample_files" }
    describe '#run' do
      context 'with valid, parseable input' do
        context 'with a basic blank canvas' do
          it 'prints the canvas to stdout' do
            expect { described_class.new.run("#{sample_files_folder}/blank_canvas.txt") }.to output(blank_canvas).to_stdout
          end
        end

        context 'with a few more commands' do
          it 'prints the canvas to stdout' do
            expect { described_class.new.run("#{sample_files_folder}/more_commands.txt") }.to output(coloured_canvas).to_stdout
          end
        end
      end

      context 'with bad input' do
        context 'when the file does not exist at the specified path' do
          it 'returns a message informing that the file was not found' do
            expect { described_class.new.run('hurr durr') }.to output("File not found\n").to_stderr
          end
        end

        context 'when the file is empty' do
          it 'returns a message informing that the file was empty' do
            expect { described_class.new.run("#{sample_files_folder}/empty.txt") }.to output("File is empty\n").to_stderr
          end
        end

        context 'when no image has been created' do
          it 'outputs an error message explaining that an image must be created before any commands be run' do
            expect { described_class.new.run("#{sample_files_folder}/no_image.txt") }
              .to output("Command 'L 1 1 D' failed - you must generate an image using the command 'I X Y' prior to attempting any manipulations\n").to_stderr
          end
        end

        context 'when the file contains invalid commands' do
          it 'outputs an error message, which includes the failing command' do
            expect { described_class.new.run("#{sample_files_folder}/invalid_commands.txt") }
              .to output("Command 'R 1 4 N' failed - specified command not supported\n").to_stderr
          end
        end

        context 'when the command contains co-ords beyond the size of the canvas' do
          it 'outputs the error message, which includes the failing command' do
            expect { described_class.new.run("#{sample_files_folder}/coords_out_of_bounds.txt") }
              .to output("Command 'L 100 100 A' failed - X value invalid\n").to_stderr
          end
        end

        context 'when an invalid colour is specified in the command' do
          it 'outputs the error message, which includes the failing command' do
            expect { described_class.new.run("#{sample_files_folder}/invalid_colour.txt") }
              .to output("Command 'L 1 1 ?' failed - colour must be a single uppercase letter\n").to_stderr
          end
        end
      end
    end

    private

    def blank_canvas
      <<~EOS
        OOOOOOOOOO
        OOOOOOOOOO
        OOOOOOOOOO
        OOOOOOOOOO
        OOOOOOOOOO
        OOOOOOOOOO
        OOOOOOOOOO
        OOOOOOOOOO
        OOOOOOOOOO
        OOOOOOOOOO
      EOS
    end

    def coloured_canvas
      <<~EOS
        OOOOO
        OOZZZ
        AWOOO
        OWOOO
        OWOOO
        OWOOO
      EOS
    end
  end
end
