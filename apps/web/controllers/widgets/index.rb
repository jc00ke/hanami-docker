module Web::Controllers::Widgets
  class Index
    include Web::Action

    expose :widgets

    def call(params)
      @widgets = WidgetRepository.new.all
    end
  end
end
