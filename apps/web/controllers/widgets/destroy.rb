module Web::Controllers::Widgets
  class Destroy
    include Web::Action

    def call(params)
      WidgetRepository.new.delete(params[:id])

      redirect_to routes.widgets_path
    end
  end
end
