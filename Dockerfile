# Etapa de build: compila el proyecto con Maven
FROM eclipse-temurin:21-jdk AS build
WORKDIR /app
COPY . .
# Dar permisos de ejecución al wrapper Maven
RUN chmod +x mvnw
# Compilar el proyecto sin ejecutar tests
RUN ./mvnw clean install -DskipTests

# Etapa final: solo el JAR y el JDK
FROM eclipse-temurin:21-jdk
WORKDIR /app
# Copiar el JAR generado desde la etapa de build
COPY --from=build /app/target/demo-0.0.1-SNAPSHOT.jar app.jar
# Comando de arranque
ENTRYPOINT ["java","-jar","app.jar"]
