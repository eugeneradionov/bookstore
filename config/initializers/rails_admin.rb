RailsAdmin.config do |config|

  ### Popular gems integration

  ## == Devise ==
  config.authenticate_with do
    warden.authenticate! scope: :admin
  end
  config.current_user_method(&:current_admin)

  ## == Cancan ==
  config.authorize_with :cancan

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  ## == Gravatar integration ==
  ## To disable Gravatar integration in Navigation Bar set to false
  config.show_gravatar = false

  config.excluded_models = [Cart, UserInfo]

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new do
      except [Payment, OrderItem, ShippingAddress, BillingAddress, Order, User, Review]
    end
    bulk_delete
    show
    edit do
      except [Payment, OrderItem, ShippingAddress, BillingAddress, User]
    end
    delete do
      except [Payment, OrderItem, ShippingAddress, BillingAddress, Order, User]
    end
    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end

  config.model Book do
    list do
      # field :cover_url do # TODO: thumbnail
      #   formatted_value do
      #     bindings[:view].tag(:img, { src: bindings[:object].cover_url }) << value
      #   end
      # end
      field :title
      field :authors
      field :categories
      field :price
      field :description
    end

    show do
      field :title
      field :description
      field :price
      field :publication_year
      field :height
      field :width
      field :depth
      field :cover_url
      field :authors
      field :categories
      field :image_urls
    end

    edit do
      field :title
      field :description
      field :price
      field :publication_year
      field :height
      field :width
      field :depth
      field :cover_url
      field :authors
      field :categories
      field :image_urls
    end
  end

  config.model Order do
    list do
      scopes [:waiting_for_processing, :in_progress, :in_delivery, :delivered, :canceled]
      field :id
      field :order_status
      field :created_at
    end

    show do
      field :id
      field :delivery
      field :order_status
      field :shipping_address
      field :billing_address
      field :user
      field :created_at
      field :updated_at
      field :payment
    end

    edit do
      field :order_status
    end
  end

  config.model Category do
    list do
      field :name
    end

    show do
      field :name
      field :books
    end

    edit do
      field :name
      field :books
    end
  end

  config.model Delivery do
    edit do
      field :method
      field :days_from
      field :days_to
      field :price
    end

    list do
      field :id
      field :method
      field :days_from
      field :days_to
      field :price
    end

    show do
      field :id
      field :method
      field :days_from
      field :days_to
      field :price
    end
  end

  config.model ImageUrl do
    list do
      field :id
      field :url
    end

    edit do
      field :url
    end
  end

  config.model Payment do
    list do
      field :card_number # TODO: is it secure to show full card number?
      field :name_on_card # TODO: --//--//--
      field :mm_yy # TODO: --//--//--
    end

    show do
      field :card_number
      field :name_on_card
      field :mm_yy
    end
  end

  config.model User do
    list do
      field :email
    end

    show do
      field :email
      field :reviews
      field :orders
    end
  end

  config.model Review do
    list do
      scopes [:unprocessed, :approved, :rejected]
      field :book
      field :created_at
      field :user
      field :review_status
    end

    show do
      field :book
      field :created_at
      field :user
      field :review_status
    end

    edit do
      field :review_status
    end
  end
end
