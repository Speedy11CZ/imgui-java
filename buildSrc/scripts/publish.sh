#!/bin/bash

BASEDIR=$(dirname "$0")
cd $BASEDIR/../.. || exit

echo '> Publishing Modules...'
echo '>> Module [imgui-app]'
./gradlew imgui-app:publishImguiPublicationToRajceRepository
echo '>> Module [imgui-lwjgl3]'
./gradlew imgui-lwjgl3:publishImguiPublicationToRajceRepository
echo '>> Module [imgui-binding]'
./gradlew imgui-binding:publishImguiPublicationToRajceRepository

echo '> Publishing Natives...'
echo '>> Natives: [windows, freetype]'
./gradlew imgui-binding-natives:publishImguiPublicationToRajceRepository -PdeployType=windows -Pfreetype=true
echo '>> Natives: [windows]'
./gradlew imgui-binding-natives:publishImguiPublicationToRajceRepository -PdeployType=windows -Pfreetype=false
echo '>> Natives: [linux, freetype]'
./gradlew imgui-binding-natives:publishImguiPublicationToRajceRepository -PdeployType=linux -Pfreetype=true
echo '>> Natives: [linux]'
./gradlew imgui-binding-natives:publishImguiPublicationToRajceRepository -PdeployType=linux -Pfreetype=false
echo '>> Natives: [macOS, freetype]'
./gradlew imgui-binding-natives:publishImguiPublicationToRajceRepository -PdeployType=macos -Pfreetype=true
echo '>> Natives: [macOS]'
./gradlew imgui-binding-natives:publishImguiPublicationToRajceRepository -PdeployType=macos -Pfreetype=false
