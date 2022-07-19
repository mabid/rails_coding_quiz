module Api
  module V1
    class TacosController < ActionController::API
      def index
        @tacos = Taco.all
        render json: @tacos, status: 200
      end

      def create
        @taco = Taco.new(taco_params)
        if @taco.save
          render json: @taco, status: :created
        else
          render json: @taco.errors, status: :unprocessable_entity
        end
      end

      def destroy
        @taco = Taco.find(params[:id])
        @taco.destroy
        head :ok
      end
      
      private

      def taco_params
        params.require(:taco).permit(:meat, :rice, :salsa, :cheese, :notes)
      end
    end
  end
end
