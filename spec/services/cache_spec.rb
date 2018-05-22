require 'rails_helper.rb'
require 'spec_helper'

RSpec.describe "using the expect syntax" do
  specify { expect(3).to eq(3) }
  specify { expect(3).not_to eq(4) }
  specify { expect { raise "boom" }.to raise_error("boom") }
  specify { expect { }.not_to raise_error }
end

RSpec.describe "puts item into the cache" do
  cacheService = Cache.instance
  cacheService.put('key1', 'val1')
end

RSpec.describe "gets item from the cache" do
  cacheService = Cache.instance
  val1 = cacheService.get('key1')
  specify { expect(val1).to eq('val1') }
end
