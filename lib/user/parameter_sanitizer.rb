class User::ParameterSanitizer < Devise::ParameterSanitizer
  def initialize(*)
    super
    permit(:sign_up, keys: [:username, :email, :password, :password_confirmation, :remember_me, :name, :postal_code, :birth_date, :gender, :marital_status, :children ])
    permit(:account_update, keys: [:username, :password, :password_confirmation ])
  end
end