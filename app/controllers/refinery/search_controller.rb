module Refinery
  class SearchController < ::ApplicationController

    # Display search results given the query supplied
    def show
      @results = Refinery::SearchEngine.search(params[:query].to_ascii, params[:page])
      @ask = params[:query]
      Searches.new(text: @ask, date: Time.now).save
      present(@page = Refinery::Page.find_by_link_url("/search"))
    end

  end
end