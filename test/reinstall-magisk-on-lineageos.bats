#! /bin/bash

setup() {
    load 'test_helper/bats-support/load'
    load 'test_helper/bats-assert/load'
    DIR="$(cd "$(dirname "$BATS_TEST_FILENAME")" >/dev/null 2>&1 && pwd)"
}

test_get_build_boot_img_url_vayu() { #@test
    load ../reinstall-magisk-on-lineageos
    function get_device_name() { echo vayu; }
    export -f get_device_name
    function curl() { cat "$DIR/builds_download_json_vayu.fixture.json"; }
    export -f curl

    run get_boot_img_url

    assert_output https://mirrorbits.lineageos.org/full/vayu/20230331/boot.img
}

test_get_build_boot_img_url_alioth() { #@test
    load ../reinstall-magisk-on-lineageos
    function get_device_name() { echo alioth; }
    export -f get_device_name
    function curl() { cat "$DIR/builds_download_json_alioth.fixture.json"; }
    export -f curl

    run get_boot_img_url

    assert_output https://mirrorbits.lineageos.org/full/alioth/20230401/boot.img
}

test_get_device_downloads_page() { #@test
    load ../reinstall-magisk-on-lineageos
    function get_device_name() { echo vayu; }
    export -f get_device_name

    run get_device_downloads_json

    assert_output https://download.lineageos.org/api/v2/devices/vayu/builds
}
