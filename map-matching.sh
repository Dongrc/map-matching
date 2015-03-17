JAR=$(ls target/map-matching-*-dependencies.jar)

if [ "$JAVA" = "" ]; then
 JAVA=java
fi

if [ ! -f "$JAR" ]; then
  mvn -DskipTests=true install assembly:single
  JAR=$(ls target/map-matching-*-dependencies.jar)
fi

exec "$JAVA" $JAVA_OPTS -jar $JAR "$@"