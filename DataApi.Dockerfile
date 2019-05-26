FROM mcr.microsoft.com/dotnet/core/aspnet:2.2 AS runner
WORKDIR /app

ENV ASPNETCORE_ENVIRONMENT=Production
ENV ASPNETCORE_URLS http://*:5000

FROM mcr.microsoft.com/dotnet/core/sdk:2.2 AS builder
ARG Configuration=Release
WORKDIR /src
COPY . .
RUN dotnet restore

WORKDIR /src/DataApi
RUN dotnet build -c $Configuration -o /app

FROM builder AS publish
ARG Configuration=Release
RUN dotnet publish -c $Configuration -o /app

FROM runner AS final
WORKDIR /app
COPY --from=publish /app .

ENTRYPOINT ["dotnet", "Quorum.DataApi.dll"]
