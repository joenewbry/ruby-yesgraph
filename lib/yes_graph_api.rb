class YesGraphAPI
  include ::HTTParty
  format :json

  def initialize(secret_key)
    @options = {
      "Authorization" => "Bearer #{secret_key}",
    "Content-Type" => "application/json",
    "Accept" => 'application/json'
              }
  end

  def test
    self.class.get('https://api.yesgraph.com/v0/test', :headers => @options)
  end

  def post_address_book(user_id, source_name, source_email, entries, source_type="gmail")
    self.class.post("https://api.yesgraph.com/v0/address-book",
      {
      body: {
        user_id: user_id,
        source: {
            name: source_name,
            email: source_email,
            type: source_type
        },
        entries: entries
      }.to_json,
      :headers => @options
      }
    )
  end

  # Returns ranked list of suggestions
  def get_address_book(user_id)
    self.class.get("https://api.yesgraph.com/v0/address-book/#{user_id}",
      {
      :headers => @options
      }
    )
  end

  # should be called to list all user IDs that have submitted their address books
  def get_address_books
    self.class.get('https://api.yesgraph.com/v0/address-books', :headers => @options)
  end

  # should be called to create or update user
  def post_users(users)
    self.class.post('https://api.yesgraph.com/v0/users', {
      :body => users.to_json,
      :headers => @options,
        })
  end

  def post_invite_sent(user_id, email)
    self.class.post('https://api.yesgraph.com/v0/invite-sent',
      {
        :body => {user_id: user_id, email: email}.to_json,
        :headers => @options
      })
  end

  def post_invite_accepted(email)
    self.class.post('https://api.yesgraph.com/v0/invite-accepted',
      {
        :body => {"email" => email}.to_json,
        :headers => @options
      })
  end
end
