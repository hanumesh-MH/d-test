# frozen_string_literal: true

require 'spec_helper'

describe 'Simple Hash' do
  before(:all) do
    @json = { a: 'b' }
    @func = value_from_key(@json, :a)
  end

  it 'Should return a string' do
    expect(@func).to be_a_kind_of(String)
  end

  it 'Should return the string b' do
    expect(@func).to match 'b'
  end
end

describe 'Example Hash 1' do
  before(:all) do
    json = { a: { b: { c: 'd' } } }
    keys = 'a.b.c'
    @func = value_from_key(json, keys)
  end

  it 'should return a string' do
    expect(@func).to match 'd'
  end
end

describe 'Example Hash 2' do
  before(:all) do
    json = { x: { y: { z: 'a' } } }
    keys = 'x.y.z'
    @func = value_from_key(json, keys)
  end

  it 'should return a string' do
    expect(@func).to match 'a'
  end
end
