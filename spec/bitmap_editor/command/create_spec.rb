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
    end
  end
end
