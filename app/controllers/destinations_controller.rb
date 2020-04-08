class DestinationsController < ApplicationController 
    before_action :find_destination, only: [:show, :edit, :update, :destroy]
        
        def index
            @destinations = Destination.all
        end 
    
        def new
            @destination = Destination.new
        end 
    
        def create
            @destination = Destination.create(destination_params)
            if @destination.valid?
                redirect_to destination_path(@destination)
            else 
                flash[:errors] = @destination.errors.full_messages
                redirect_to new_destination_path
            end 
        end 
    
        def show
        end 
    
        def edit
        end 
    
        def update
            if @destination.update(destination_params)
                redirect_to destination_path(@destination)
            else 
                flash[:errors] = @destination.errors.full_messages
                redirect_to edit_destination_path
            end 
        end 
    
        def destroy
            @destination.destroy 
            redirect_to destinations_path
        end 
    
        private 
    
        def destination_params
            params.require(:destination).permit(:name, :country)
        end 
    
        def find_destination
            @destination = Destination.find(params[:id])
        end 
    end 