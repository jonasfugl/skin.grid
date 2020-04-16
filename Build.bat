@echo off
SET BUILD_DIR=BUILD
SET FOLDER_NAME=skin.grid

ECHO ------------------------------
echo Creating grid Build Folder
rmdir %BUILD_DIR% /S /Q
md %BUILD_DIR%

ECHO ------------------------------
ECHO Building Skin Directory...
xcopy "xml" "%BUILD_DIR%\%FOLDER_NAME%\xml" /E /Q /I /Y
xcopy "colors" "%BUILD_DIR%\%FOLDER_NAME%\colors" /E /Q /I /Y
xcopy "resources" "%BUILD_DIR%\%FOLDER_NAME%\resources" /E /Q /I /Y
xcopy "fonts" "%BUILD_DIR%\%FOLDER_NAME%\fonts" /E /Q /I /Y
xcopy "language" "%BUILD_DIR%\%FOLDER_NAME%\language" /E /Q /I /Y
xcopy "language\resource.language.bg_bg" "%BUILD_DIR%\%FOLDER_NAME%\language\resource.language.bg_bg" /E /Q /I /Y
xcopy "language\resource.language.ca_es" "%BUILD_DIR%\%FOLDER_NAME%\language\resource.language.ca_es" /E /Q /I /Y
xcopy "language\resource.language.cs_cz" "%BUILD_DIR%\%FOLDER_NAME%\language\resource.language.cs_cz" /E /Q /I /Y
xcopy "language\resource.language.da_dk" "%BUILD_DIR%\%FOLDER_NAME%\language\resource.language.da_dk" /E /Q /I /Y
xcopy "language\resource.language.de_de" "%BUILD_DIR%\%FOLDER_NAME%\language\resource.language.de_de" /E /Q /I /Y
xcopy "language\resource.language.en_gb" "%BUILD_DIR%\%FOLDER_NAME%\language\resource.language.en_gb" /E /Q /I /Y
xcopy "language\resource.language.es_es" "%BUILD_DIR%\%FOLDER_NAME%\language\resource.language.es_es" /E /Q /I /Y
xcopy "language\resource.language.fi_fi" "%BUILD_DIR%\%FOLDER_NAME%\language\resource.language.fi_fi" /E /Q /I /Y
xcopy "language\resource.language.fr_fr" "%BUILD_DIR%\%FOLDER_NAME%\language\resource.language.fr_fr" /E /Q /I /Y
xcopy "language\resource.language.gl_es" "%BUILD_DIR%\%FOLDER_NAME%\language\resource.language.gl_es" /E /Q /I /Y
xcopy "language\resource.language.it_it" "%BUILD_DIR%\%FOLDER_NAME%\language\resource.language.it_it" /E /Q /I /Y
xcopy "language\resource.language.ko_ko" "%BUILD_DIR%\%FOLDER_NAME%\language\resource.language.ko_ko" /E /Q /I /Y
xcopy "language\resource.language.lt_lt" "%BUILD_DIR%\%FOLDER_NAME%\language\resource.language.lt_lt" /E /Q /I /Y
xcopy "language\resource.language.nb_no" "%BUILD_DIR%\%FOLDER_NAME%\language\resource.language.nb_no" /E /Q /I /Y
xcopy "language\resource.language.nl_nl" "%BUILD_DIR%\%FOLDER_NAME%\language\resource.language.nl_nl" /E /Q /I /Y
xcopy "language\resource.language.pt_br" "%BUILD_DIR%\%FOLDER_NAME%\language\resource.language.pt_br" /E /Q /I /Y
xcopy "language\resource.language.pl_pl" "%BUILD_DIR%\%FOLDER_NAME%\language\resource.language.pl_pl" /E /Q /I /Y
xcopy "language\resource.language.pt_pt" "%BUILD_DIR%\%FOLDER_NAME%\language\resource.language.pt_pt" /E /Q /I /Y
xcopy "language\resource.language.ro_ro" "%BUILD_DIR%\%FOLDER_NAME%\language\resource.language.ro_ro" /E /Q /I /Y
xcopy "language\resource.language.ru_ru" "%BUILD_DIR%\%FOLDER_NAME%\language\resource.language.ru_ru" /E /Q /I /Y
xcopy "language\resource.language.sr_rs" "%BUILD_DIR%\%FOLDER_NAME%\language\resource.language.sr_rs" /E /Q /I /Y
xcopy "language\resource.language.sv_se" "%BUILD_DIR%\%FOLDER_NAME%\language\resource.language.sv_se" /E /Q /I /Y
xcopy "language\resource.language.zh_cn" "%BUILD_DIR%\%FOLDER_NAME%\language\resource.language.zh_cn" /E /Q /I /Y
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
START /B /WAIT powershell "Compress-Archive %BUILD_DIR%\%FOLDER_NAME% %BUILD_DIR%\%FOLDER_NAME%.zip"

echo Build Complete - Scroll Up to check for errors.
pause