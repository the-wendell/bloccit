class QuestionsController < ApplicationController
  def new
    @question = Question.new
  end

  def create
    @question = Question.new
    @question.title = params[:question][:title]
    @question.body = params[:question][:body]

    if @question.save
      flash[:notice] = "question was saved."
      redirect_to @question
    else
      flash.now[:alert] = "There was an error saving the question. Please try again."
      render :new
    end
  end

  def update
    @question = Question.find(params[:id])
    @question.title = params[:question][:title]
    @question.body = params[:question][:body]
    @question.resolved = params[:question][:resolved]

    if @question.save
      flash[:notice] = "question was updated."
      redirect_to @question
    else
      flash.now[:alert] = "There was an error updating the question. Please try again."
      render :new
    end
  end

  def edit
    @question = Question.find(params[:id])
  end

  def destroy
    @question = Question.find(params[:id])
    if @question.destroy
      flash[:notice] = "question was deleted."
      redirect_to questions_path
    else
      flash.now[:alert] = "There was an error deleting the question. Please try again."
      render :new
    end
  end

  def index
    @questions = Question.all
  end

  def show
    @question = Question.find(params[:id])

    if @question.resolved
      @class = "resolved"
      @answered = "This question has been answered"
    else
      @answered = "This question has NOT been answered"
      @class = "not_resolved"
    end
  end
end