class TagsController < ApplicationController

    before_action :require_login, only: [:destroy]


    def index
        @tags = Tag.all
    end

    def show
        @tag = Tag.find(params[:id])
    end

#    def destroy
#        @tag = Tag.find(params[:id])
#        @tag.destroy
#        
#        flash.notice = "Tag '#{@tag.name}' Destroyed"
#
#        redirect_to tags_path
#    end

  def destroy
    @tag = Tag.find(params[:id])
    @taggings = Tagging.where(tag_id: @tag.id)

    @taggings.each do |tagging|
        tagging.destroy
    end

    @tag.destroy

    redirect_to  tags_path
  end

end
