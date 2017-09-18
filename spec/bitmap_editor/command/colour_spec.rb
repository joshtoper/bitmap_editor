require 'spec_helper'

module BitmapEditor
  module Command
    RSpec.describe Colour do
      describe '#new' do
        it 'requires x and y co-ordinates, and a colour' do
          expect { described_class.new }.to raise_error ArgumentError

          expect { described_class.new('hello') }.to raise_error ArgumentError
        end
      end

      describe '#run' do
        let(:image) { double('Image') }
        let(:command) { described_class.new(image, [1, 2, 'D']) }
        
        it 'invokes the colour method of the Image' do
          expect(image).to receive(:colour).with(1, 2, 'D').and_return true

          command.run
        end
      end
    end
  end
end
