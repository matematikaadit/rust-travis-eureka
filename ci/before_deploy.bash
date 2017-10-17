# Building and packaging for release

set -ex

build() {
    cargo build --target "$TARGET" --release --verbose
}

package() {
    local tempdir=$(mktemp -d 2>/dev/null || mktemp -d -t tmp)
    local out_dir=$(pwd)
    local package_name="${PROJECT_NAME}-${TRAVIS_TAG}-${TARGET}"

    # create a "staging" directory
    mkdir "$tempdir/$package_name"
    mkdir "$tempdir/$package_name/autocomplete"

    # copying the main binary
    cp "target/${TARGET}/release/${PROJECT_NAME}" "$tempdir/$package_name/"
    # docs and license
    # cp README.md "$tempdir/$package_name"
    # cp LICENSE "$tempdir/$package_name"
    # various autocomplete
    # cp target/$TARGET/release/build/${PROJECT_NAME}-*/out/${PROJECT_NAME}.bash_completion "$tempdir/$package_name/autocomplete"
    # cp target/$TARGET/release/build/${PROJECT_NAME}-*/out/${PROJECT_NAME}.fish "$tempdir/$package_name/autocomplete"
    # cp target/$TARGET/release/build/${PROJECT_NAME}-*/out/_${PROJECT_NAME} "$tempdir/$package_name/autocomplete"

    # archiving
    pushd "$tempdir"
    tar czf "$out_dir/$package_name.tar.gz" *
    popd
    rm -r "$tempdir"
}

main() {
    build
    package
}

main