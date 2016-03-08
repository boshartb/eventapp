class EventsController < ApplicationController
  def index
    events = Event.all
    events = events.where("description ILIKE :value OR 
              title ILIKE :value", value: "%#{params[:search]}%") if params[:search].present?
    events = events.where(category_id: params[:category_id]) if params[:category_id].present?
    @events = events.future
                    .page(params[:page])      

    respond_to do |format|
      format.js # for infinite scrolling
      format.html
    end
  end

  def archived
    events = Event.all
    events = events.where("description ILIKE :value OR 
              title ILIKE :value", value: "%#{params[:search]}%") if params[:search].present?
    events = events.where(category_id: params[:category_id]) if params[:category_id].present?
    @events = events.archived
                    .page(params[:page])             
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)

    unless @event.end_date.present?
      @event.end_date = @event.start_date
    end

    if @event.save
      redirect_to events_url
    else
      render :new
    end
    # render :text => "Saving a Event.  Title: #{params[:title]}, Image: #{params[:image]}, Start Date: #{params[:start_date]}, End Date: #{params[:end_date]}, Category: #{params[:category]}, Address: #{params[:address]}, Time: #{params[:time]}, Description: #{params[:description]}, Archived: #{params[:archived]}, Secret: #{params[:secret]}"
  end

  def show  
    @event = Event.find(params[:id])
  end

  def edit
    @event = Event.find(params[:id])
  end

  
  def update
     @event = Event.find(params[:id])

    if @event.update_attributes(event_params)
      redirect_to "/events/#{@event.id}"
    else
      render :edit
    end
  end


  private

  def event_params
    params.require(:event).permit(
      :title,
      :time,
      :address,
      :description,
      :secret,
      :archived,
      :image,
      :remote_image_url,
      :start_date,
      :end_date,
      :category_id,
      :tag,
      :keep_after_event,
      tag_ids: []
    )
  end

end


