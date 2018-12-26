#!bin/bash
grep -E -r -h -s "^ACPI.*" /var/log/ > errors.log
cat errors.log

