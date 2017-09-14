require 'spec_helper'
module BitmapEditor
  RSpec.describe Image do
    describe '#new' do
      context 'with valid params' do
        it 'instantiates a new image object' do
          image = described_class.new(10, 10)

          expect(image.width).to eq 10
          expect(image.height).to eq 10
          expect(image.canvas).to eq canvas(10, 10)
        end
      end

      context 'with invalid params' do
        it 'raises an exception when the specified width is below the allowed minimum' do
          expect { described_class.new(described_class::ACCEPTED_WIDTH_RANGE.first - 1, 10) }
            .to raise_error BitmapEditor::Image::InvalidWidthError
        end

        it 'raises an exception when the specified width is above the allowed minimum' do
          expect { described_class.new(described_class::ACCEPTED_WIDTH_RANGE.last + 1, 10) }
            .to raise_error BitmapEditor::Image::InvalidWidthError
        end

        it 'raises an exception when the specified height is below the allowed range' do
          expect { described_class.new(10, described_class::ACCEPTED_HEIGHT_RANGE.first - 1) }
            .to raise_error BitmapEditor::Image::InvalidHeightError
        end

        it 'raises an exception when the specified height is above the allowed range' do
          expect { described_class.new(10, Image::ACCEPTED_HEIGHT_RANGE.last + 1) }
            .to raise_error BitmapEditor::Image::InvalidHeightError
        end
      end
    end
    
    describe '#clear_canvas!' do
      it 'rebuilds the canvas' do
        image = described_class.new(20, 20)
        image.canvas[0][0] = 'R'
        image.clear_canvas!
        
        expect(image.canvas).to match_array canvas(20, 20)
      end
    end

    describe '#colour' do
      let(:image) { described_class.new(20, 20) }

      context 'with valid params' do
        it 'fills the specified pixel with the specified colour value' do
          image.colour(1, 1, 'X')
          expect(image.canvas[0][0]).to eq 'X'
        end
      end

      context 'with invalid params' do
        it 'raises an OutOfBoundsError when trying to try outside of the canvas' do
          expect { image.colour(100, 1, 'X') }
            .to raise_error BitmapEditor::Image::OutOfBoundsError
        end

        it 'raises an InvalidColourError when the specified colour is invalid' do
          expect { image.colour(1, 1, 'archibald') }
            .to raise_error BitmapEditor::Image::InvalidColourError
        end
      end
    end



    private

    def canvas(width, height)
      arr = []
      height.times { arr << Array.new(width, 'O') }
      arr
    end
  end
end
