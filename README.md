# Meshtastic Firmware for LoRaWAN-Shuttle: HT-CT62 (ESP32-C3 + SX1262) devboard

![image1](https://github.com/friedpa/seeed-xiao-esp32c3-meshtastic/blob/main/img/2025-08-22T16_43_20.347Z-top.jpg)


Custom Meshtastic firmware for the 
**LoRaWAN-Shuttle: HT-CT62 (ESP32-C3 + SX1262) devboard** Standalone or stacked configuration with a carrier board e.g. 
AI-On-The-Edge-Cam: ESP32-S3 with PoE, SD, Camera

![Version](https://www.tindie.com/products/allexok/lora-shuttle-ht-ct62-esp32-c3-sx1262-devboard/)
![Hardware](https://img.shields.io/badge/hardware-ESP32--C3-green)
![Radio](https://img.shields.io/badge/radio-SX1262-orange)

## 📦 Hardware Requirements

- [HT-CT62 (ESP32-C3 + SX1262) devboard](https://www.tindie.com/products/allexok/lora-shuttle-ht-ct62-esp32-c3-sx1262-devboard/#specs)
- 2.54mm headers for stacking (the module has two 8 pin header)
- LoRa antenna compatible with your frequency band
- WLAN antenna (optional)

## 🔌 Hardware Setup

## Hardware Configuration

### Pin Mappings

#### HT-CT62 intern PIN mapping between ESP32-C3 and SX1262

| ESP32-C3 Pin | SX1262 Pin | Function |
|--------------|------------|----------|
| GND | GND | Ground |
| 3.3V | 3.3V | Power |
| GPIO 00 | (D6)| I2C SDA |
| GPIO 01 | (D7) | I2C SCL |
| GPIO 03 | DIO1 | LoRa Interrupt |
| GPIO 04 | BUSY | Busy Signal |
| GPIO 05 | RST | Radio Reset |
| GPIO 06 | MISO | SPI Data In |
| GPIO 07 | MOSI | SPI Data Out |
| GPIO 08 | NSS | SPI Chip Select |
| GPIO 09 | N/A | Boot User Button |
| GPIO 10 | SCK | SPI Clock |

### PIN Mapping of the module headers
The module has two 2.54mm header pinouts with 8 pins per side.

### Header H1

| Header | HT-CT62 | Function |
|--------------|------------|----------|
| Pin 1 - Not used |  |  |
| Pin 2 - Not used |  |  |
| Pin 3 - Not used |  |  |
| Pin 4 - 3.3V | Pin 12 3.3V | Power |
| Pin 5 - GND | Pin 02 GND | Ground |
| Pin 6 - GND | Pin 13 GND | Ground |
| Pin 7 - GND | Pin 21 GND | Ground |
| Pin 8 - 5V | N/A | USB Typ C - Connector |

### Header H2

| Header | HT-CT62 | Function |
|--------------|------------|----------|
| Pin 1 - RX | Pin 19 RXD | Data |
| Pin 2 - TX | Pin 20 TXD | Data |
| Pin 3 - Not used |  |  |
| Pin 4 - Not used |  |  |
| Pin 5 - Not used |  |  |
| Pin 6 - GPIO 02 | Pin 08 GPIO 02 |  |
| Pin 7 - SCL | Pin 01 GPIO 01 | I2C SCL |
| Pin 8 - SDA | Pin 00 GPIO 00 | I2C SDA |

### I2C Sensor Support
GPIO 01 (D7) and GPIO 00 (D6) are available via the SX1262 pass-through pins D6 and D7 for external I2C sensors:
- **SDA**: GPIO 00 (D6)
- **SCL**: GPIO 01 (D7)

Compatible sensors include BME280, BME680, SSD1306 displays, etc.

## 🚀 Installation

### Method 1: Web Flasher (Easiest)
1. Connect your HT-CT62 (Esp32-C3 + SX1262) devboard via USB
2. Visit [Meshtastic Web Flasher](https://flasher.meshtastic.org/)
3. Upload the `firmware-heltec_esp32c3-2.7.20.417ca86.factory.bin` file
4. Follow the on-screen instructions

### Method 2: esptool.py
```bash
# Install esptool if needed
pip install esptool

# Flash the firmware (adjust port as needed)
esptool.py --chip esp32c3 --port /dev/ttyACM0 --baud 921600 \
  write_flash 0x0 firmware-heltec_esp32c3-2.7.20.417ca86.factory.bin
```

**macOS**: Use `/dev/cu.usbmodem*` or `/dev/tty.usbmodem*`
**Windows**: Use `COM3`, `COM4`, etc.
**Linux**: Use `/dev/ttyUSB0` or `/dev/ttyACM0`

### Method 3: PlatformIO (Advanced)
Clone the "variant" files and build yourself - see build instructions in the VS Studio PlatformIO wiki.

## ⚙️ Configuration

After flashing:
1. Install the Meshtastic app on your phone ([iOS](https://meshtastic.org/docs/software/apple/installation/) / [Android](https://meshtastic.org/docs/software/android/installation/))
2. Connect via Bluetooth (initial Password: 123456)
3. Set your device name and region
4. Join or create channels

## ✨ Features

- ✅ **Full Meshtastic support** - Messaging, position sharing, telemetry
- ✅ **SX1262 LoRa radio** - Long range mesh networking
- ✅ **I2C sensor support** - GPIO00/01 available for BME280, OLED displays, etc.
- ✅ **Compact form factor** - Stackable design
- ✅ **Low power consumption** - Perfect for portable nodes

## 🔧 Adding I2C Sensors (Optional)

The module provide I2C connectivity:
- **SDA**: GPIO00 (D6)
- **SCL**: GPIO01 (D7)

Compatible sensors:
- BME280/BME680 (temperature, humidity, pressure)
- SSD1306 OLED display (128x64)
- Any I2C sensor at 3.3V (expected payload: JSON format)

Connect sensors to the pass-through pins and share 3.3V/GND.

## 📊 Specifications

- **MCU**: ESP32-C3 (RISC-V, 160MHz, 400KB SRAM, 4MB Flash)
- **Radio**: Semtech SX1262 (LoRa, -148dBm sensitivity)
- **Frequency**: 868MHz or 915MHz (region dependent)
- **Transmit Power**: Up to +22dBm
- **Bluetooth**: BLE 5.0
- **WiFi**: 2.4GHz 802.11b/g/n

## 🐛 Troubleshooting

**"Error no LoRa TX/RX possible"**
- Ensure antenna is connected to the HT-CT62
- Check power pins or USB-C Connetor are aligned/ connected correctly

**No nodes appear**
- Verify region settings match nearby nodes
- Check channel configuration
- Ensure antenna is connected
- Test range (LoRa needs line of sight for best results)

**Can't flash firmware**
- Hold BOOT button while connecting USB
- Try a different USB cable (some are power-only)
- Check port with `pio device list` or device manager

## 📚 Resources

- [Meshtastic Documentation](https://meshtastic.org/docs/)
- [HT-CT62 (Esp32-C3 + SX1262) devboard](https://www.tindie.com/products/allexok/lora-shuttle-ht-ct62-esp32-c3-sx1262-devboard)
- [Meshtastic Discord](https://discord.gg/meshtastic)

## 📝 Firmware Details

- **Version**: 2.7.20.417ca86
- **Build Date**: 2026-03-04
- **Hardware Model**: 254 (HT-CT62)
- **Radio**: SX1262 with DIO2 RF switching, 1.8V TCXO

## 🤝 Contributing

Found a bug or have a suggestion? Open an issue or submit a pull request!

## ⚖️ License

This firmware is based on [Meshtastic](https://github.com/meshtastic/firmware) (GPL-3.0).

## 🙏 Credits

- [Meshtastic Project](https://meshtastic.org/) - Open source mesh networking
- [Heltec](https://heltec.org/project/ht-ct62/) - HT-CT62 hardware
- [Prokyber](hhttps://www.tindie.com/products/allexok/lora-shuttle-ht-ct62-esp32-c3-sx1262-devboard) - LoRaWAN-Shuttle: HT-CT62 (Esp32-C3 + SX1262) devboard
- Community contributors and testers

---

**⚠️ Important**: Always use an appropriate antenna for your region and frequency. Never transmit without an antenna - this can damage the radio module!
