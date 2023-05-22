cmake -G "NMake Makefiles" ^
      -DBoost_NO_BOOST_CMAKE=ON ^
      -DBUILD_SHARED_LIBS=OFF ^
      -DCMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX% ^
      -DBOOST_ROOT=%LIBRARY_PREFIX% ^
      -DBOOST_LINK_STATIC=OFF ^
      -DCMAKE_C_FLAGS="/DGLOG_NO_ABBREVIATED_SEVERITIES" ^
      -DCMAKE_CXX_FLAGS="/DGLOG_NO_ABBREVIATED_SEVERITIES" ^
      %SRC_DIR%
if errorlevel 1 exit 1

nmake
if errorlevel 1 exit 1

nmake install
if errorlevel 1 exit 1
