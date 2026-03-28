@echo off
echo 🎮 Fluffy CS2 Updater - Quick Build & Upload
echo ===========================================

REM Build the project
echo 📦 Building project...
cd "C:\Users\jcdro\Downloads\CS2-Delusions-FullSource (1)\CS2 Delusions"

REM Build main project
"C:\Program Files\Microsoft Visual Studio\2022\Community\MSBuild\Current\Bin\MSBuild.exe" "CS2 External.sln" /p:Configuration=Release /p:Platform=x64 /m /verbosity:minimal

REM Build .NET loader
dotnet build FluffyLoader/FluffyLoader.csproj --configuration Release --runtime win-x64 --self-contained --verbosity minimal

echo ✅ Build completed!

REM Prepare upload folder
echo 📁 Preparing upload folder...
cd "C:\Users\jcdro\Downloads\Fluffy-Cs2Updater"

REM Clean and create release folder
if exist Release rmdir /s /q Release
mkdir Release

REM Copy only executables
echo 📋 Copying executables...
copy "C:\Users\jcdro\Downloads\CS2-Delusions-FullSource (1)\CS2 Delusions\bin\user\CS2 External.exe" "Release\CS2 External.exe"
copy "C:\Users\jcdro\Downloads\CS2-Delusions-FullSource (1)\CS2 Delusions\bin\user\Fluffy-Launcher.exe" "Release\Fluffy-Launcher.exe"
copy "C:\Users\jcdro\Downloads\CS2-Delusions-FullSource (1)\CS2 Delusions\FluffyLoader\bin\Release\net6.0\win-x64\Fluffy-Cs2 Loader.exe" "Release\Fluffy-Cs2 Loader.exe"

echo ✅ Files copied!

REM Upload to GitHub
echo 🚀 Uploading to GitHub...
git add .
git commit -m "Auto-update build - %date% %time%"
git push origin master

echo 🎉 Update completed!
echo 📍 Repository: https://github.com/9crf69djm5-creator/Fluffy-Cs2Updater
pause
