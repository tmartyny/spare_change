class SettingsController < ApplicationController
  include UserConcerns
  include SettingsConcerns

  before_filter :authenticate_user!

  def unfinished_signup
    if !plaid_complete
      redirect_to new_user_plaid
    elsif !stripe_complete
      redirect_to new_user_stripe
    elsif !charity_complete
      # all_charities -- I think this is duplicating
      redirect_to charities_users_path
    end
  end

end
