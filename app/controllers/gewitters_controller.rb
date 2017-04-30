class GewittersController < ApplicationController
  before_action :set_gewitter, only: [:edit, :update, :destroy]
  
  def index
    @gewitters = Gewitter.all
  end
  
  def new
    if params[:back]
      @gewitter = Gewitter.new(gewitters_params)
    else
      @gewitter = Gewitter.new
    end
  end
  
  def confirm
    @gewitter = Gewitter.new(gewitters_params)
    render :new if @gewitter.invalid?
  end
  
  def create
    @gewitter = Gewitter.new(gewitters_params)
    if @gewitter.save 
      redirect_to gewitters_path, notice: "ゲビッタを作成しました！"
    else
      render 'new'
    end
  end
  
  def edit
  end
  
  def update
    @gewitter.update(gewitters_params)
    if @gewitter.save
      redirect_to gewitters_path, notice: "ゲビッタを更新しました！"
    else
      render 'edit'
    end
  end
  
  def destroy
    @gewitter.destroy
    redirect_to gewitters_path, notice: "ゲビッタを削除しました！"
  end
  
  private
  def gewitters_params
    params.require(:gewitter).permit(:content)
  end
  
  def set_gewitter
     @gewitter = Gewitter.find(params[:id])
  end
end
