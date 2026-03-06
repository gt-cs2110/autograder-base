#! /usr/bin/env bash

# Create temporary directory
ROOT_DIR=$(mktemp -d)
SOURCE_DIR="$ROOT_DIR/source"
RESULTS_DIR="$ROOT_DIR/results"

mkdir "$SOURCE_DIR"
mkdir "$RESULTS_DIR"

# Upload a basic test harness into it
cat > "$SOURCE_DIR/zucchini.toml" << EOF
name = "Test"

[[components]]
name = "Main"
weight = 100
backend = { kind = "MultiCommandGrader" }
parts = [
    { summary = "Passes", command = "true", weight = 1 }
]
EOF
mkdir "$SOURCE_DIR/grading-files"

# Check it all runs!
docker run --platform linux/amd64 --rm -v "$SOURCE_DIR:/autograder/source" -v "$RESULTS_DIR:/autograder/results" --entrypoint /autograder/run_autograder "$TEST_TAG" \
    && [ "$(jq '.score' "$RESULTS_DIR/results.json")" = 100.0 ]

jq . "$RESULTS_DIR/results.json"
RESULT=$?

if [ ! -z "$ROOT_DIR" ]; then
    rm -rf "$ROOT_DIR"
fi

exit $RESULT