class CommentsController < ApplicationController
  before_filter do
    @fortune = Fortune.find(params[:fortune_id])
  end

  # POST /fortunes/:fortune_id/comments
  def create
    @comment = @fortune.comments.build(params[:comment])
    @comment.save
    respond_with(@fortune, @comment, location: @fortune)
  end

  # DELETE /fortunes/:fortune_id/comments/:id
  def destroy
    @comment = @fortune.comments.find(params[:id])
    @comment.destroy
    respond_with(@fortune, @comment, location: @fortune)
  end

  # GET /fortunes/:fortune_id/comments/:id/edit
  def edit
    @comment = @fortune.comments.find(params[:id])
  end

  # PUT /fortunes/:fortune_id/comments/:id
  def update
    @comment = @fortune.comments.find(params[:id])
    @comment.update_attributes(params[:comment])
    respond_with(@fortune, @comment, location: @fortune)
  end

end
