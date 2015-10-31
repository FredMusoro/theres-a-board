class Api::TimeslotsController < SecuredController
  def index
    @timeslots = Timeslot.all
  end

  def create
    timeslot = Timeslot.new(safe_params)
    timeslot.tutor_id = current_user.id
    if timeslot.save
      render json: { message: 'post api timeslot' }
    else
      @errors = current_user.errors.full_messages
      render json: @errors
    end
  end

  def update
    @timeslot = Timeslot.find_by(id: safe_params[:id])
    @timeslot.student_id = current_user.id
    if @timeslot.save
      render plain: { message: 'success' }
    else
      render plain: { message: 'fail' }
    end
  end

  private
  # def build_params
  #   params[:timeslots].each do |timeslot|
  #     @timeslot = Timeslot.new(start: timeslot[:timeslot])
  #     @timeslot.tutor_id = current_user.id
  #     return false unless @timeslot.save
  #   end
  #   true
  # end

  def safe_params
    params.require(:timeslot).permit(:start, :id, :location)
  end
end
