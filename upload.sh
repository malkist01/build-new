#!/usr/bin/env bash

DATE=$(date +"%Y%m%d-%H%M")
BUILD_BY="Build with ❤️ by Malkist"
export BUILD_BY
DEVICE="Redmi Note 4"
export DEVICE
CODENAME="mido"
export CODENAME
ID="-1002287610863"
export ID
TOKEN="7596553794:AAGoeg4VypmUfBqfUML5VWt5mjivN5-3ah8"
export TOKEN

tgs() {
    MD5=$(md5sum "$1" | cut -d' ' -f1)
    curl -fsSL -X POST -F document=@"$1" https://api.telegram.org/bot"${TOKEN}"/sendDocument \
        -F "chat_id=${ID}" \
        -F "parse_mode=Markdown" \
        -F "caption=$2 | *MD5*: \`$MD5\`"
}

# Push kernel to channel
push() {
    ZIP=$(echo *.zip)
    tgs "${ZIP}" "Build took $((DIFF / 60)) minute(s) and $((DIFF % 60)) second(s). | For *${DEVICE} (${CODENAME})* | ${KBUILD_COMPILER_STRING} | ${BUILD_BY}" 
}

push
