require 'nokogiri'
require 'open-uri'

class FeedsController < ApplicationController
  before_filter :require_user
  
  # GET /feeds
  # GET /feeds.xml
  def index
    @feeds = current_user.feeds.find(:all, :order => "created_at")

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @feeds }
    end
  end

  # GET /feeds/1
  # GET /feeds/1.xml
  def show
    @feed = Feed.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @feed }
    end
  end

  # GET /feeds/new
  # GET /feeds/new.xml
  def new
    @feed = Feed.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @feed }
    end
  end

  # GET /feeds/1/edit
  def edit
    @feed = current_user.feeds.find(params[:id])
  end

  # POST /feeds
  # POST /feeds.xml
  def create
    @feed = Feed.new(params[:feed])
    @feed.user = current_user

    respond_to do |format|
      if @feed.save
        flash[:notice] = 'Feed was successfully created.'
        format.html { redirect_to(user_feeds_path(current_user)) }
        format.xml  { render :xml => @feed, :status => :created, :location => @feed }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @feed.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /feeds/1
  # PUT /feeds/1.xml
  def update
    @feed = current_user.feeds.find(params[:id])

    respond_to do |format|
      if @feed.update_attributes(params[:feed])
        flash[:notice] = 'Feed was successfully updated.'
        format.html { redirect_to(user_feeds_path(current_user)) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @feed.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /feeds/1
  # DELETE /feeds/1.xml
  def destroy
    @feed = Feed.find(params[:id])
    @feed.destroy

    respond_to do |format|
      format.html { redirect_to(user_feeds_path(current_user)) }
      format.xml  { head :ok }
    end
  end
  
  def titles
    @feed = Feed.find(params[:id])
    doc = Nokogiri::XML(open(@feed.uri))
    @headlines = doc.search(@feed.title_xpath).map{ |tag| tag.inner_text }
  end
end
