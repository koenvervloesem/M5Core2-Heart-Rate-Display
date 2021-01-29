SHELL := /usr/bin/env bash

BUILD_DIR = "${PWD}/build"
BOARD = m5stack:esp32:m5stack-core2
CORE_VERSION = 1.0.5
SKETCH = M5Core2-Heart-Rate-Display.ino

.PHONY: build clean format lint libraries platform requirements

build:
	arduino-cli compile -b $(BOARD) --build-path $(BUILD_DIR) $(SKETCH)

clean:
	rm -r $(BUILD_DIR)

format:
	clang-format -i $(SKETCH)

lint:
	diff $(SKETCH) <(clang-format $(SKETCH)) 1>&2

libraries:
	arduino-cli lib install M5Core2 NimBLE-Arduino
	arduino-cli config set library.enable_unsafe_install true
	arduino-cli lib install --git-url https://github.com/M5ez/Core2ez

platform:
	arduino-cli config add board_manager.additional_urls https://m5stack.oss-cn-shenzhen.aliyuncs.com/resource/arduino/package_m5stack_index.json
	arduino-cli core update-index
	arduino-cli core install m5stack:esp32@$(CORE_VERSION)

requirements:
	pip3 install -r requirements.txt
