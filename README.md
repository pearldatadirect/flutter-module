# optimus-prime

Its flutter module project which consume the connectshop-op API and facilitate to commerce module inside lulu money 

## Create and take gradle build for android

flutter create -t module {{module}}

inside {{module}}/.android/ run ./gradlew flutter:assembleDebug


## Adding to android lulu money

1, in the setting.gradle include 

setBinding(new Binding([gradle: this]))
evaluate(new File(
        settingsDir.parentFile,
        'optimus/.android/include_flutter.groovy'
))

2, in app/build.gradle

inside dependency add implementation project(':flutter')

Flutter add to app official documentation
[documentation](https://docs.flutter.dev/development/add-to-app).
