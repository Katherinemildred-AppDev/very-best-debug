class VenuesController < ApplicationController

  def index
    matching_venues = Venue.all
    @venues = matching_venues.order(:created_at) #changed venues to @venues

    render({ :template => "venue_templates/venue_list.html.erb" })
  end

  def show
    venue_id = params.fetch("venue_id")
    matching_venues = Venue.where({ :id => venue_id })
    @the_venue = matching_venues.at(0)   #made this instance variable, and added .at(0)

    render({ :template => "venue_templates/details.html.erb" })
  end

  def create
    @venue = Venue.new
    @venue.address = params.fetch("query_address")
    @venue.name = params.fetch("name")
    @venue.neighborhood = params.fetch("neighborhood")
    @venue.save

    redirect_to("/venues/#{@venue.name}")
  end
  
  def update
    venue_id = params.fetch("venue_id")
    matching_venues = Venue.where({ :id => venue_id })
    venue= matching_venues.at(0)

    venue.address = params.fetch("query_address")
    venue.name = params.fetch("query_name")
    venue.neighborhood = params.fetch("query_neighborhood")
    venue.save
    
    redirect_to("/venues/#{venue.id}")
  end

  def destroy
    the_id = params.fetch("venue_id")
    matching_venues = Venue.where({ :id => the_id })
    venue = matching_venues
    venue.destroy

    redirect_to("/venues")
  end

end
