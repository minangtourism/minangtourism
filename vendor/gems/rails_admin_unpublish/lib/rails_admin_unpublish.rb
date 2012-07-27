require "rails_admin_unpublish/engine"

module RailsAdminUnpublish
end

require 'rails_admin/config/actions'

module RailsAdmin
  module Config
    module Actions
      class Unpublish < Base
        RailsAdmin::Config::Actions.register(self)

        # See the Base class for more info: https://github.com/sferik/rails_admin/blob/master/lib/rails_admin/config/actions/base.rb

        # http://twitter.github.com/bootstrap/base-css.html#icons
        register_instance_option :link_icon do
          'icon-thumbs-down'
        end

        # Should the action be visible
        register_instance_option :visible? do
          authorized? && (bindings[:abstract_model] ? bindings[:abstract_model].config.with(bindings).try(:visible?) : true)
        end

        register_instance_option :authorized? do
          bindings[:controller] ? bindings[:controller].authorized?(self.authorization_key, bindings[:abstract_model], bindings[:object]) : true
        end

        # Is the action on an object scope (Example: /admin/team/1/edit)
        register_instance_option :member? do
          true
        end

        # Model scoped actions only. You will need to handle params[:bulk_ids] in controller
        register_instance_option :bulkable? do
          true
        end

        # List of methods allowed. Note that you are responsible for correctly handling them in :controller block
        register_instance_option :http_methods do
          [:get, :post]
        end

        # This block is evaluated in the context of the controller when action is called
        # You can access:
        # - @objects if you're on a model scope
        # - @abstract_model & @model_config if you're on a model or object scope
        # - @object if you're on an object scope
        register_instance_option :controller do
          Proc.new do

            if request.get?

              if @object.unpublish
                flash[:success] = t("admin.flash.successful", :name => @model_config.label, :action => t("admin.actions.unpublish.done"))
              else
                flash[:error] = t("admin.flash.error", :name => @model_config.label, :action => t("admin.actions.unpublish.done"))
              end

              redirect_to back_or_index

            elsif request.post?

              @objects = list_entries(@model_config, :unpublish)

              unpublished = @objects.select { |object| object.try(:unpublish) }
              not_unpublished = @objects - unpublished

              unpublished.each do |object|
                @auditing_adapter && @auditing_adapter.delete_object("Unpublished #{@model_config.with(:object => object).object_label}", object, @abstract_model, _current_user)
              end

              flash[:success] = t("admin.flash.successful", :name => pluralize(unpublished.count, @model_config.label), :action => t("admin.actions.unpublish.done")) unless unpublished.empty?
              flash[:error] = t("admin.flash.error", :name => pluralize(unpublished.count, @model_config.label), :action => t("admin.actions.unpublish.done")) unless not_unpublished.empty?

              redirect_to back_or_index

            end
          end
        end

      end
    end
  end
end

