#!/bin/bash
# Activate virtual enviroment
. /appenv/bin/activate


pip download -d /build -r requirements_test.txt --no-input

# Install app test requirements
pip install --no-index -f /build -r requirements_test.txt

# Run test.sh arguments
exec $@
