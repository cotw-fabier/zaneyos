{ pkgs ? import <nixpkgs> {} }:

let
  buildToolsVersion = "33.0.2";
  androidComposition = pkgs.androidenv.composeAndroidPackages {
    buildToolsVersions = [ buildToolsVersion ];
    platformVersions = [ "33" ];
    abiVersions = [ "arm64-v8a" ];
  };
  androidSdk = androidComposition.androidsdk;
in
pkgs.mkShell {
  buildInputs = [
    pkgs.flutter
    androidSdk
    pkgs.jdk17
  ];

  shellHook = ''
    export ANDROID_SDK_ROOT=${androidSdk}/libexec/android-sdk
  '';

  nixpkgs.config = {
    android_sdk.accept_license = true;
    allowUnfree = true;
  };
}
