require 'test_helper'

class ArtirixDataModels::AmsTest < Minitest::Test
  include ActiveModel::Serializer::Lint::Tests

  class MyModel
    include ArtirixDataModels::Model::OnlyData
    include ArtirixDataModels::Model::AMSCompliant

    attribute :name

    attribute :id # needed

    attribute :public_title, writer_visibility: :public
    attribute :private_title, reader_visibility: :private

    attribute :remember_me, :and_me, skip: :predicate
    attribute :remember_me2, :and_me2, skip: :presence

  end

  def setup
    @resource = MyModel.new name:         'name value',
                            remember_me:  'remember_me value',
                            and_me:       'and_me value',
                            remember_me2: 'remember_me2 value',
                            and_me2:      'and_me2 value'
  end

  def test_that_it_has_a_version_number
    refute_nil ::ArtirixDataModels::Ams::VERSION
  end

end
