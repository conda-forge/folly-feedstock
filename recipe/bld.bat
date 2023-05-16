cmake -G "NMake Makefiles" ^
      -DBoost_NO_BOOST_CMAKE=ON ^
      -D DBUILD_SHARED_LIBS=OFF ^
      -D CMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX% ^
      %SRC_DIR%
if errorlevel 1 exit 1

nmake
if errorlevel 1 exit 1

nmake install
if errorlevel 1 exit 1
