json.extract! eg_user, :id, :username, :first_name, :last_name, :location, :bio, :phone_number, :email, :encrypted_password, :reset_password_token, :remember_created_at, :created_at, :updated_at
json.url eg_user_url(eg_user, format: :json)
