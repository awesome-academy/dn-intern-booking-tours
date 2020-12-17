class Admin::ToursController < AdminController
  before_action :get_tour, only: [:destroy, :show, :update]

  def index
    @tours = Tour.recent_tours.includes(tour_details: [:tour])
                 .paginate(page: params[:page],
                           per_page: Settings.per_page.manage_table)
    @tour = Tour.new
    @tour.tour_details.new
  end

  def show; end

  def create
    @tour = Tour.new tour_params
    if @tour.save
      flash[:success] = t "tour.add.success"
      redirect_to admin_tour_path(@tour.id)
    else
      flash.now[:danger] = t "tour.add.fail"
      render :index
    end
  end

  def destroy
    if @tour.tour_details.blank? && @tour.destroy
      flash[:success] = t "tour.delete.success"
    else
      flash[:danger] = t "tour.delete.fail"
    end

    redirect_to admin_tours_path
  end

  def create
    @tour = Tour.new tour_params
    if @tour.save
      flash[:success] = t "tour.add.success"
      redirect_to admin_tour_path(@tour.id)
    else
      flash.now[:danger] = t "tour.add.fail"
      render :index
    end
  end

  def update
    if @tour.update tour_params
      flash[:success] = t "tour.update.success"
    else
      flash[:danger] = t "tour.update.fail"
    end

    redirect_to admin_tour_path(@tour.id)
  end

  def destroy
    if @tour.tour_details.blank? && @tour.destroy
      flash[:success] = t "tour.delete.success"
    else
      flash[:danger] = t "tour.delete.fail"
    end

    redirect_to admin_tours_path
  end

  private

  def get_tour
    @tour = Tour.find_by id: params[:id]
    return if @tour

    flash[:warning] = t "tour.nil"

    redirect_to admin_tours_path
  end

  def tour_params
    params.require(:tour)
          .permit :place, :title, :description, :type_of_tour,
                  tour_details_attributes: [:start_date, :end_date, :price]
  end

  def tour_update_params
    params.require(:tour)
          .permit :title, :description
  end
end
