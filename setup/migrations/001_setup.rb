Sequel.migration do
  # Initial database setup
  change do
    create_table(:authors) do
      primary_key :id
      String :username, unique: true
      String :password, fixed: true, size: 60
      String :email, unique: true
      String :display_name, null: true
      String :bio, text: true
      String :role
      TrueClass :active, default: false
      DateTime :created_at
    end

    create_table(:posts) do
      primary_key :id
      String :title
      String :content, text: true
      String :slug, unique: true
      String :status
      foreign_key :author_id, :authors
      DateTime :published_on
      DateTime :last_updated
    end

    create_table :categories do
      primary_key :id
      String :name, unique: true
    end

    create_join_table(post_id: :posts, category_id: :categories)

    create_table(:pages) do
      primary_key :id
      String :title
      String :content, text: true
      String :slug, unique: true
    end

    # Subscribers
    # ===========
    # Subscribers are sites that will
    # pick up posts from you and syndicate
    # your content.
    create_table(:subscribers) do
      primary_key :id
      String :status, default: 'pending' # approved, denied, pending, deleted
      String :type # Subscription type - 'auto' for automatic publishing, 'triggered' requires approval (determined by subscriber)
      String :token # Subscribers will give you a unique token to post with
      String :endpoint # The endpoint to post to
    end

    # Subscriptions
    # =============
    # Subscriptions are sites from whom you agree
    # to pick up and syndicate content from.
    create_table(:subscriptions) do
      primary_key :id
      TrueClass :active, default: false
      String :url, unique: true
      String :type, default: 'triggered' # Allow auto-posting for a site?
      String :label
      String :token # You'll generate a unique token for each site that wants to post
    end
  end
end
