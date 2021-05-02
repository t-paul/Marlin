#!/bin/bash -e

ENV=rambo
PORT=/dev/ttyACM0

COMMIT=$(git describe --tags)
BUILDDIR=".pio/build/${ENV}"

rm -f "${BUILDDIR}"/firmware.*
platformio run -e "$ENV" --target clean
platformio run -e "$ENV"
cp "${BUILDDIR}"/firmware.hex "firmware-${COMMIT}.hex"
#platformio run --target upload -e "$ENV" --upload-port "$PORT"
