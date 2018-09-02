class KakeibosController < ApplicationController
  before_action :set_kakeibo, only: [:show, :edit, :update, :destroy ]

  # GET /kakeibos
  # GET /kakeibos.json
  def index
    #5件までデフォルト表示
     #@kakeibos = Kakeibo.limit(5).all
     @kakeibos = Kakeibo.all
  end

  # GET /kakeibos/1
  # GET /kakeibos/1.json
  def show
  end

  # GET /kakeibos/new
  def new
    @kakeibo = Kakeibo.new
  end

  # GET /kakeibos/1/edit
  def edit
  end

  # POST /kakeibos
  # POST /kakeibos.json
  def create    
    @kakeibo = Kakeibo.new(kakeibo_params)
    #logger.debug(@kakeibo.kicho_year)
    respond_to do |format|
      if @kakeibo.save
        format.html { redirect_to @kakeibo, notice: 'Kakeibo was successfully created.' }
        format.json { render :show, status: :created, location: @kakeibo }
      else
        format.html { render :new }
        format.json { render json: @kakeibo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /kakeibos/1
  # PATCH/PUT /kakeibos/1.json
  def update
    respond_to do |format|
      if @kakeibo.update(kakeibo_params)
        format.html { redirect_to @kakeibo, notice: 'Kakeibo was successfully updated.' }
        format.json { render :show, status: :ok, location: @kakeibo }
      else
        format.html { render :edit }
        format.json { render json: @kakeibo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /kakeibos/1
  # DELETE /kakeibos/1.json
  def destroy
    @kakeibo.destroy
    respond_to do |format|
      format.html { redirect_to kakeibos_url, notice: 'Kakeibo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def list
    #デフォルトで日毎にチェック
    if @default_check= nil
      @default_check = true
    end

    #検索（日毎で集約）
    @kakeibos = Kakeibo.find_by_sql("									              	\
      Select															                          	\
        kicho_date														                      	\
        ,sum(COALESCE(food_exp,0)) as food_exp							        	\
        ,sum(COALESCE(amusement,0)) as amusement							        \
        ,sum(COALESCE(entertainment_exp,0)) as entertainment_exp			\
        ,sum(COALESCE(transport_exp,0)) as transport_exp				    	\
        ,sum(COALESCE(daily_necessities,0)) as daily_necessities			\
        ,sum(COALESCE(fixture,0)) as fixture								          \
        ,sum(COALESCE(beauty_exp,0)) as beauty_exp							      \
        ,sum(COALESCE(jiko_toushi,0)) as jiko_toushi					      	\
        ,sum(COALESCE(otherwise_exp,0)) as otherwise_exp					    \
      From																	                          \
        kakeibos															                        \
      Group by kicho_date												                    	\
      Order by kicho_date												                    	\
      ")

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_kakeibo
      @kakeibo = Kakeibo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def kakeibo_params
      params.require(:kakeibo).permit(:kicho_date,
                                       :food_exp,
                                       :amusement, 
                                       :entertainment_exp, 
                                       :transport_exp, 
                                       :daily_necessities, 
                                       :fixture, 
                                       :beauty_exp, 
                                       :jiko_toushi ,
                                       :otherwise_exp, 
                                       :memo
                                       )
    end
end

