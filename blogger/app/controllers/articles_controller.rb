class ArticlesController < ApplicationController
	include ArticlesHelper

	def index
		@articles = Article.all
	end

	def show
		@article = Article.find(params[:id])
	end

	def new
		@article = Article.new
	end

	def create
		@article = Article.new(article_params)
		@article.save

		flash.notice = "Article '#{@article.title}' Created!"

		redirect_to article_path(@article)
	end

	def edit
		@article = Article.find(params[:id])
	end

	def update
		@article = Article.find(params[:id])
		@article.update(article_params)

		flash.notice = "Article '#{@article.title}' Updated!"

		redirect_to article_path(@article)
	end

	def destroy
		# 1st try:
		# Article.find(params[:id]).destroy


		@article = Article.find(params[:id])
		flash.notice = "Article '#{@article.title}' Deleted!"
		# article_title = @article.title
		@article.destroy
		# flash.notice = "Article '#{article_title}' Deleted!"

		redirect_to articles_path
	end
end
