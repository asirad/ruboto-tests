activity Java::com.ruboto.tests.RubotoTests
import "android.view.KeyEvent"
import "android.app.Instrumentation"


setup do |activity|
  start = Time.now
  loop do
    @list_view = activity.findViewById(100)
    break if @list_view || (Time.now - start > 60)
    sleep 1
  end
  assert @list_view
end


test('initial setup') do |activity|
  i = Instrumentation.new
  i.send_key_down_up_sync(KeyEvent::KEYCODE_DPAD_DOWN)
  true
end

