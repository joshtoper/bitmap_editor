require 'spec_helper'

module BitmapEditor
  module Command
    RSpec.describe Clear do
      describe '#new' do
        it 'requires an Image argument' do
          expect { described_class.new }.to raise_error ArgumentError
        end
      end

      describe '#run' do
        let(:image) { double('Image') }
        let(:cmd) { described_class.new(image) }

        it "invokes the image object's clear! method" do
          expect(image).to receive(:clear!).and_return true

          cmd.run
        end
      end
    end
  end
end
