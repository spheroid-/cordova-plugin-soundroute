# Android notes:

To allow changing the output volume when the earpiece is active, you need to override the default volume adjustment routines.
This is done by modifying the app MainActivity.java class in following way:

Add these imports:

```
import android.content.Context;
import android.media.AudioManager;
import android.view.KeyEvent;
```

Add private member to the MainActivity class:

```
    private AudioManager audio;
```

Assign the AudioManager system service in the onCreate method:

```
        audio = (AudioManager) getSystemService(Context.AUDIO_SERVICE);
```

Override the keypress event handler by adding this method:

```
    @Override
    public boolean onKeyDown(int keyCode, KeyEvent event) {
        switch (keyCode) {
            case KeyEvent.KEYCODE_VOLUME_UP:
                audio.adjustStreamVolume(AudioManager.STREAM_MUSIC, AudioManager.ADJUST_RAISE, AudioManager.FLAG_SHOW_UI);
                return true;
      
            case KeyEvent.KEYCODE_VOLUME_DOWN:
                audio.adjustStreamVolume(AudioManager.STREAM_MUSIC, AudioManager.ADJUST_LOWER, AudioManager.FLAG_SHOW_UI);
                return true;
      
            default:
                return super.onKeyDown(keyCode, event);
        }
    }
```