
class Event # for safe_update, and Timestamp
  include Mongoid::Document

  field :start_date, :type => Timestamp
  field :end_date, :type => Timestamp

  field :password, :type => String
end

class Recipe # for Set
  include Mongoid::Document
  include MongoidExt::Filter

  language Proc.new { |d| d.language }
  filterable_keys :language

  field :ingredients, :type => Set
  field :description, :type => String
  field :language, :type => String, :default => 'en'
end

class Avatar # for Storage and File
  include Mongoid::Document
  include MongoidExt::Storage

  file_key :data

  file_list :alternatives
  file_key :first_alternative, :in => :alternatives
end

class UserConfig #for OpenStruct
  include Mongoid::Document
  field :entries, :type => OpenStruct
end

class BlogPost # for Slug and Filter
  include Mongoid::Document
  include MongoidExt::Filter
  include MongoidExt::Slugizer
  include MongoidExt::Tags

  filterable_keys :title, :body, :tags, :date
  slug_key :title, :max_length => 18, :min_length => 3, :callback_type => :before_validation, :add_prefix => true
  language :find_language

  field :title, :type => String
  field :body, :type => String
  field :tags, :type => Array
  field :date, :type => Time

  def find_language
    'en'
  end
end

class Entry
  include Mongoid::Document
  include MongoidExt::Random

  field :v, :type => Integer
end
Entry.delete_all
100.times {|v| Entry.create(:v => v)}
