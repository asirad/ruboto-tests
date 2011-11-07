require 'ruboto'

ruboto_import_widgets :ListView, :TextView, :LinearLayout


$activity.start_ruboto_activity "$ruboto_tests" do
  setTitle 'Main Page'


  scripts_path = '/mnt/sdcard/Android/data/com.ruboto.tests/files/scripts'


  @list = []
  @list[0] = []
  @list[1] = []
  @list[0] << "Scrolling 1"
  @list[1] << "#{scripts_path}/items/scrolling_1.rb"
  @list[0] << "Scrolling 2"
  @list[1] << "#{scripts_path}/items/scrolling_2.rb"
  @list[0] << "Clicking menu"
  @list[1] << "#{scripts_path}/items/clicking_menu.rb"


  setup_content do
    linear_layout :orientation => LinearLayout::VERTICAL do
      @list_view = list_view :list => @list[0], :id => 100
    end
  end
  

  handle_item_click do |adapter_view, view, pos, item_id|
    load @list[1][ @list[0].find_index(view.getText.strip) ]
  end


end
