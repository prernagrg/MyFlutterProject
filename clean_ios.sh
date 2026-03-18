#!/bin/bash

# Navigate to the root of the Flutter project 
# (assumes the script is run from the project root)

#./clean_ios.sh



echo "Cleaning Flutter project..."
flutter clean

echo "Getting Flutter dependencies..."
flutter pub get

echo "Navigating to ios directory and cleaning CocoaPods..."
cd ios || exit

echo "Removing Podfile.lock..."
rm -rf Podfile.lock

echo "Deintegrating pods..."
pod deintegrate

echo "Installing pods and updating repo..."
pod install --repo-update

echo "Done! iOS pods have been refreshed."
