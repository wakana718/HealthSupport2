class RecordsController < ApplicationController
  def new
    @record = Record.new
  end

  def create
    @record = Record.new(record_params)
    @record.user_id = current_user.id
    if @record.save
     redirect_to records_path, notice: "記録しました！"
    else
     flash.now[:alert] = '記録できませんでした'
     render :new
    end
  end

  def index
    @records = Record.all
  end

  def show
    @record = Record.find(params[:id])
  end

  def edit
    @record = Record.find(params[:id])
  end

  def update
    @record = Record.find(params[:id])
    if @record.update(record_params)
      redirect_to records_path(@record.id), notice: "記録を更新しました！"
    else
      flash.now[:alert] = '記録を更新できませんでした'
      render :edit
    end
  end

  def destroy
    @record = Record.find(params[:id])
    if @record.destroy
     redirect_to record_path(current_user), notice:"記録を削除しました！"
    else
     flash.now[:alert] = '記録を削除できませんでした'
     render :show
    end
  end

  private

  def record_params
    params.require(:record).permit(:weight, :memo, :start_time)
  end


end
