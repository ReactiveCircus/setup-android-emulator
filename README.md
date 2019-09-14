# Setup Android Emulator

A GitHub action that installs, creates and starts an Android emulator in headless mode for testing.

## Inputs

### `api-level`

**Required** The API level of the system image to be used for the emulator. E.g. `23` for Android 6.0 Marshmallow, `29` for Android 10.

## Example usage

```
uses: reactivecircus/setup-android-emulator@v1.0.0
with:
  api-level: 29
```

