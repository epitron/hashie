require 'spec_helper'

describe Hashie::Extensions::MergeInitializer do
  class MergeInitializerHash < Hash; include Hashie::Extensions::MergeInitializer end
  subject { MergeInitializerHash }

  it 'should initialize fine with no arguments' do
    subject.new.should eq({})
  end

  it 'should initialize with a hash' do
    subject.new(abc: 'def').should eq(abc: 'def')
  end

  it 'should initialize with a hash and a default' do
    h = subject.new({ abc: 'def' }, 'bar')
    h[:foo].should eq 'bar'
    h[:abc].should eq 'def'
  end
end
