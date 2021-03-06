# @resource Event
#
class EventsController < ApplicationController
  helper_method :sort_column, :sort_direction

  ##
  # Returns a list of upcoming and past events (of the 10 last days)
  #
  # @path [GET] /v2/events
  #
  # @response_type [array<Event>]
  #
  def index
    p params[:sort]
    @events = Event.all.where("date > ?", 10.days.ago).order(sort_column + " " + sort_direction)
    @event = Event.new
  end

  ##
  # Returns the event's details.
  #
  # @path [GET] /events/{id}
  #
  # @parameter id(path) [integer] The id of the event to show
  #
  # @response_type [Event]
  #
  def show
    @event = Event.find(params[:id])
    @comment = @event.comments.new
    @comments = @event.comments.order(created_at: :asc)
  end

  ##
  # Creates a new event
  #
  # @path [POST] /events
  #
  # @parameter name [string] Title of the event (required)
  # @parameter date [date] Date of the event starts (required)
  # @parameter email [string] Email of the event organizer (required)
  # @parameter description [text] Description of the event (300 car max)
  # @response_type [Event] Event successfully created
  #
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

  def sort_column
    Event.column_names.include?(params[:sort]) ? params[:sort] : "date"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "desc"
  end
end
