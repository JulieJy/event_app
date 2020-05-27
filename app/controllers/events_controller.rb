class EventsController < ApplicationController
  def index
    @events = Event.all.where("date > ?", 10.days.ago).order(date: :desc)
    @event = Event.new
  end

  def show
    @event = Event.find(params[:id])
    @comment = @event.comments.new
    @comments = @event.comments.order(created_at: :desc)
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to event_path(@event)
    else
      redirect_to events_path
    end
  end

  private

  def event_params
    params.require(:event).permit(:name, :date, :description, :email)
  end
end
