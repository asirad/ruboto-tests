require 'ruboto'

ruboto_import_widgets :Button, :LinearLayout, :TextView, :ScrollView


$activity.start_ruboto_activity "$scrolling2" do
  setTitle 'First Test'
  @direction = "down"

  setup_content do
    linear_layout(:orientation => LinearLayout::VERTICAL) do
      @button = button :text => "Click me"
      @scroll = scroll_view do
        linear_layout(:orientation => LinearLayout::VERTICAL) do
          100.times { |i| text_view :text => "---------- Line #{i}-----------", :id => "10#{i}".to_i }
        end
      end
    end
  end


  handle_click do |view|
    if view.getText == "Click me"
      scroll_down_up
    end
  end

  
  def scroll_down_up
    if @direction == "down"
      @scroll.fullScroll(ScrollView::FOCUS_DOWN)
      @direction = "up"
    elsif @direction == "up"
      @scroll.fullScroll(ScrollView::FOCUS_UP)
      @direction = "down"
    end
  end
  
  
end