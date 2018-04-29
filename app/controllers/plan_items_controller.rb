class PlanItemsController < ApplicationController
  def index
    t0 = Time.current.beginning_of_day
    t1 = t0.advance(hours: 24)
    @plan_items = PlanItem.order(:starts_at)
    @continued_plan_items = PlanItem.where('starts_at < ? AND ends_at > ?', t0, t1).order(:starts_at)
    render action: :index
  end

  # GET (collection)
  def of_today
    t0 = Time.current.beginning_of_day
    t1 = t0.advance(hours: 24)
    @plan_items = PlanItem.where('starts_at >= ? AND starts_at < ?', t0, t1).order(:starts_at)
    .or(PlanItem.where('ends_at > ? AND ends_at <= ?', t0, t1).order(:starts_at))
    @continued_plan_items = PlanItem.where('starts_at < ? AND ends_at > ?', t0, t1).order(:starts_at)
    render action: :index
  end

  def show
    @plan_item = PlanItem.find(params[:id])
  end

  def new
    @plan_item = PlanItem.new
    time0 = Time.current.beginning_of_hour
    @plan_item.starts_at=time0.advance(hours:1)
    @plan_item.ends_at=time0.advance(hours:2)
  end

  def create
    PlanItem.create!(plan_item_params)

    redirect_to :plan_items, notice: '予定を追加しました。'
  end

  def edit
    @plan_item = PlanItem.find(params[:id])
  end

  def update
    @plan_item = PlanItem.find(params[:id])
    @plan_item.update!(plan_item_params)

    redirect_to :plan_items, notice: '予定を変更しました。'
  end

  def destroy
    @plan_item = PlanItem.find(params[:id])
    @plan_item.destroy!

    redirect_to :plan_items, notice: '予定を削除しました。'
  end

  private def plan_item_params
    params[:plan_item].permit(:name, :description,
      :starts_at_date_part, :starts_at_time_part,
      :ends_at_date_part, :ends_at_time_part)
  end
end
