require 'spec_helper'

module BitmapEditor
  module Command
    RSpec.describe Create do
      describe '#new' do
        it 'requires values for width and height' do
          expect { described_class.new }.to raise_error ArgumentError
        end
      end

      describe '#run' do
        context 'with valid params' do
          let(:image) { double('Image') }
          let(:cmd) { described_class.new([10, 10]) }

          it 'instantiates a new Image object, and runs its canvas initialisation method' do
            expect(Image).to receive(:new).with(10, 10).and_return image

            expect(cmd.run).to eq true
          end
        end

        context 'with invalid params' do
          let(:image) { double('Image') }
          let(:cmd) { described_class.new([10, 10]) }

          it 'raises an exception when the specified dimensions are invalid' do
            expect(Image).to receive(:new).with(10, 10).and_raise BitmapEditor::Image::InvalidWidthError

            expect { cmd.run }.to raise_error BitmapEditor::Image::InvalidWidthError
          end
        end
      end
    end
  end
end
