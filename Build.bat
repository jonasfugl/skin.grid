@echo off
SET BUILD_DIR=BUILD
SET FOLDER_NAME=skin.grid

ECHO ------------------------------
echo Creating Build Folder
if exist %BUILD_DIR% rmdir %BUILD_DIR% /S /Q
md %BUILD_DIR%

ECHO ------------------------------
ECHO Building Skin Directory...
xcopy "xml" "%BUILD_DIR%\%FOLDER_NAME%\xml" /E /Q /I /Y
xcopy "colors" "%BUILD_DIR%\%FOLDER_NAME%\colors" /E /Q /I /Y
xcopy "resources" "%BUILD_DIR%\%FOLDER_NAME%\resources" /E /Q /I /Y
xcopy "fonts" "%BUILD_DIR%\%FOLDER_NAME%\fonts" /E /Q /I /Y
xcopy "language" "%BUILD_DIR%\%FOLDER_NAME%\language" /E /Q /I /Y
xcopy "playlists" "%BUILD_DIR%\%FOLDER_NAME%\playlists" /E /Q /I /Y
xcopy "shortcuts" "%BUILD_DIR%\%FOLDER_NAME%\shortcuts" /E /Q /I /Y
xcopy "extras" "%BUILD_DIR%\%FOLDER_NAME%\extras" /E /Q /I /Y
xcopy "*.xml" "%BUILD_DIR%\%FOLDER_NAME%\" /Q /I /Y
xcopy "*.txt" "%BUILD_DIR%\%FOLDER_NAME%\" /Q /I /Y
xcopy "*.png" "%BUILD_DIR%\%FOLDER_NAME%\" /Q /I /Y
xcopy "*.jpg" "%BUILD_DIR%\%FOLDER_NAME%\" /Q /I /Y
xcopy "*.md" "%BUILD_DIR%\%FOLDER_NAME%\" /Q /I /Y

ECHO ------------------------------
ECHO Creating XBT File...
md %BUILD_DIR%\%FOLDER_NAME%\media
START /B /WAIT tools\TexturePacker -dupecheck -input media\ -output %BUILD_DIR%\%FOLDER_NAME%\media\Textures.xbt

ECHO ------------------------------
ECHO Creating ZIP File...
START /B /WAIT powershell "Compress-Archive %BUILD_DIR%\%FOLDER_NAME% %BUILD_DIR%\%FOLDER_NAME%.zip -CompressionLevel NoCompression" 

echo Build Complete - Scroll Up to check for errors.
pause