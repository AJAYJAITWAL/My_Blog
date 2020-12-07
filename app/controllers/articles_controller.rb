class ArticlesController < ApplicationController
    #layout 'ajay'
    #http_basic_authenticate_with name: "ajay", password: "ajay", except: [:index, :show]
    
    def search 
        if params[:search].blank?  
            redirect_to(articles_path, alert: "Empty field!") and return  
        else
            @parameter = params[:search].downcase  
            @articles = Article.all.where("lower(name) LIKE :search", search: @parameter)    

        end  
    end
    def index
        # @articles = Article.all
        @articles = Article.paginate(page: params[:page], per_page: 5)
    end
    def show
        @article = Article.find(params[:id])  

    end

    def new
        @article = Article.new
       
    end
       
    def edit
        @article = Article.find(params[:id])
        
    end
    def create
        # @article = Article.new(article_params)
        @article = current_user.articles.new(article_params)
 
        if @article.save
        #   redirect_to @article
        # else
        #     redirect_to 'new'
        # end
        respond_to do |format|
          format.html { redirect_to @article, notice: 'Article was successfully created' }
          format.js
        end  
        else
          render 'new'
        end
    end
    def update
        @article = Article.find(params[:id])
       
        if @article.update(article_params)
          redirect_to @article
        else
            render action: "edit"
        end
    
    end
    def destroy
        @article = Article.find(params[:id])
        @article.destroy
     
        #redirect_to articles_path
        respond_to do |format|
        
          format.html { respond_to article_params, notice: 'Article was successfully remove '}
          format.json { head :no_content }
          format.js
        end
    end
    
    private
    def article_params
      params.require(:article).permit(:title, :text)#, :email, images: [ ]
    end 
    
end
