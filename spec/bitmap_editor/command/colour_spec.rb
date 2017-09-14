require 'spec_helper'

module BitmapEditor
  module Command
    RSpec.describe Colour do
      describe '#new' do
        it 'requires x and y co-ordinates, and a colour' do
          expect { described_class.new }.to raise_error ArgumentError
        end
      end
    end
  end
end
