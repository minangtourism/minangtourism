# RailsAdmin config file. Generated on June 12, 2012 18:42
# See github.com/sferik/rails_admin for more informations

RailsAdmin.config do |config|

  config.authorize_with :cancan

  #  config.attr_accessible_role do
  #    _current_user.roles.first || :default
  #  end

  # If your default_local is different from :en, uncomment the following 2 lines and set your default locale here:
  # require 'i18n'
  # I18n.default_locale = :de

  config.current_user_method { current_user } # auto-generated

  # If you want to track changes on your models:
  # config.audit_with :history, User

  # Or with a PaperTrail: (you need to install it first)
  # config.audit_with :paper_trail, User

  # Set the admin name here (optional second array element will appear in a beautiful RailsAdmin red ©)
  config.main_app_name = ['Sumbar Tourism', 'Admin']
  # or for a dynamic name:
  # config.main_app_name = Proc.new { |controller| [Rails.application.engine_name.titleize, controller.params['action'].titleize] }

  config.actions do
    # root actions
    dashboard                     # mandatory
    # collection actions
    index                         # mandatory
    new
    export
    history_index
    bulk_delete
    # member actions
    show
    approve do # custom action
      # Make it visible only for specific models. You can remove this if you don't need.
      visible do
        visible? && bindings[:abstract_model].model.to_s.in?(%w[DeletionRequest])
      end
    end
    reject do # custom action
      # Make it visible only for specific models. You can remove this if you don't need.
      visible do
        visible? && bindings[:abstract_model].model.to_s.in?(%w[DeletionRequest])
      end
    end
    edit
    delete
    history_show
    show_in_app
  end

  #  config.models do
  #    # Configuration here will affect all included models in all scopes, handle with care!
  #
  #    list do
  #      # Configuration here will affect all included models in list sections (same for show, export, edit, update, create)
  #
  #      fields_of_type :date do
  #        # Configuration here will affect all date fields, in the list section, for all included models. See README for a comprehensive type list.
  #        strftime_format "%Y-%m-%d"
  #      end
  #    end
  #  end

  #  ==> Global show view settings
  # Display empty fields in show views
  # config.compact_show_view = false

  #  ==> Global list view settings
  # Number of default rows per-page:
  # config.default_items_per_page = 20

  #  ==> Included models
  # Add all excluded models here:
  # config.excluded_models = [CategoryLocTourism, Comment, Contact, Event, Folktale, LocationTourism, TipsTrick, TourismArticle, User]

  # Add models here if you want to go 'whitelist mode':
  # config.included_models = [CategoryLocTourism, Comment, Contact, Event, Folktale, LocationTourism, TipsTrick, TourismArticle, User]
  config.included_models = [
    CategoryLocTourism,
    Comment,
    Contact,
    DeletionRequest,
    Event,
    Folktale,
    Food,
    GettingThere,
    LocationTourism,
    LocationTourismRevision,
    Profile,
    Setting,
    Slideshow,
    SumbarContent,
    ThingsToDo,
    ThingsToSee,
    TipsTrick,
    TourismArticle,
    TourismArticleRevision,
    Transportation,
    User,
    WhereToStay,
    WhySumbar,
  ]

  # Application wide tried label methods for models' instances
  # config.label_methods << :description # Default is [:name, :title]

  #  ==> Global models configuration
  # config.models do
  #   # Configuration here will affect all included models in all scopes, handle with care!
  #
  #   list do
  #     # Configuration here will affect all included models in list sections (same for show, export, edit, update, create)
  #
  #     fields_of_type :date do
  #       # Configuration here will affect all date fields, in the list section, for all included models. See README for a comprehensive type list.
  #     end
  #   end
  # end
  #
  #  ==> Model specific configuration
  # Keep in mind that *all* configuration blocks are optional.
  # RailsAdmin will try his best to provide the best defaults for each section, for each field.
  # Try to override as few things as possible, in the most generic way. Try to avoid setting labels for models and attributes, use ActiveRecord I18n API instead.
  # Less code is better code!
  # config.model MyModel do
  #   # Cross-section field configuration
  #   object_label_method :name     # Name of the method called for pretty printing an *instance* of ModelName
  #   label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
  #   label_plural 'My models'      # Same, plural
  #   weight -1                     # Navigation priority. Bigger is higher.
  #   parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
  #   navigation_label              # Sets dropdown entry's name in navigation. Only for parents!
  #   # Section specific configuration:
  #   list do
  #     filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
  #     items_per_page 100    # Override default_items_per_page
  #     sort_by :id           # Sort column (default is primary key)
  #     sort_reverse true     # Sort direction (default is true for primary key, last created first)
  #     # Here goes the fields configuration for the list view
  #   end
  # end

  # Your model's configuration, to help you get started:

  # All fields marked as 'hidden' won't be shown anywhere in the rails_admin unless you mark them as visible. (visible(true))

  config.model DeletionRequest do

    # Found associations:
    configure :item
    configure :user

    # Found columns:
    configure :id
    configure :reason do
      hide
    end
    configure :state, :enum do

    end
    configure :created_at, :datetime
    configure :updated_at, :datetime

    # Sections:
    list do
      include_fields :id, :item, :user, :reason, :state
    end
    show do
      include_fields :id, :item, :user, :reason, :state
    end
    edit do
      include_fields :id, :item, :user, :reason, :state
    end
  end

  config.model User do

    object_label_method do
      :email
    end

    configure :tourism_articles, :has_many_association
    configure :events, :has_many_association
    configure :folktales, :has_many_association
    configure :tips_tricks, :has_many_association
    configure :location_tourisms, :has_many_association
    configure :comments, :has_many_association   
    configure :id, :integer
    configure :email, :string
    configure :password, :password         
    configure :password_confirmation, :password        
    configure :reset_password_token, :string     
    configure :reset_password_sent_at, :datetime
    configure :remember_created_at, :datetime
    configure :sign_in_count, :integer
    configure :current_sign_in_at, :datetime
    configure :last_sign_in_at, :datetime
    configure :current_sign_in_ip, :string
    configure :last_sign_in_ip, :string
    configure :created_at, :datetime
    configure :updated_at, :datetime  
    list do
      field :id
      field :state
      field :username
      field :email
      field :roles do
        pretty_value do
          value.map do |role|
            role.to_s.humanize
          end.to_sentence
        end
      end
    end
    export do; end
    show do
      field :id
      field :state
      field :username
      field :email
      field :roles do
        pretty_value do
          value.map do |role|
            role.to_s.humanize
          end.to_sentence
        end
      end
    end
    edit do
      field :username
      field :email
      field :password
      field :password_confirmation
      field :roles do
        visible do
          visible && !read_only
        end
        render do
          bindings[:view].render "custom_form_field_user_roles", field: self, form: bindings[:form]
          #          bindings[:form].select("roles", bindings[:object].roles_enum, {}, { :multiple => true })
        end
      end
      field :state, :enum
    end
    create do; end
    update do; end
  end

  config.model Profile do
    configure :user, :belongs_to_association   
    configure :id, :integer
    configure :name, :string
    configure :sex, :string
    configure :birthday, :date
    configure :about, :text
    configure :work, :text
    configure :phone, :string
    configure :address, :text
    configure :city, :string
    configure :website, :string
    configure :facebook, :string
    configure :twitter, :string
    configure :user_id, :integer        
    configure :created_at, :datetime
    configure :updated_at, :datetime
    configure :image_file_name, :string         
    configure :image_content_type, :string         
    configure :image_file_size, :integer         
    configure :image_updated_at, :datetime         
    configure :image, :paperclip   
    list do
      field :id
      field :name
      field :phone
      field :user
      field :image
    end
    export do; end
    show do
      field :id
      field :name
      field :sex
      field :birthday do
        strftime_format "%A, %d %B %Y"
      end
      field :about
      field :work
      field :phone
      field :address
      field :city
      field :website
      field :facebook
      field :twitter
      field :user
      field :image
    end
    edit do
      field :name
      field :sex, :enum
      field :birthday
      field :about
      field :work
      field :phone
      field :address
      field :city
      field :website
      field :facebook
      field :twitter
      field :user
      field :image
    end
    create do; end
    update do; end
  end

  config.model Slideshow do
    configure :id,                  :integer
    configure :title,               :string
    configure :description,         :text
    configure :state,               :string
    configure :created_at,          :datetime
    configure :updated_at,          :datetime
    configure :image_file_name,     :string
    configure :image_content_type,  :string
    configure :image_file_size,     :integer
    configure :image_updated_at,    :datetime
    configure :image,               :paperclip
    list do
      field :id
      field :state
      field :title
      field :image
    end
    export do; end
    show do
      field :id
      field :state
      field :title
      field :description
      field :image
    end
    edit do
      field :title
      field :description
      field :image
      field :state, :enum
    end
    create do; end
    update do; end
  end
  
  config.model CategoryLocTourism do
    configure :parent, :belongs_to_association
    configure :children, :has_many_association
    configure :location_tourisms, :has_many_association   
    configure :id, :integer
    configure :name, :string
    configure :created_at, :datetime
    configure :updated_at, :datetime
    configure :parent_id, :integer         
    configure :lft, :integer
    configure :rgt, :integer   
    list do
      field :id
      field :name
      field :parent
      field :children
      field :created_at do
        strftime_format "%A, %d %B %Y"
      end
      field :updated_at do
        strftime_format "%A, %d %B %Y"
      end
    end
    export do; end
    show do
      field :id
      field :name
      field :parent
      field :children
    end
    edit do
      field :name
      field :parent
    end
    create do; end
    update do; end
  end

  config.model LocationTourismRevision do
    # Found associations:
    configure :category_loc_tourism, :belongs_to_association
    configure :location_tourism, :belongs_to_association
    configure :user, :belongs_to_association   #   # Found columns:
    configure :id, :integer
    configure :name, :string
    configure :address, :text
    configure :city, :string
    configure :zip, :integer
    configure :phone, :string
    configure :web, :string
    configure :facebook, :string
    configure :twitter, :string
    configure :hours_description, :text
    configure :facility, :text
    configure :description, :text
    configure :category_loc_tourism_id, :integer         # Hidden
    configure :locations_tourism_id, :integer         # Hidden
    configure :user_id, :integer         # Hidden
    configure :created_at, :datetime
    configure :updated_at, :datetime
    configure :image_file_name, :string         # Hidden
    configure :image_content_type, :string         # Hidden
    configure :image_file_size, :integer         # Hidden
    configure :image_updated_at, :datetime         # Hidden
    configure :image, :paperclip   #   # Sections:
    list do
      field :id
      field :state
      field :name
      field :address
      field :city
      field :category_loc_tourism
      field :location_tourism
      field :user
      field :image
      field :created_at do
        strftime_format "%A, %d %B %Y"
      end
      field :updated_at do
        strftime_format "%A, %d %B %Y"
      end
    end
    export do; end
    show do
      field :id
      field :state
      field :name
      field :category_loc_tourism
      field :location_tourism
      field :address
      field :city
      field :zip
      field :phone
      field :web
      field :facebook
      field :twitter
      field :hours_description
      field :facility
      field :description
      field :user
      field :image
    end
    edit do
      field :name
      field :category_loc_tourism
      field :location_tourism
      field :address
      field :city
      field :zip
      field :phone
      field :web
      field :facebook
      field :twitter
      field :hours_description
      field :facility
      field :description, :text do
        ckeditor do
          true
        end
      end
      field :user do
        visible do
          bindings[:view].current_user.is?(:admin)
        end
      end
      field :image
      field :created_at do
        strftime_format "%A, %d %B %Y"
      end
      field :updated_at do
        strftime_format "%A, %d %B %Y"
      end
      field :state, :enum
    end
    create do; end
    update do; end
  end

  config.model Comment do
    configure :comments, :has_many_association
    configure :user, :belongs_to_association   #   # Found columns:
    configure :id, :integer
    configure :comment, :text
    configure :commentable_id, :integer         # Hidden
    configure :commentable_type, :string
    configure :user_id, :integer         # Hidden
    configure :created_at, :datetime
    configure :updated_at, :datetime   #   # Sections:
    list do
      field :id
      field :state
      field :comment
      field :commentable_type
      field :user
      field :created_at do
        strftime_format "%A, %d %B %Y"
      end
      field :updated_at do
        strftime_format "%A, %d %B %Y"
      end
    end
    export do; end
    show do
      field :id
      field :state
      field :comment
      field :commentable_type
      field :user
    end
    edit do
      field :comment, :text do
        ckeditor do
          true
        end
      end
      field :user do
        visible do
          bindings[:view].current_user.is?(:admin)
        end
      end
      field :state, :enum
    end
    create do; end
    update do; end
  end

  config.model Contact do
    configure :id, :integer
    configure :name, :string
    configure :email, :string
    configure :phone, :string
    configure :message, :text
    configure :created_at, :datetime
    configure :updated_at, :datetime   #   # Sections:
    list do
      field :id
      field :name
      field :email
      field :phone
      field :message
      field :created_at do
        strftime_format "%A, %d %B %Y"
      end
      field :updated_at do
        strftime_format "%A, %d %B %Y"
      end
    end
    export do; end
    show do
      field :id
      field :name
      field :email
      field :phone
      field :message
    end
    edit do; end
    create do
      field :name
      field :email
      field :phone
      field :message, :text do
        ckeditor do
          true
        end
      end
    end
    update do; end
  end

  config.model Event do
    configure :user, :belongs_to_association
    configure :comments, :has_many_association   #   # Found columns:
    configure :id, :integer
    configure :title, :string
    configure :description, :text
    configure :start_date, :date
    configure :end_date, :date
    configure :user_id, :integer         # Hidden
    configure :created_at, :datetime
    configure :updated_at, :datetime
    configure :image_file_name, :string         # Hidden
    configure :image_content_type, :string         # Hidden
    configure :image_file_size, :integer         # Hidden
    configure :image_updated_at, :datetime         # Hidden
    configure :image, :paperclip   #   # Sections:
    list do
      field :id
      field :state
      field :title
      field :description
      field :start_date
      field :end_date
      field :user
      field :created_at do
        strftime_format "%A, %d %B %Y"
      end
      field :updated_at do
        strftime_format "%A, %d %B %Y"
      end
      field :image
      field :comments
    end
    export do; end
    show do
      field :id
      field :state
      field :title
      field :description
      field :start_date
      field :end_date
      field :user
      field :created_at do
        strftime_format "%A, %d %B %Y"
      end
      field :updated_at do
        strftime_format "%A, %d %B %Y"
      end
      field :image
      field :comments
    end
    edit do;
      field :title
      field :description, :text do
        ckeditor do
          true
        end
      end
      field :user do
        visible do
          bindings[:view].current_user.is?(:admin)
        end
      end
      field :start_date
      field :end_date
      field :image
      field :state, :enum
    end
    create do
    end
    update do
    end
  end

  config.model Folktale do
    configure :user, :belongs_to_association   #   # Found columns:
    configure :id, :integer
    configure :title, :string
    configure :description, :text
    configure :user_id, :integer         # Hidden
    configure :created_at, :datetime
    configure :updated_at, :datetime
    configure :image_file_name, :string         # Hidden
    configure :image_content_type, :string         # Hidden
    configure :image_file_size, :integer         # Hidden
    configure :image_updated_at, :datetime         # Hidden
    configure :image, :paperclip   #   # Sections:
    list do
      field :id
      field :state
      field :title
      field :description
      field :user
      field :created_at do
        strftime_format "%A, %d %B %Y"
      end
      field :updated_at do
        strftime_format "%A, %d %B %Y"
      end
      field :image
    end
    export do; end
    show do
      field :id
      field :state
      field :title
      field :description
      field :user
      field :image
    end
    edit do
      field :title
      field :description, :text do
        ckeditor do
          true
        end
      end
      field :user do
        visible do
          bindings[:view].current_user.is?(:admin)
        end
      end
      field :image
      field :created_at do
        strftime_format "%A, %d %B %Y"
      end
      field :updated_at do
        strftime_format "%A, %d %B %Y"
      end
      field :state, :enum
    end
    create do; end
    update do; end
  end

  config.model LocationTourism do
    # Found associations:
    configure :category_loc_tourism, :belongs_to_association
    configure :user, :belongs_to_association   #   # Found columns:
    configure :id, :integer
    configure :name, :string
    configure :address, :text
    configure :city, :string
    configure :zip, :integer
    configure :phone, :string
    configure :web, :string
    configure :facebook, :string
    configure :twitter, :string
    configure :hours_description, :text
    configure :facility, :text
    configure :description, :text
    configure :category_loc_tourism_id, :integer         # Hidden
    configure :user_id, :integer         # Hidden
    configure :created_at, :datetime
    configure :updated_at, :datetime
    configure :image_file_name, :string         # Hidden
    configure :image_content_type, :string         # Hidden
    configure :image_file_size, :integer         # Hidden
    configure :image_updated_at, :datetime         # Hidden
    configure :image, :paperclip   #   # Sections:
    list do
      field :id
      field :state
      field :name
      #      field :access_state
      field :address
      field :city
      field :category_loc_tourism
      field :user
      field :image
      field :created_at do
        strftime_format "%A, %d %B %Y"
      end
      field :updated_at do
        strftime_format "%A, %d %B %Y"
      end
    end
    export do; end
    show do
      field :id
      field :state
      field :name
      field :category_loc_tourism
      field :address
      field :city
      field :zip
      field :phone
      field :web
      field :facebook
      field :twitter
      field :hours_description
      field :facility
      field :description
      field :user
      field :image
      field :updater
    end
    edit do
      field :name
      field :category_loc_tourism
      field :address
      field :city
      field :zip
      field :phone
      field :web
      field :facebook
      field :twitter
      field :hours_description
      field :facility
      field :description, :text do
        ckeditor do
          true
        end
      end
      field :user do
        visible do
          bindings[:view].current_user.is?(:admin)
        end
      end
      field :updater do
        visible do
          bindings[:view].current_user.is?(:admin)
        end
      end
      field :image
      field :created_at do
        strftime_format "%A, %d %B %Y"
      end
      field :updated_at do
        strftime_format "%A, %d %B %Y"
      end
      field :state, :enum
    end
    create do; end
    update do; end
  end
  
  config.model TipsTrick do
    # Found associations:
    configure :user, :belongs_to_association   #   # Found columns:
    configure :id, :integer
    configure :title, :string
    configure :description, :text
    configure :user_id, :integer         # Hidden
    configure :created_at, :datetime
    configure :updated_at, :datetime
    configure :image_file_name, :string         # Hidden
    configure :image_content_type, :string         # Hidden
    configure :image_file_size, :integer         # Hidden
    configure :image_updated_at, :datetime         # Hidden
    configure :image, :paperclip   #   # Sections:
    list do
      field :id
      field :state
      field :title
      field :description
      field :user
      field :created_at do
        strftime_format "%A, %d %B %Y"
      end
      field :updated_at do
        strftime_format "%A, %d %B %Y"
      end
      field :image
    end
    export do; end
    show do
      field :id
      field :state
      field :title
      field :description
      field :user
      field :created_at do
        strftime_format "%A, %d %B %Y"
      end
      field :updated_at do
        strftime_format "%A, %d %B %Y"
      end
      field :image
    end
    edit do
      field :title
      field :description, :text do
        ckeditor do
          true
        end
      end
      field :user do
        visible do
          bindings[:view].current_user.is?(:admin)
        end
      end
      field :image
      field :state, :enum
    end
    create do; end
    update do; end
  end
  
  config.model TourismArticle do
    # Found associations:
    configure :user, :belongs_to_association   #   # Found columns:
    configure :id, :integer
    configure :title, :string
    configure :content, :text
    configure :created_at, :datetime
    configure :updated_at, :datetime
    configure :image_file_name, :string         # Hidden
    configure :image_content_type, :string         # Hidden
    configure :image_file_size, :integer         # Hidden
    configure :image_updated_at, :datetime         # Hidden
    configure :image, :paperclip
    configure :user_id, :string         # Hidden   #   # Sections:
    list do
      field :id
      field :state
      field :title
      field :content
      field :user
      field :image
      field :created_at do
        strftime_format "%A, %d %B %Y"
      end
      field :updated_at do
        strftime_format "%A, %d %B %Y"
      end
    end
    export do; end
    show do
      field :id
      field :state
      field :title
      field :content
      field :user
      field :image
      field :created_at do
        strftime_format "%A, %d %B %Y"
      end
      field :updated_at do
        strftime_format "%A, %d %B %Y"
      end
    end
    edit do
      field :title
      field :content, :text do
        ckeditor do
          true
        end
      end
      field :user do
        visible do
          bindings[:view].current_user.is?(:admin)
        end
      end
      field :image
      field :state, :enum
    end
    create do; end
    update do; end
  end

  config.model TourismArticleRevision do
    # Found associations:
    configure :user, :belongs_to_association   #   # Found columns:
    configure :tourism_article, :belongs_to_association   #   # Found columns:
    configure :id, :integer
    configure :title, :string
    configure :content, :text
    configure :created_at, :datetime
    configure :updated_at, :datetime
    configure :image_file_name, :string         # Hidden
    configure :image_content_type, :string         # Hidden
    configure :image_file_size, :integer         # Hidden
    configure :image_updated_at, :datetime         # Hidden
    configure :image, :paperclip
    configure :user_id, :string         # Hidden   #   # Sections:
    configure :tourism_article_id, :string         # Hidden   #   # Sections:
    list do
      field :id
      field :state
      field :tourism_article
      field :title
      field :content
      field :user
      field :image
      field :created_at do
        strftime_format "%A, %d %B %Y"
      end
      field :updated_at do
        strftime_format "%A, %d %B %Y"
      end
    end
    export do; end
    show do
      field :id
      field :state
      field :tourism_article
      field :title
      field :content
      field :user
      field :image
      field :created_at do
        strftime_format "%A, %d %B %Y"
      end
      field :updated_at do
        strftime_format "%A, %d %B %Y"
      end
    end
    edit do
      field :title
      field :tourism_article
      field :content, :text do
        ckeditor do
          true
        end
      end
      field :user do
        visible do
          bindings[:view].current_user.is?(:admin)
        end
      end
      field :image
      field :state, :enum
    end
    create do; end
    update do; end
  end

  config.model WhySumbar do
    # Found associations:
    configure :id, :integer
    configure :title, :string
    configure :content, :text         # Hidden
    configure :type, :string         # Hidden
    configure :created_at, :datetime
    configure :updated_at, :datetime   #   # Sections:
    configure :image_file_name, :string         # Hidden
    configure :image_content_type, :string         # Hidden
    configure :image_file_size, :integer         # Hidden
    configure :image_updated_at, :datetime         # Hidden
    configure :image, :paperclip
    configure :user_id, :string
    list do
      field :id
      field :title
      field :content
      field :user
      field :type
      field :image
      field :created_at do
        strftime_format "%A, %d %B %Y"
      end
      field :updated_at do
        strftime_format "%A, %d %B %Y"
      end
    end
    export do; end
    show do
      field :id
      field :title
      field :content
      field :user
      field :type
      field :image
    end
    edit do
      field :title
      field :content
      field :user
      field :type
      field :image
    end
    create do; end
    update do; end
  end

  config.model GettingThere do
    # Found associations:
    configure :id, :integer
    configure :title, :string
    configure :content, :text         # Hidden
    configure :type, :string         # Hidden
    configure :created_at, :datetime
    configure :updated_at, :datetime   #   # Sections:
    configure :image_file_name, :string         # Hidden
    configure :image_content_type, :string         # Hidden
    configure :image_file_size, :integer         # Hidden
    configure :image_updated_at, :datetime         # Hidden
    configure :image, :paperclip
    configure :user_id, :string
    list do
      field :id
      field :title
      field :content
      field :user
      field :type
      field :image
      field :created_at do
        strftime_format "%A, %d %B %Y"
      end
      field :updated_at do
        strftime_format "%A, %d %B %Y"
      end
    end
    export do; end
    show do
      field :id
      field :title
      field :content
      field :user
      field :type
      field :image
    end
    edit do
      field :title
      field :content
      field :user
      field :type
      field :image
    end
    create do; end
    update do; end
  end

  config.model WhereToStay do
    # Found associations:
    configure :id, :integer
    configure :title, :string
    configure :content, :text         # Hidden
    configure :type, :string         # Hidden
    configure :created_at, :datetime
    configure :updated_at, :datetime   #   # Sections:
    configure :image_file_name, :string         # Hidden
    configure :image_content_type, :string         # Hidden
    configure :image_file_size, :integer         # Hidden
    configure :image_updated_at, :datetime         # Hidden
    configure :image, :paperclip
    configure :user_id, :string
    list do
      field :id
      field :title
      field :content
      field :user
      field :type
      field :image
      field :created_at do
        strftime_format "%A, %d %B %Y"
      end
      field :updated_at do
        strftime_format "%A, %d %B %Y"
      end
    end
    export do; end
    show do
      field :id
      field :title
      field :content
      field :user
      field :type
      field :image
    end
    edit do
      field :title
      field :content
      field :user
      field :type
      field :image
    end
    create do; end
    update do; end
  end

  config.model ThingsToDo do
    # Found associations:
    configure :id, :integer
    configure :title, :string
    configure :content, :text         # Hidden
    configure :type, :string         # Hidden
    configure :created_at, :datetime
    configure :updated_at, :datetime   #   # Sections:
    configure :image_file_name, :string         # Hidden
    configure :image_content_type, :string         # Hidden
    configure :image_file_size, :integer         # Hidden
    configure :image_updated_at, :datetime         # Hidden
    configure :image, :paperclip
    configure :user_id, :string
    list do
      field :id
      field :title
      field :content
      field :user
      field :type
      field :image
      field :created_at do
        strftime_format "%A, %d %B %Y"
      end
      field :updated_at do
        strftime_format "%A, %d %B %Y"
      end
    end
    export do; end
    show do
      field :id
      field :title
      field :content
      field :user
      field :type
      field :image
    end
    edit do
      field :title
      field :content
      field :user
      field :type
      field :image
    end
    create do; end
    update do; end
  end

  config.model ThingsToSee do
    # Found associations:
    configure :id, :integer
    configure :title, :string
    configure :content, :text         # Hidden
    configure :type, :string         # Hidden
    configure :created_at, :datetime
    configure :updated_at, :datetime   #   # Sections:
    configure :image_file_name, :string         # Hidden
    configure :image_content_type, :string         # Hidden
    configure :image_file_size, :integer         # Hidden
    configure :image_updated_at, :datetime         # Hidden
    configure :image, :paperclip
    configure :user_id, :string
    list do
      field :id
      field :title
      field :content
      field :user
      field :type
      field :image
      field :created_at do
        strftime_format "%A, %d %B %Y"
      end
      field :updated_at do
        strftime_format "%A, %d %B %Y"
      end
    end
    export do; end
    show do
      field :id
      field :title
      field :content
      field :user
      field :type
      field :image
    end
    edit do
      field :title
      field :content
      field :user
      field :type
      field :image
    end
    create do; end
    update do; end
  end

  config.model Food do
    # Found associations:
    configure :id, :integer
    configure :title, :string
    configure :content, :text         # Hidden
    configure :type, :string         # Hidden
    configure :created_at, :datetime
    configure :updated_at, :datetime   #   # Sections:
    configure :image_file_name, :string         # Hidden
    configure :image_content_type, :string         # Hidden
    configure :image_file_size, :integer         # Hidden
    configure :image_updated_at, :datetime         # Hidden
    configure :image, :paperclip
    configure :user_id, :string
    list do
      field :id
      field :title
      field :content
      field :user
      field :type
      field :image
      field :created_at do
        strftime_format "%A, %d %B %Y"
      end
      field :updated_at do
        strftime_format "%A, %d %B %Y"
      end
    end
    export do; end
    show do
      field :id
      field :title
      field :content
      field :user
      field :type
      field :image
    end
    edit do
      field :title
      field :content
      field :user
      field :type
      field :image
    end
    create do; end
    update do; end
  end

  config.model Transportation do
    # Found associations:
    configure :id, :integer
    configure :title, :string
    configure :content, :text         # Hidden
    configure :type, :string         # Hidden
    configure :created_at, :datetime
    configure :updated_at, :datetime   #   # Sections:
    configure :image_file_name, :string         # Hidden
    configure :image_content_type, :string         # Hidden
    configure :image_file_size, :integer         # Hidden
    configure :image_updated_at, :datetime         # Hidden
    configure :image, :paperclip
    configure :user_id, :string
    list do
      field :id
      field :title
      field :content
      field :user
      field :type
      field :image
      field :created_at do
        strftime_format "%A, %d %B %Y"
      end
      field :updated_at do
        strftime_format "%A, %d %B %Y"
      end
    end
    export do; end
    show do
      field :id
      field :title
      field :content
      field :user
      field :type
      field :image
    end
    edit do
      field :title
      field :content
      field :user
      field :type
      field :image
    end
    create do; end
    update do; end
  end

  config.model Setting do
    configure :key, :string
    configure :alt, :string
    configure :value, :text
    list do
      field :id
      field :key
      field :alt
      field :value
    end
    export do; end
    show do
      field :id
      field :key
      field :alt
      field :value
    end
    edit do
      field :key
      field :alt
      field :value
    end
    create do; end
    update do; end
  end

end