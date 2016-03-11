
module ArtirixDataModels::Model::AMSCompliant
  extend ActiveSupport::Concern

  included do
    include ArtirixDataModels::Model::CacheKey
    include ActiveModel::Serialization

    unless method_defined? :attributes
      alias_method :attributes, :data_hash
    end

    unless method_defined? :updated_at

      if method_defined? :_timestamp
        alias_method :updated_at, :_timestamp
      else
        attr_accessor :updated_at
      end
    end

    unless method_defined? :read_attribute_for_serialization
      define_method :read_attribute_for_serialization do |key|
        return self.send(key) if respond_to? key
        return nil
      end
    end
  end
end
