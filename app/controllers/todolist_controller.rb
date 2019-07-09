class TodolistController < ApplicationController
    def index
        @item = current_user && current_user.items.where(done: false)
        @completed_item = current_user && current_user.items.where(done: true)
    end
    
    def new
        @item = Item.new
    end
    
    
    def create
        @item = Item.new
        @item.user = current_user
        @item.details = params[:item][:details]
        @item.date_due = params[:item][:date_due]
        @item.done = false

        if @item.save
            flash[:alert] = "Your changes have been saved"
            redirect_to root_path
        else           
            render "new"
        end
    end

    def edit
        @item = Item.where(id: params[:id], user_id: current_user.id).first
        render "new"
    end

    def update
        @item = Item.find(params[:id])
        item_params = params.require(:item).permit(:details, :date_due)
        @item.update(item_params)
        if  params[:item][:done] == "true"
            @item.done = true
        elsif params[:item][:done] == "false"
            @item.done = false
            
        end
            @item.save
            flash[:alert] = "Item successfully edited"
            redirect_to root_path
        


    end

    def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to root_path
    end
    
    
end



