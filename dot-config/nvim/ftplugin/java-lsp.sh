JAR="/Library/Java/jdt-language-server-1.9.0-202203031534/plugins/org.eclipse.equinox.launcher_*.jar"

#GRADLE_HOME='$HOME/.sdkman/candidates/gradle/current/bin/gradle' java \
GRADLE_HOME='/usr/local/bin/gradle' java \
  -agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=1044 \
  -javaagent:/Users/apple/Shubharanjan/code/java/jars/lombok.jar \
  -Xbootclasspath/Users/apple/Shubharanjan/code/java/jars/lombok.jar \
  -Declipse.application=org.eclipse.jdt.ls.core.id1 \
  -Dosgi.bundles.defaultStartLevel=4 \
  -Declipse.product=org.eclipse.jdt.ls.core.product \
  -Dlog.protocol=true \
  -Dlog.level=ALL \
  -Xms1g \
  -Xmx2G \
  -jar $(echo "$JAR") \
  -configuration "/Library/Java/jdt-language-server-1.9.0-202203031534/config_mac" \
  -data "$1" \
  --add-modules=ALL-SYSTEM \
  --add-opens java.base/java.util=ALL-UNNAMED \
  --add-opens java.base/java.lang=ALL-UNNAMED
