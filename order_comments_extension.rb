# Uncomment this if you reference any of your controllers in activate
# require_dependency 'application'

class OrderCommentsExtension < Spree::Extension
  version "1.0"
  description "Describe your extension here"
  url "http://yourwebsite.com/order_comments"

  # Please use order_comments/config/routes.rb instead for extension routes.

  def self.require_gems(config)
    config.gem "acts_as_commentable", :version => '2.0.2'
  end

  def activate
    Order.class_eval do
      acts_as_commentable
    end

    Admin::OrdersController.class_eval do
      def comments
        load_object
      end
    end

  end
end
