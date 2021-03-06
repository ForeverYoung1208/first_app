# encoding: utf-8
class DocsController < ApplicationController
  before_filter :set_page
  before_filter :is_admin, :except=>[:index, :get_docfile, :get_categories]

  ###
  respond_to :html, :json, :js
  

  def get_docfile
    doc=Doc.find(params[:id])
    case Rails.env
    when 'development'
      send_file doc.docfile.path
      ### redirect_to URI.encode(::FILE_SERV+doc.docfile.path)
    when 'production'
      send_file doc.docfile.path
      ### redirect_to URI.encode(::FILE_SERV+doc.docfile.path)    
    end
  end

  # GET /docs
  # GET /docs.json

  def index
    params[:category]&&params[:category]!='' ?  @docs = Doc.find_all_by_content(params[:category]) : @docs = Doc.all
    respond_with @docs
  end

  def get_categories
    @categories = Doc.select(:content).uniq.all
    respond_with @categories
  end

  # GET /docs/1
  # GET /docs/1.json
  def show
    @doc = Doc.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @doc }
    end
  end

  # GET /docs/new
  # GET /docs/new.json
  def new
    @doc = Doc.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @doc }
    end
  end

  # GET /docs/1/edit
  def edit
    @doc = Doc.find(params[:id])
  end

  # POST /docs
  # POST /docs.json
  def create
    @doc = Doc.new(params[:doc])

    respond_to do |format|
      if @doc.save
        format.html { redirect_to @doc, :notice => 'Документ создан' }
        format.json { render :json => @doc, :status => :created, :location => @doc }
      else
        format.html { render :action => "new" }
        format.json { render :json => @doc.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /docs/1
  # PUT /docs/1.json
  def update
    @doc = Doc.find(params[:id])

    respond_to do |format|
      if @doc.update_attributes(params[:doc])
        format.html { redirect_to docs_path, :notice => 'Документ обновлён' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @doc.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /docs/1
  # DELETE /docs/1.json
  def destroy
    @doc = Doc.find(params[:id])
    @doc.destroy

    respond_to do |format|
      format.html { redirect_to docs_url }
      format.json { head :no_content }
    end
  end

  private

  def set_page
    @selected_page=2
  end

  private

  def set_page
    @selected_page=:page3
  end


end
