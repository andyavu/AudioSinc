package com.bahbahdoh.cs4990app;

import androidx.annotation.NonNull;
import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugins.GeneratedPluginRegistrant;

import android.content.Context;
import android.media.AudioManager;
import android.media.AudioTrack;
import android.media.AudioRecord;
import android.media.MediaPlayer;
import android.os.Handler;
import android.media.audiofx.Equalizer;

public class MainActivity extends FlutterActivity
{
  private static final String CHANNEL = "booni.platform";

  @Override
  public void configureFlutterEngine(@NonNull FlutterEngine flutterEngine)
  {
//    GeneratedPluginRegistrant.registerWith(flutterEngine);
    new MethodChannel(flutterEngine.getDartExecutor().getBinaryMessenger(), CHANNEL)
            .setMethodCallHandler(
                    (call, result) -> {
                      // Note: this method is invoked on the main thread.

                    }
            );
  }


  private void offsetAudio(double seconds)
  {
//    int delayMS = (int) (seconds * 1000);
//    double delayMS = seconds * 1000;



    // delay
    if(seconds < 0)
    {

    }
    // advance
    else if(seconds > 0)
    {

    }
    else
    {
      // nothing because seconds == 0
    }
  }
}
