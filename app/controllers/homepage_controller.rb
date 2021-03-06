class HomepageController < ApplicationController
  helper_method :resource_name, :resource, :devise_mapping,
    :user_signed_in, :current_user

  def index
    @interests_sample = Interest.limit(10)
    @all_places = Place.all
    gon.places = @all_places.collect do |place|
      interests = place.interests.collect { |interest| interest.name }
      {interests: interests.uniq,
      place: place}
    end
  end

  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end
end
