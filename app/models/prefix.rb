class Prefix
  include DataMapper::Resource

  property :id, Serial
  property :content, Text
end
