class MovieController < ConsumerController
  helper ApplicationHelper
layout 'newIndex'
  def index
  
    # pagination variables
    @perpage = 10
    @page = 0;
    @count = 0;
      if(params[:pg] != nil && params[:page] != "" )
        @page = params[:pg]
      end    
    @count = Movie.count_by_sql("SELECT COUNT(*) FROM movies")

    limit = ( @page.to_i != 0 ? (@page.to_i * @perpage.to_i) : @page ).to_s+","+@perpage.to_s
    
    @movies = Movie.find(:all, :order => "title ASC",:limit => limit)  
    @categories = Category.find(:all, :order => "category ASC" )      
   
  end
  
  
  def view
    @movie = Movie.find(params[:id])
    @cats =  Movie.moviecats(params[:id])
  end
  
  def catsearch
    @categories = Category.find(:all, :order => "category ASC" )      
    
    # pagination variables
    @perpage = 10
    @page = 0;
    @count = 0;
    if(params[:pg] != nil && params[:page] != "" )
        @page = params[:pg]
    end        

    @count = Movie.catsearch(params[:id],nil,nil).size
          
    @movies = Movie.catsearch(params[:id], @page, @perpage)
    @movies.map {|mov|
        class << mov
                attr_accessor :truncated
        end
        #remove DIV tag from synopsis
        str = mov.synopsis
        if str =~ /<div[^>]*>/
            str.gsub!(/<div[^>]*>/, "")
            str.gsub!(/<\/div[^>]*>/, "")
            mov.truncated = true
        else
            mov.truncated = false
        end
        mov.synopsis = str
        mov
    }
        
    render :action => 'genre'
    

  end


  def index_new

    @genre_id = params[:id]
    @sort = params[:order]

    @categories = Category.find(:all, :order => "category ASC" )
    @dd = []
    all = ['All',0]
    @dd << all
    for c in @categories
        single = [c.category,c.id]
        @dd << single
    end

   
    # pagination variables
    @perpage = 20
    @page = 0;
    @count = 0;
    if(params[:pg] != nil && params[:page] != "" )
        @page = params[:pg]
    end        

    @count = Movie.catsearch(params[:id],nil,nil, :sort=>@sort).size
#render :text => @count.inspect

    @movies = Movie.catsearch(params[:id], @page, @perpage, :sort=>@sort)

    @movies.map {|mov|
        class << mov
                attr_accessor :truncated
        end
        #remove DIV tag from synopsis
        str = mov.synopsis
        if str =~ /<div[^>]*>/
            str.gsub!(/<div[^>]*>/, "")
            str.gsub!(/<\/div[^>]*>/, "")
            mov.truncated = true
        else
            mov.truncated = false
        end
        mov.synopsis = str
        mov
    }


    @banners = Banner.find(:all)

    @banners.map {|b|
        class << b
                attr_accessor :trailer
        end
        @movie = Movie.find(b.movie_id)
        b.trailer = @movie[:trailer]
        b
    }

    # order links
    if (@genre_id == nil)
        @genre_id = '0'
    end
    if (@sort == nil)
        @sort = 'release'
    end

    if (@sort == 'release')
        @link_1 = 'Release Date'
        @link_2 = '<a href="/movie/index_new/'+@genre_id+'/title">Title</a>'
    else
        @link_1 = '<a href="/movie/index_new/'+@genre_id+'/release">Release Date</a>'
        @link_2 = 'Title'
    end
    
  end
  
end
