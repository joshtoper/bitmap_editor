require 'spec_helper'

module BitmapEditor
  module Command
    RSpec.describe HorizontalFill do
      describe '#new' do
        it 'must be instantiated with several arguments' do
          expect { described_class.new }.to raise_error ArgumentError
        end
      end

      describe '#run' do
        let(:image) { double('Image') }
        let(:command) { described_class.new(image, 1, 10, 1, 'A') }

        it "invokes the image's horizontal_fill method" do
          expect(image).to receive(:horizontal_fill)
            .with(1, 10, 1, 'A').and_return true

          command.run
        end
      end
    end
  end
end
