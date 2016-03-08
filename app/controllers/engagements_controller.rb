class EngagementsController < ApplicationController

  def saved
    if current_user
      @engagements = current_user.engagements
      @engagements = Kaminari.paginate_array(@engagements).page(params[:page])
      @events = Kaminari.paginate_array(
        Engagement.where(user_id: current_user.id)
                  .map(&:event)
        ).page(params[:page])
      render "saved"
    else
      flash[:deal] = true
      flash[:notice] = "Sign in or Login in to save!"
      redirect_to new_user_path
    end
  end

  def create
    if current_user
    event = Event.find(params[:event_id])
    engagement = current_user.engagements.find_or_create_by(event: event)
    engagement.save
      flash[:notice] = "Added to your list"
    else
      flash[:notice] = "Could not add to your list"
    end
    redirect_to engagements_saved_path
  end

  def destroy
    engagement = current_user.engagements.find(params[:id])
    engagement.destroy
    flash[:notice] = "Event removed"
    redirect_to engagements_saved_path
  end

  private
  # def event
  #   @event ||= Event.find(params[:event_id])
  # end
end
