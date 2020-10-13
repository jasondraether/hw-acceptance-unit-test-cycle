require 'rails_helper'

describe MoviesController do 
  describe "#oddness(count)" do 
    it "returns odd if count is odd" do 
      expect(subject.oddness(3)).to eq("odd")
    end
    it "returns even if count is even" do 
      expect(subject.oddness(4)).to eq("even")
    end 
  end 
end 

describe Movie do 
  describe "#find_similar_directors(director)" do
    
    test_movies = [{:title => 'Aladdin', :rating => 'G', :release_date => '25-Nov-1992', :director => 'Dr. Walker'},
    	  {:title => 'The Terminator', :rating => 'R', :release_date => '26-Oct-1984', :director => 'Dr. Walker'},
    	  {:title => 'When Harry Met Sally', :rating => 'R', :release_date => '21-Jul-1989', :director => 'Dr. Walker'},
      	{:title => 'The Help', :rating => 'PG-13', :release_date => '10-Aug-2011', :director => 'NOT Dr. Walker'},
      	{:title => 'The Incredibles', :rating => 'PG', :release_date => '5-Nov-2004', :director => 'NOT Dr. Walker'}
  	 ]
  	 
  	test_movies.each do |movie|
      Movie.create!(movie)
    end
    
    new_movie_params = {:title => 'My Movie', :rating => 'PG', :release_date => '1-Jan-2001', :director => 'Dr. Walker'}
    Movie.create!(new_movie_params)
    
    it "should find movies by the same director" do 
      similar_movies = Movie.find_similar_directors(new_movie_params[:director])
      similar_movies.each do |movie|
        expect(movie.director).to eq('Dr. Walker')
      end 
    end 
    it "should not find movies by different directors" do 
      similar_movies = Movie.find_similar_directors(new_movie_params[:director])
      similar_movies.each do |movie|
        expect(movie.director).not_to eq('NOT Dr. Walker')
      end 
    end 
  end 
end 