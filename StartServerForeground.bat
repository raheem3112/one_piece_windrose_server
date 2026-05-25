@echo off
pushd %~dp0%

:: Starts WindroseServer with visible console window for log monitoring
start /abovenormal R5\Binaries\Win64\WindroseServer-Win64-Shipping.exe -log

popd
