REM Build a shared library for the "folly" package or
REM build a static library for the "folly-static" package.
if "%PKG_NAME%" == "folly" (
  set BUILD_SHARED_LIBS=ON
)
else (
  set BUILD_SHARED_LIBS=OFF
)

cmake -GNinja ^
      -DBoost_NO_BOOST_CMAKE=ON ^
      -DBUILD_SHARED_LIBS=%BUILD_SHARED_LIBS% ^
      -DCMAKE_BUILD_TYPE=RelWithDebInfo ^
      -DCMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX% ^
      -DBOOST_ROOT=%LIBRARY_PREFIX% ^
      -DBOOST_LINK_STATIC=OFF ^
      -DCMAKE_C_FLAGS="/DGLOG_NO_ABBREVIATED_SEVERITIES /DNOMINMAX" ^
      -DCMAKE_CXX_FLAGS="/DGLOG_NO_ABBREVIATED_SEVERITIES /DNOMINMAX" ^
      %SRC_DIR%
if errorlevel 1 exit 1

ninja
if errorlevel 1 exit 1

ninja install
if errorlevel 1 exit 1
