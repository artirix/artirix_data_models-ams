# ArtirixDataModels::Ams

[![Gem Version](https://badge.fury.io/rb/artirix_data_models-ams.svg)](http://badge.fury.io/rb/artirix_data_models-ams)
[![Build Status](https://travis-ci.org/artirix/artirix_data_models-ams.svg?branch=master)](https://travis-ci.org/artirix/artirix_data_models-ams)


This gems adds the module `ArtirixDataModels::Model::AMSCompliant`

important: loading this gem will require `artirix_data_models` and `active_model_serializers`.

## Usage

include the module in your ADM model.

```ruby
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
```

In order to work properly, the model has to define:

- *`id`*
- *`updated_at`* or *`_timestamp`*
