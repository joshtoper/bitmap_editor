require 'spec_helper'

module BitmapEditor
  module Command
    RSpec.describe Show do
      describe '#run' do
        let(:image) { double('Image') }
        let(:command) { described_class.new(image) }

        it "invokes the image's render method" do
          expect(image).to receive(:render)

          command.run
        end
      end
    end
  end
end
