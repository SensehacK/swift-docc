

# scheme name
TARGET_SCHEME="swifty-docc"

# temp path for docc. This should NOT be included in source control and will be deleted when the script finishes
DERIVED_DATA_PATH="$PWD/.derivedData"


# path for docs. These should be included in source control for publishing documentation.
DOCS_OUTPUT_PATH="docs"

# expected output path for the docc.archive is $DERIVED_DATA_PATH/Build/Products/Debug-iphonesimulator/$TARGET_SCHEME.doccarchive
DOCC_LOCATION=$DERIVED_DATA_PATH/Build/Products/Debug-iphonesimulator/$TARGET_SCHEME.doccarchive


echo "KAutilya ################################"
echo $DOCC_LOCATION



# Build documentation
xcodebuild docbuild \
-scheme $TARGET_SCHEME \
-derivedDataPath $DERIVED_DATA_PATH \
-destination 'generic/platform=iOS Simulator';



# Make it ready for Github Actions

xcrun docc process-archive transform-for-static-hosting \
    $DOCC_LOCATION \
    --output-path $DOCS_OUTPUT_PATH \
    --hosting-base-path "" # add your repo name later



# Redirecting to the documentation page
echo '<script>window.location.href += "/documentation/swifty_docc"</script>' > docs/index.html
