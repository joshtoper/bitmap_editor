require 'spec_helper'

module BitmapEditor
  RSpec.describe CommandFactory do
    describe '.build_command' do
      let(:image) { double('Image') }

      
      context 'with a Create command' do
        it 'builds the Create command object' do
          expect(Command::Create).to receive(:new).with([10, 10]).and_return(command = double)

          cmd = CommandFactory.build_command('I', [10, 10])
          expect(cmd).to eq command
        end
      end

      context 'with a Show command' do
        let(:command) { double('Show command') }

        it 'builds the Show command object' do
          expect(Command::Show).to receive(:new).with(image).and_return command

          cmd = CommandFactory.build_command('S', nil, image)

          expect(cmd).to eq command
        end
      end

      context 'with a Clear command' do
        let(:command) { double('Clear command') }

        it 'builds the Clear command object' do
          expect(Command::Clear).to receive(:new).with(image).and_return command

          cmd = CommandFactory.build_command('C', nil, image)

          expect(cmd).to eq command
        end
      end

      context 'with a Colour command' do
        let(:command) { double('Colour command') }

        it 'builds the Colour command object' do
          expect(Command::Colour).to receive(:new).with(image, ['1, 1, Q']).and_return command

          cmd = CommandFactory.build_command('L', ['1, 1, Q'], image)

          expect(cmd).to eq command
        end
      end

      context 'with a Horizontal Fill command' do
        let(:command) { double('Horizontal Fill command') }

        it 'builds the Horizontal Fill command object' do
          expect(Command::HorizontalFill).to receive(:new).with(image, ['1, 10, 1, Q']).and_return command

          cmd = CommandFactory.build_command('H', ['1, 10, 1, Q'], image)

          expect(cmd).to eq command
        end
      end

      context 'with a Vertical Fill command' do
        let(:command) { double('Vertical Fill command') }

        it 'builds the Vertical Fill command object' do
          expect(Command::VerticalFill).to receive(:new).with(image, ['1, 1, 10, B']).and_return command

          cmd = CommandFactory.build_command('V', ['1, 1, 10, B'], image)

          expect(cmd).to eq command
        end
      end

      context 'with an unsupported command' do
        it 'raises a CommandNotSupportedError which contains the attempted command' do
          expect { CommandFactory.build_command('J', ['1, 1, 10, A'], image) }.to raise_error CommandFactory::CommandNotSupportedError
        end
      end
    end
  end
end
