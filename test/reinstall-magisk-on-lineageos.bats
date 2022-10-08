#! /bin/bash

setup() {
    load 'test_helper/bats-support/load'
    load 'test_helper/bats-assert/load'
    DIR="$(cd "$(dirname "$BATS_TEST_FILENAME")" >/dev/null 2>&1 && pwd)"
}

test_get_build_url_vayu() { #@test
    load ../reinstall-magisk-on-lineageos
    function get_lineage_version() { echo 18.1-20220527-NIGHTLY-vayu; }
    export -f get_lineage_version
    function get_device_name() { echo vayu; }
    export -f get_device_name
    function curl() { cat "$DIR/builds_download_page_vayu.fixture.html"; }
    export -f curl

    run get_build_url

    assert_output https://mirrorbits.lineageos.org/full/vayu/20220527/lineage-18.1-20220527-nightly-vayu-signed.zip
}

test_get_device_downloads_page() { #@test
    load ../reinstall-magisk-on-lineageos
    function get_device_name() { echo vayu; }
    export -f get_device_name

    run get_device_downloads_page

    assert_output https://download.lineageos.org/vayu
}

test_get_build_url_alioth() { #@test
    load ../reinstall-magisk-on-lineageos
    function get_lineage_version() { echo 19.1-20220604-NIGHTLY-alioth; }
    export -f get_lineage_version
    function get_device_name() { echo alioth; }
    export -f get_device_name
    function curl() { cat "$DIR/builds_download_page_alioth.fixture.html"; }
    export -f curl

    run get_build_url

    assert_output https://mirrorbits.lineageos.org/full/alioth/20220604/lineage-19.1-20220604-nightly-alioth-signed.zip
}

test_generate_random_alnum_string_of_length_6() { #@test
    load ../reinstall-magisk-on-lineageos

    run generate_random_alnum_string_of_length_6

    assert_output --regexp '^[0-9a-zA-Z]{6}$'
}
