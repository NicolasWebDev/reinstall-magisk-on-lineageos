setup() {
    load 'test_helper/bats-support/load'
    load 'test_helper/bats-assert/load'
    DIR="$(cd "$(dirname "$BATS_TEST_FILENAME")" >/dev/null 2>&1 && pwd)"
}

test_get_build_url_vayu() { #@test
    load ../reinstall-magisk-on-lineageos
    function curl() { cat "$DIR/builds_download_page_vayu.fixture.html"; }
    export -f curl

    run get_build_url

    assert_output https://mirrorbits.lineageos.org/full/vayu/20220603/lineage-18.1-20220603-nightly-vayu-signed.zip
}

test_get_build_url_alioth() { #@test
    load ../reinstall-magisk-on-lineageos
    export PHONE_ANDROID_NAME=alioth
    function curl() { cat "$DIR/builds_download_page_alioth.fixture.html"; }
    export -f curl

    run get_build_url

    assert_output https://mirrorbits.lineageos.org/full/alioth/20220604/lineage-19.1-20220604-nightly-alioth-signed.zip
}
