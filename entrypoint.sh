#!/bin/ash

# 读取 authentication 文件
AUTH_FILE="/data/authentication"

# 检查文件是否存在
if [[ ! -f "$AUTH_FILE" ]]; then
    echo "Authentication file not found!"
    exit 1
fi

# 读取 BDUSS 和 STOKEN

# shellcheck disable=SC1090
source "$AUTH_FILE"

# 检查 BDUSS 和 STOKEN 是否存在
if [[ -z "$BDUSS" && -z "$STOKEN" ]]; then
    echo "Neither BDUSS nor STOKEN is set!"
    exit 1
else
    echo "At least one of BDUSS or STOKEN is set."
fi

BaiduPCS login -bduss="$BDUSS" -stoken="$STOKEN"

top