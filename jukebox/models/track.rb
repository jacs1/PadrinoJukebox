require 'soundcloud'


class Track < ActiveRecord::Base

	def self.search_tracks(search) 
	client = Soundcloud.new(:client_id => '78d62fc09316b60c8278998d5b8268db')
	@tracks = client.get('/tracks', :q => search)

	end
end
