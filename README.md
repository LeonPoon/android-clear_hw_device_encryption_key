# android-clear_hw_device_encryption_key

An Android executable that clears Qualcomm Secure Execution Environment (SEE) hardware key that's used for Android file encryption.

## Why

Qualcomm SEE on some devices rejects vold's attempt to set a new key if it already contains a key that had been set previously.
Unfortunately `vold` does not clear any existing key first, so if there was a leftover key then setting up a file encryption again will fail (e.g. after you formatted `/data` in TWRP) due to `vold`'s new key being rejected by SEE.

Running this binary clears the key in SEE, so that when you go to LineageOS menu to encrypt the filesystem then `vold` will later successfully set a new key.

## How (to build and run)

First, compile LineageOS. (E.g. follow https://wiki.lineageos.org/devices/h990/build.) You don't need to install the produced image into your phone but successfully getting an image means your environment is fine.

Then, clone this repo to the root of your source tree. E.g.:

```bash
cd ~/android/lineage
git clone https://github.com/LeonPoon/android-clear_hw_device_encryption_key.git
```

Build the `mymod` binary:

```bash
m mymod
```

Put it into your phone's internal sdcard via `adb`:

```
android-clear_hw_device_encryption_key/push.sh
```

Example output of push:

```
./android-clear_hw_device_encryption_key/../out/target/product/h990/system/bin/mymod: 1 file pushed, 0 skipped. 11.2 MB/s (11376 bytes in 0.001s)
```

Run `adb shell`, do `su`, then move `mymod` into `/data` and then execute it. In `adb shell`:

```bash
su
mv /storage/self/primary/mymod /data && chmod -v +x /data/mymod
/data/mymod
```

You should examine `logcat` for `mymod` messages to check whether it's successful.
