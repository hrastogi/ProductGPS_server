class SkusController < ApplicationController

   def index
      puts params[:query]
      query = params[:query]
      distance = params[:distance]
   if query.present?
         # @skus  = Sku.tire.search(load: true) do
         #    query { string query } 
         # query1 = { query: { filtered: { query: { match_all: ''} }, filter: { geo_distance: { distance: "2km", lat_lon: "34,118" } } } }
         # @skus = Sku.search query,query1
         @skus =  Sku.tire.search do
         query { all }
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

   # GET /items/1
   # GET /items/1.json
   def show
     @sku = Sku.find(params[:id])

     respond_to do |format|
       format.html # show.html.erb
       format.json { render json: @sku }
     end
   end

   # GET /items/new
   # GET /items/new.json
   def new
     @sku= Sku.new

     respond_to do |format|
       format.html # new.html.erb
       format.json { render json: @sku }
     end
   end

   # GET /items/1/edit
   def edit
     @sku = Sku.find(params[:id])
   end

   # POST /items
   # POST /items.json
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

   # PUT /items/1
   # PUT /items/1.json
   def update
     @sku = Sku.find(params[:id])

     respond_to do |format|
       if @sku.update_attributes(params[:item])
         format.html { redirect_to @sku, notice: 'Sku was successfully updated.' }
         format.json { head :no_content }
       else
         format.html { render action: "edit" }
         format.json { render json: @sku.errors, status: :unprocessable_entity }
       end
     end
   end

   # DELETE /items/1
   # DELETE /items/1.json
   def destroy
     @sku = Sku.find(params[:id])
     @sku.destroy

     respond_to do |format|
       format.html { redirect_to items_url }
       format.json { head :no_content }
     end
   end
   
end
