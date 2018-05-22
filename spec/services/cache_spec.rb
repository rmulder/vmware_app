require 'rails_helper.rb'
require 'spec_helper'

RSpec.describe "puts item into the cache" do
  cacheService = Cache.instance
  cacheService.put('key1', 'val1')
  specify { expect(cacheService.kind_of? Object).to eq(true) }
end

RSpec.describe "gets item from the cache" do
  cacheService = Cache.instance
  val1 = cacheService.get('key1')
  specify { expect(val1).to eq('val1') }
end
