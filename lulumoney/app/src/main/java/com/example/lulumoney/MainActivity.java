package com.example.lulumoney;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.view.View;

import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.android.FlutterActivityLaunchConfigs;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.embedding.engine.FlutterEngineCache;
import io.flutter.embedding.engine.dart.DartExecutor;

public class MainActivity extends AppCompatActivity {
    public FlutterEngine flutterEngine;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
    }

    public void buttonOpenShopping(View view) {

        // Instantiate a FlutterEngine.
        flutterEngine = new FlutterEngine(this);

        // Configure an initial route.
        flutterEngine.getNavigationChannel().setInitialRoute("/");

        // Start executing Dart code to pre-warm the FlutterEngine.
        flutterEngine.getDartExecutor().executeDartEntrypoint(
                DartExecutor.DartEntrypoint.createDefault()
        );

        // Cache the FlutterEngine to be used by FlutterActivity.
        FlutterEngineCache
                .getInstance()
                .put("open_connectshop", flutterEngine);

        startActivity(FlutterActivity
                .withCachedEngine("open_connectshop")
                .backgroundMode(FlutterActivityLaunchConfigs.BackgroundMode.transparent)
                .build(this)
        );
    }

    public void buttonOpenBill(View view) {

        // Instantiate a FlutterEngine.
        flutterEngine = new FlutterEngine(this);

        // Configure an initial route.
        flutterEngine.getNavigationChannel().setInitialRoute("/bill");

        // Start executing Dart code to pre-warm the FlutterEngine.
        flutterEngine.getDartExecutor().executeDartEntrypoint(
                DartExecutor.DartEntrypoint.createDefault()
        );

        // Cache the FlutterEngine to be used by FlutterActivity.
        FlutterEngineCache
                .getInstance()
                .put("open_connectshop", flutterEngine);

        startActivity(FlutterActivity
                .withCachedEngine("open_connectshop")
                .backgroundMode(FlutterActivityLaunchConfigs.BackgroundMode.transparent)
                .build(this)
        );
    }
}