module Admin::V1
  class HomeController < ApiController

    def index
      render json: { message: 'Muita coisa pronta, é foda de entender!!!!'}
    end
  end
end
