class KakeibosController < ApplicationController
  before_action :set_kakeibo, only: [:show, :edit, :update, :destroy ]

  # GET /kakeibos
  # GET /kakeibos.json
  def index
    #20件までデフォルト表示
     @kakeibos = Kakeibo.order("created_at desc").limit(20).all
     #@kakeibos = Kakeibo.all
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
    #パラメタの値を取得してレコードを生成する
    @kakeibo = Kakeibo.new(kakeibo_params)
    
    #logger.debug(@kakeibo.kicho_year)
    respond_to do |format|
      if @kakeibo.save
        @kakeibo = Kakeibo.new(params.require(:kakeibo).permit(:kicho_date))
        
        #連続して作成
        format.html { redirect_to "/kakeibos/new", notice: 'Kakeibo was successfully created.' }
        
        #format.html { redirect_to @kakeibo, notice: 'Kakeibo was successfully created.' }
        #format.json { render :show, status: :created, location: @kakeibo }
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
    ###if @default_check= nil
    ###  @default_check = true
    ###end
    #logger.debug("debug month ")

    #パラメータの受取り
    kakeiboListForm = params[:kakeiboListForm]
    if kakeiboListForm != nil
      logger.debug(params[:kakeiboListForm][:serch_date])
      @serch_date = params[:kakeiboListForm][:serch_date]
    end
    j = Kakeibo.arel_table

      #月でグループ化
      if @serch_date == 'month' then
          @kakeibos =  Kakeibo.order("kicho_year desc , kicho_month desc").group(:kicho_year,:kicho_month).select([        \
            :kicho_year                                          \
          , :kicho_month                                         \
          , j[:food_exp].sum.as('food_exp')                      \
          , j[:amusement].sum.as('amusement')                    \
          , j[:entertainment_exp].sum.as('entertainment_exp')    \
          , j[:transport_exp].sum.as('transport_exp')            \
          , j[:daily_necessities].sum.as('daily_necessities')    \
          , j[:fixture].sum.as('fixture')                        \
          , j[:beauty_exp].sum.as('beauty_exp')                  \
          , j[:jiko_toushi].sum.as('jiko_toushi')                \
          , j[:otherwise_exp].sum.as('otherwise_exp')            \
          ])

          #render :template => "kakeibos/list"

      #年でグループ化
      elsif @serch_date == 'year' then
        @kakeibos = Kakeibo.order("kicho_year desc").group(:kicho_year).select([ \
          :kicho_year                         \
        , j[:food_exp].sum.as('food_exp')                      \
        , j[:amusement].sum.as('amusement')    \
        , j[:entertainment_exp].sum.as('entertainment_exp')    \
        , j[:transport_exp].sum.as('transport_exp')            \
        , j[:daily_necessities].sum.as('daily_necessities')    \
        , j[:fixture].sum.as('fixture')                        \
        , j[:beauty_exp].sum.as('beauty_exp')                  \
        , j[:jiko_toushi].sum.as('jiko_toushi')                \
        , j[:otherwise_exp].sum.as('otherwise_exp')            \
        ])
 
        #render :template => "kakeibos/list"
      
      #日でグループ化
      else 
        @kakeibos =  Kakeibo.order("kicho_year desc , kicho_month desc ,kicho_day desc").group(:kicho_year,:kicho_month,:kicho_day).select([        \
          :kicho_year                                          \
          ,:kicho_month                                        \
          ,:kicho_day                                          \
        , j[:food_exp].sum.as('food_exp')                      \
        , j[:amusement].sum.as('amusement')                    \
        , j[:entertainment_exp].sum.as('entertainment_exp')    \
        , j[:transport_exp].sum.as('transport_exp')            \
        , j[:daily_necessities].sum.as('daily_necessities')    \
        , j[:fixture].sum.as('fixture')                        \
        , j[:beauty_exp].sum.as('beauty_exp')                  \
        , j[:jiko_toushi].sum.as('jiko_toushi')                \
        , j[:otherwise_exp].sum.as('otherwise_exp')            \
        ])

        #render :template => "kakeibos/list"

      end
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

