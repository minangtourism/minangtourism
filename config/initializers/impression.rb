# Use this hook to configure impressionist parameters
Impressionist.setup do |config|
  # Define ORM. Could be :active_record (default) and :mongo_mapper
  # config.orm = :active_record
end

# Handling bug in rails_admin
require "impressionist/models/active_record/impression.rb"
require "impressionist/models/active_record/impressionist/impressionable.rb"
ActiveRecord::Base.send(:include, Impressionist::Impressionable)