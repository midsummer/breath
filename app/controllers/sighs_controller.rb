class SighsController < ApplicationController
  before_action :set_sigh, only: :destroy
  before_action :set_time_zone, only: [:new, :create]

  def new

    gon.data = Sigh.all.group_by { |t| t.created_at.strftime('%k') }.map {|k,v| [k, v.length] }.sort
    @sighs = Sigh.all.order('created_at desc').group_by { |t| t.created_at.strftime('%B %e') }
    @sigh = Sigh.new
  end

  def create
    @sigh = Sigh.new(created_at: DateTime.now.in_time_zone)

    respond_to do |format|
      if @sigh.save
        format.html { redirect_to root_path, notice: 'Sigh was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def destroy
    @sigh.destroy
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'Sigh was successfully destroyed.' }
    end
  end

  private
    def set_sigh
      @sigh = Sigh.find(params[:id])
    end

    def sigh_params
      params.fetch(:sigh, {})
    end

    def set_time_zone
      Time.zone = 'Minsk'
    end

  def group_by_criteria

  end
end
