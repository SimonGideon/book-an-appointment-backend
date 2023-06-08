require 'rails_helper'

RSpec.describe HousesController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/houses').to route_to('houses#index')
    end

    it 'routes to #new' do
      expect(get: '/houses/new').to route_to('houses#new')
    end

    it 'routes to #show' do
      expect(get: '/houses/1').to route_to('houses#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/houses/1/edit').to route_to('houses#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/houses').to route_to('houses#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/houses/1').to route_to('houses#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/houses/1').to route_to('houses#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/houses/1').to route_to('houses#destroy', id: '1')
    end
  end
end
