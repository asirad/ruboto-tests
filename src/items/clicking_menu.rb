require 'ruboto'


import "android.view.KeyEvent"
import "android.app.Instrumentation"
import "android.util.Log"
import "android.content.Intent"


$activity.start_ruboto_activity "$clicking" do
  setTitle 'Clicking'
  
  intent = Intent.new
  intent.setAction(Intent::ACTION_MAIN)
  intent.addCategory(Intent::CATEGORY_HOME)
  $activity.startActivity(intent)
  
  Thread.new do
    sleep 10
    i = Instrumentation.new
    i.send_key_down_up_sync(KeyEvent::KEYCODE_DPAD_RIGHT)
    i.send_key_down_up_sync(KeyEvent::KEYCODE_DPAD_LEFT)
    i.send_key_down_up_sync(KeyEvent::KEYCODE_DPAD_DOWN)
    i.send_key_down_up_sync(KeyEvent::KEYCODE_DPAD_UP)
  end
  
  
  
  
end