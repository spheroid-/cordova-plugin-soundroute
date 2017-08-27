package fi.palmu.soundroute;

import org.apache.cordova.CallbackContext;
import org.apache.cordova.CordovaInterface;
import org.apache.cordova.CordovaPlugin;
import org.apache.cordova.CordovaWebView;
import org.apache.cordova.PluginResult.Status;
import org.json.JSONArray;
import org.json.JSONException;

import android.content.Context;
import android.media.AudioManager;

public class PalmuSoundRoute extends CordovaPlugin{

    public boolean execute(String action, final JSONArray args, final CallbackContext callbackContext) throws JSONException {
        if ("setCurrentOutput".equals(action)) {
            cordova.getThreadPool().execute(new Runnable() {
                private AudioManager m_amAudioManager;  
                public void run() {
                    try {
                        int mode = AudioManager.MODE_NORMAL;
                        String type = args.getString(0);
                        m_amAudioManager = (AudioManager) cordova.getActivity().getSystemService(Context.AUDIO_SERVICE);

                        if (type.equals("Receiver")) {
                            mode = AudioManager.MODE_IN_CALL;
                        }

                        m_amAudioManager.setMode(mode);
                        m_amAudioManager.setSpeakerphoneOn(false);
                        callbackContext.success("Mode: " + mode);
                    } catch (JSONException e) {
                        callbackContext.error("JSONException: " + e);
                    }
                }
            });
            return true;
        }

        return false;
    }
}