module Web::Controllers::Widgets
  class Create
    include Web::Action

    expose :widget

    params do
      required(:widget).schema do
        required(:name).filled(:str?)
      end
    end

    def call(params)
      if params.valid?
        @widget = WidgetRepository.new.create(params[:widget])

        redirect_to routes.widgets_path
      else
        self.status = 422
      end
    end
  end
end
