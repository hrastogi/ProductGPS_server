class SkusController < ApplicationController
  # GET /skus
  # GET /skus.json
  def index
    puts params[:query]
        search = params[:query]
        distance = params[:distance]
     if search.present?
           # @skus  = Sku.tire.search(load: true) do
           #    query { string query } 
           # query1 = { query: { filtered: { query: { match_all: ''} }, filter: { geo_distance: { distance: "2km", lat_lon: "34,118" } } } }
           # @skus = Sku.search query,query1
           @skus =  Sku.tire.search do
           query {string search}
             filter :geo_distance, location: {lat:"118", lon: "34"}, distance: distance
           end

         else   
            @skus = Sku.all
         end

         puts @skus.size
         @skus.each do |i|
            puts i.description
         end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @skus }
    end
  end

  # GET /skus/1
  # GET /skus/1.json
  def show
    @sku = Sku.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @sku }
    end
  end

  # GET /skus/new
  # GET /skus/new.json
  def new
    @sku = Sku.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @sku }
    end
  end

  # GET /skus/1/edit
  def edit
    @sku = Sku.find(params[:id])
  end

  # POST /skus
  # POST /skus.json
  def create
    @sku = Sku.new(params[:sku])

    respond_to do |format|
      if @sku.save
        format.html { redirect_to @sku, notice: 'Sku was successfully created.' }
        format.json { render json: @sku, status: :created, location: @sku }
      else
        format.html { render action: "new" }
        format.json { render json: @sku.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /skus/1
  # PUT /skus/1.json
  def update
    @sku = Sku.find(params[:id])

    respond_to do |format|
      if @sku.update_attributes(params[:sku])
        format.html { redirect_to @sku, notice: 'Sku was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @sku.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /skus/1
  # DELETE /skus/1.json
  def destroy
    @sku = Sku.find(params[:id])
    @sku.destroy

    respond_to do |format|
      format.html { redirect_to skus_url }
      format.json { head :no_content }
    end
  end
end
