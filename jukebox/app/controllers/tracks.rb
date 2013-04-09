
Jukebox::App.controllers :tracks do
  
  # get :index, :map => '/foo/bar' do
  #   session[:foo] = 'bar'
  #   render 'index'
  # end

  # get :sample, :map => '/sample/url', :provides => [:any, :js] do
  #   case content_type
  #     when :js then ...
  #     else ...
  # end

  # get :foo, :with => :id do
  #   'Maps to url '/foo/#{params[:id]}''
  # end

  # get '/example' do
  #   'Hello world!'
  # end
  
  get :play do
    @track = Track.find(params[:id]) 
    client = Soundcloud.new(:client_id => '78d62fc09316b60c8278998d5b8268db') 
    @sound_cloud_widget = client.get('/oembed', :url => @track.player_url)['html']
    render 'tracks/play'
  end 

  get :search do
    render 'tracks/search'
  end

  get :index do
    render 'tracks/index'

  end

  post :search do
    @results = Track.search_tracks(params[:searchterm])
    render 'tracks/search'
    end
end
