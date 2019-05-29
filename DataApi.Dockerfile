FROM mcr.microsoft.com/dotnet/core/sdk:2.2 AS publisher
ARG Configuration=Release
WORKDIR /src
COPY . .

WORKDIR /src/DataApi

RUN dotnet publish -c $Configuration -o /app



FROM mcr.microsoft.com/dotnet/core/aspnet:2.2 AS runner

ENV ASPNETCORE_ENVIRONMENT=Production
ENV ASPNETCORE_URLS http://*:5000

WORKDIR /app
COPY --from=publisher /app .

ENTRYPOINT ["dotnet", "Quorum.DataApi.dll"]
