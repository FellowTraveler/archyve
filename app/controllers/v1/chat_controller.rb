module V1
  class ChatController < ApiController
    def chat
      return render json: { error: "No prompt given" }, status: :bad_request if prompt.blank?

      render json: Api::ChatResponse.new(prompt, model:, augment:, api_client: @client).respond, status: :ok
    rescue StandardError => e
      render json: { error: e }, status: :internal_server_error
    end

    private

    def augment
      chat_params[:augment] == "true"
    end

    def model
      chat_params[:model]
    end

    def prompt
      chat_params[:prompt]
    end

    def chat_params
      params.slice(:prompt, :model, :augment)
    end
  end
end
