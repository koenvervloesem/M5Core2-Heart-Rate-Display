# M5Core2 Heart Rate Display

[![Build status](https://github.com/koenvervloesem/M5Core2-Heart-Rate-Display/workflows/Build/badge.svg)](https://github.com/koenvervloesem/M5Core2-Heart-Rate-Display/actions)
[![GitHub license](https://img.shields.io/github/license/koenvervloesem/M5Core2-Heart-Rate-Display.svg)](https://github.com/koenvervloesem/M5Core2-Heart-Rate-Display/blob/main/LICENSE)

This Arduino sketch shows the heart rate sent by a Bluetooth Low Energy heart rate sensor on the display of an [M5Stack Core 2](https://m5stack.com/products/m5stack-core2-esp32-iot-development-kit).

This is a proof of concept with basic functionality. It supports any heart rate sensor that implements the Heart Rate Measurement characteristic of Bluetooth Low Energy.

![M5Stack Core2 running the heart rate display code](https://github.com/koenvervloesem/M5Core2-Heart-Rate-Display/raw/main/m5core2-heart-rate.jpg)

## Requirements

* Prepare your [Arduino IDE for the M5Stack Core2](https://docs.m5stack.com/#/en/arduino/arduino_core2_development).
* Install the [Core2ez](https://github.com/M5ez/Core2ez) library as a ZIP file.
* Install the [M5Core2](https://github.com/m5stack/M5Core2) and [NimBLE-Arduino](https://github.com/h2zero/NimBLE-Arduino) libraries from the library manager.

## Building with arduino-cli
There's a Makefile to ease the installation of the platform and libraries if you are using [arduino-cli](https://github.com/arduino/arduino-cli):

```console
make platform
make libraries
```

Then you can build the sketch:

```console
make build
```

After this, you can upload the binary firmware file to your M5Stack Core2:

```console
arduino-cli upload -p /dev/ttyUSB0 -b m5stack:esp32:m5stack-core2 -i $PWD/build/M5Core2-Heart-Rate-Display.ino.bin
```

## TODO

* Improve the user interface.
* Let the user choose the heart rate sensor to connect with.
* Send heart rate measurements to MQTT for further processing and visualization.

## License

This project is provided by [Koen Vervloesem](mailto:koen@vervloesem.eu) as open source software with the MIT license. See the [LICENSE](LICENSE) file for more information.

The source code is based on h2zero's [NimBLE_Client.ino](https://github.com/h2zero/NimBLE-Arduino/blob/master/examples/NimBLE_Client/NimBLE_Client.ino) example from the NimBLE-Arduino library.
