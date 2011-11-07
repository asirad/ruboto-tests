import "android.widget.TextView"
import "android.widget.LinearLayout"
import "android.widget.ScrollView"
import "android.widget.Button"

$activity.start_ruboto_activity "$scrolling1" do
  setTitle = "111"
  
  @scroll = nil
  @direction = "down"
  
  def on_create(bundle)
    main = LinearLayout.new(self)
    main.orientation = LinearLayout::VERTICAL
    
    button = Button.new(self)
    button.text = "Click me"
    
    @scroll = ScrollView.new(self)

    layout = LinearLayout.new(self)
    layout.orientation = LinearLayout::VERTICAL

    
    text_views = []    
    100.times do |i|
      text_views << TextView.new(self)
      text_views.last.text = "----- #{"%02d" % i} -----"
      text_views.last.text_size = 64
      layout.add_view(text_views.last)
    end
    
    @scroll.add_view(layout)
    
    main.add_view(button)
    main.add_view(@scroll)
    
    self.content_view = main
    button.on_click_listener = proc { |view| scroll_down_up(view) }
  end
  
  
  def scroll_down_up(view)
    if @direction == "down"
      @scroll.fullScroll(ScrollView::FOCUS_DOWN)
      @direction = "up"
    elsif @direction == "up"
      @scroll.fullScroll(ScrollView::FOCUS_UP)
      @direction = "down"
    end
  end
  
  
end