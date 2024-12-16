FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /src

COPY ["MarineAnimalsAPI/MarineAnimalsAPI.csproj", "MarineAnimalsAPI/"]
COPY ["MarineAnimalsAPI.Core/MarineAnimalsAPI.Core.csproj", "MarineAnimalsAPI.Core/"]
RUN dotnet restore "MarineAnimalsAPI/MarineAnimalsAPI.csproj"

COPY . .
RUN dotnet build "MarineAnimalsAPI/MarineAnimalsAPI.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "MarineAnimalsAPI/MarineAnimalsAPI.csproj" -c Release -o /app/publish

FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "MarineAnimalsAPI.dll"]