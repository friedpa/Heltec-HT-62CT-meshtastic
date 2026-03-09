@echo off
REM Flash script for Lora-shuttle: HT-CT62 (Esp32-C3 + SX1262) devboard Meshtastic Firmware

echo ============================================================
echo    Meshtastic Firmware Flasher
echo    Lora-shuttle: HT-CT62 (Esp32-C3 + SX1262) devboard
echo ============================================================
echo.

REM Check for esptool
where esptool.py >nul 2>nul
if %ERRORLEVEL% NEQ 0 (
    echo [X] esptool.py not found!
    echo.
    echo Install it with: pip install esptool
    pause
    exit /b 1
)

echo [+] esptool.py found
echo.

REM Firmware file
set FIRMWARE=firmware-heltec_esp32c3-2.7.20.417ca86.factory.bin
if not exist "%FIRMWARE%" (
    echo [X] Firmware file not found: %FIRMWARE%
    pause
    exit /b 1
)

echo [+] Firmware found: %FIRMWARE%
echo.

REM Get COM port from user
echo Looking for ESP32-C3...
echo.
echo Please check Device Manager for the correct COM port.
echo Common ports: COM3, COM4, COM5, etc.
echo.
set /p PORT="Enter COM port (e.g., COM3): "

echo.
echo [!] If flashing fails:
echo    1. Hold the BOOT button on the ESP32-C3
echo    2. While holding BOOT, press and release RESET
echo    3. Release BOOT and try flashing again
echo.

pause

echo.
echo [*] Flashing firmware to %PORT%...
echo.

esptool.py --chip esp32c3 --port %PORT% --baud 921600 write_flash 0x0 "%FIRMWARE%"

echo.
echo [+] Flashing complete!
echo.
echo Next steps:
echo    1. Install Meshtastic app on your phone
echo    2. Connect via Bluetooth
echo    3. Configure your device name and region
echo    4. Start meshing!
echo.
echo Documentation: https://meshtastic.org/docs/
echo.

pause
