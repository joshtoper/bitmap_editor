require 'spec_helper'

module BitmapEditor
  module Command
    RSpec.describe Create do
      context 'with valid params' do
        it 'creates an Image object of the specified dimensions' do
          cmd = described_class.new(5, 5)
          cmd.run
          expect(cmd.image.height).to eq 5
          expect(cmd.image.width).to eq 5
        end
      end

      context 'with invalid params' do
        it 'raises an exception when the specified width is below the allowed minimum' do
          cmd = described_class.new(Image::ACCEPTED_WIDTH_RANGE.first - 1, 10)
          expect { cmd.run }
            .to raise_error BitmapEditor::Image::InvalidWidthError
        end

        it 'raises an exception when the specified width is above the allowed minimum' do
          cmd = described_class.new(Image::ACCEPTED_WIDTH_RANGE.last + 1, 10)
          expect { cmd.run }
            .to raise_error BitmapEditor::Image::InvalidWidthError
        end

        it 'raises an exception when the specified height is below the allowed range' do
          cmd = described_class.new(10, Image::ACCEPTED_HEIGHT_RANGE.first - 1)
          expect { cmd.run }
            .to raise_error BitmapEditor::Image::InvalidHeightError
        end

        it 'raises an exception when the specified height is above the allowed range' do
          cmd = described_class.new(10, Image::ACCEPTED_HEIGHT_RANGE.last + 1)
          expect { cmd.run }
            .to raise_error BitmapEditor::Image::InvalidHeightError
        end
      end
    end
  end
end
