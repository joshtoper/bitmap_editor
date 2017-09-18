require 'spec_helper'

module BitmapEditor
  RSpec.describe CommandRunner do
    describe '#new' do
      it 'requires a commands argument' do
        expect { described_class.new }.to raise_error ArgumentError
      end
    end

    describe '#run' do
      context 'with valid input' do
        let(:generator) { described_class.new(valid_input) }
        it 'executes each command' do
          expect(CommandFactory).to receive(:build_command).with('I', %w(10 10), nil).and_return(create_command = double)
          expect(create_command).to receive(:run).and_return true
          expect(create_command).to receive(:image).and_return(image = double)

          expect(CommandFactory).to receive(:build_command).with('L', %w(1 3 A), image).and_return(colour_command = double)
          expect(colour_command).to receive(:run).and_return true
          expect(colour_command).to receive(:image).and_return(image)

          generator.run
        end
      end
    end

    private

    def valid_input
      [%w(I 10 10), %w(L 1 3 A)]
    end
  end
end
