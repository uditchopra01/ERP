#!/bin/sh

# location of java executable
if [ -f "$JAVA_HOME/bin/java" ]; then
  JAVA="$JAVA_HOME/bin/java"
else
  JAVA=java
fi

top="$(cd "$(dirname "$0")"; echo "$PWD")"
find_jar() {
    set -- "$top"/framework/base/lib/ant-launcher-*.jar
    if [ $# = 1 ] && [ -e "$1" ]; then
        echo "$1"
    else
        echo "Couldn't find ant-launcher.jar" 1>&2
        exit 1
    fi
}
"$JAVA" -jar "$(find_jar)" -lib "$top/framework/base/lib/ant" "$@"

