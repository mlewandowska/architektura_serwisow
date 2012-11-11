class FortunesController < ApplicationController
  before_filter only: [:index, :tags] do
    @tags = Fortune.tag_counts
  end

  def tags
    @fortunes = Fortune.tagged_with(params[:name])
      .page(params[:page]).per_page(4)
    respond_with(@fortunes) do |format|
      format.html { render action: 'index' }
    end
  end

  # GET /fortunes
  def index
    # @fortunes = Fortune.all
@fortunes = Fortune.order('created_at DESC').page(params[:page]).per_page(4)

    respond_with(@fortunes)
  end

  # GET /fortunes/1
  def show
    @fortune = Fortune.find(params[:id])
    @comment = Comment.new
    respond_with(@fortune)
  end

  # GET /fortunes/new
  def new
    @fortune = Fortune.new
    respond_with(@fortune)
  end

  # GET /fortunes/1/edit
  def edit
    @fortune = Fortune.find(params[:id])
  end

  # POST /fortunes
  def create
    @fortune = Fortune.new(params[:fortune])
    @fortune.save
    respond_with(@fortune)
  end

  # PUT /fortunes/1
  def update
    @fortune = Fortune.find(params[:id])
    @fortune.update_attributes(params[:fortune])
    respond_with(@fortune)
  end

  # DELETE /fortunes/1
  def destroy
    @fortune = Fortune.find(params[:id])
    @fortune.destroy
    respond_with(@fortune)
  end
end
