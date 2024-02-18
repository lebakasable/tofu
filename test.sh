#!/usr/bin/env bash

BOBA="./bin/boba"

echo "[INFO] $(sha1sum $BOBA)"

for file in $(find tests/*.bb -maxdepth 1 -not -type d); do
  # Compile
  echo -n "[TEST] $(sha1sum $file).. "
  $BOBA --verify-memory $file > /dev/null

  # Get metadata
  DESCRIPTION="$(grep '^# Description:' $file | cut -d: -f2-)"
  ARGS="$(grep '^# Args:' $file | cut -d: -f2-)"
  EXPECTED_EXIT_CODE="$(
    printf "%b" "$(grep '^# Exit code:' $file | cut -d: -f2-)"
  )"
  EXPECTED_STDOUT="$(
    printf "%b" "$(grep '^# Stdout:' $file | cut -d: -f2-)"
  )"
  EXPECTED_STDERR="$(
    printf "%b" "$(grep '^# Stderr:' $file | cut -d: -f2-)"
  )"

  OUTPUT_FILE="./${file//.bb/}"

  # Run test
  EXIT_CODE="$($OUTPUT_FILE $ARGS > /dev/null 2>&1; echo $?)"
  STDOUT="$($OUTPUT_FILE $ARGS 2>/dev/null)"
  STDERR="$($OUTPUT_FILE $ARGS 2>&1 1>/dev/null)"

  # Verify results
  SUCCESS=1
  if [ "$EXIT_CODE" != "$EXPECTED_EXIT_CODE" ]; then
    echo "[FAIL] Test: $DESCRIPTION. Exit code: $EXIT_CODE (not $EXPECTED_EXIT_CODE)"
    SUCCESS=0
  fi

  if [ "$STDOUT" != "$EXPECTED_STDOUT" ]; then
    echo "[FAIL] Test: $DESCRIPTION. Stdout: $STDOUT (not $EXPECTED_STDOUT)"
    SUCCESS=0
  fi

  if [ "$STDERR" != "$EXPECTED_STDERR" ]; then
    echo "[FAIL] Test: $DESCRIPTION. Stderr: $STDERR (not $EXPECTED_STDERR)"
    SUCCESS=0
  fi

  if [[ "$SUCCESS" -eq 1 ]]; then
    echo "OK"
  fi

  # Cleanup
  rm $OUTPUT_FILE

  if [[ "$SUCCESS" -eq 0 ]]; then
    echo "Test failed!"
    exit 1
  fi
done

echo "All tests OK!"
