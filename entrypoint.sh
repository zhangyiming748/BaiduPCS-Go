#!/bin/ash

# 检查 BDUSS 和 STOKEN 是否存在
if [[ -z "$BDUSS" && -z "$STOKEN" ]]; then
    echo "Neither BDUSS nor STOKEN is set!"
    exit 1
else
    echo "At least one of BDUSS or STOKEN is set."
fi

BaiduPCS login -bduss="$BDUSS" -stoken="$STOKEN"

top