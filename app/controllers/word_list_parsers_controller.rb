class WordListParsersController < ApplicationController
  before_action :set_word_list_parser, only: [:show, :edit, :update, :destroy]

  # GET /word_list_parsers
  # GET /word_list_parsers.json
  def index
    @word_list_parsers = WordListParser.all
  end

  # GET /word_list_parsers/1
  # GET /word_list_parsers/1.json
  def show
  end

  # GET /word_list_parsers/new
  def new
    @word_list_parser = WordListParser.new
  end

  # GET /word_list_parsers/1/edit
  def edit
  end

  # POST /word_list_parsers
  # POST /word_list_parsers.json
  def create
    @word_list_parser = WordListParser.new(word_list_parser_params)

    respond_to do |format|
      if @word_list_parser.save
        @word_list_parser.process_word_list(6)
 	@word_list_parser.quick_process_word_list(6)
        format.html { redirect_to @word_list_parser, notice: 'Word list parser was successfully created.' }
        format.json { render :show, status: :created, location: @word_list_parser }
      else
        format.html { render :new }
        format.json { render json: @word_list_parser.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /word_list_parsers/1
  # PATCH/PUT /word_list_parsers/1.json
  def update
    respond_to do |format|
      if @word_list_parser.update(word_list_parser_params)
        format.html { redirect_to @word_list_parser, notice: 'Word list parser was successfully updated.' }
        format.json { render :show, status: :ok, location: @word_list_parser }
      else
        format.html { render :edit }
        format.json { render json: @word_list_parser.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /word_list_parsers/1
  # DELETE /word_list_parsers/1.json
  def destroy
    @word_list_parser.destroy
    respond_to do |format|
      format.html { redirect_to word_list_parsers_url, notice: 'Word list parser was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_word_list_parser
      @word_list_parser = WordListParser.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def word_list_parser_params
      params.require(:word_list_parser).permit(:name, :wordlist)
    end
end
