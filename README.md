# docker-keycloaked-wildfly
A Wildfly 9.0.2 server with Keycloak 1.9.1 overlay.

Purpose is
1. to include a `WEB-INF\keycloak.json` file which uses the system arguments `keycloak.xyz` like this:
```
{
  "realm": "${keycloak.realm:name-of-realm}",
  "realm-public-key": "${keycloak.realm.public.key:MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAg1+dOlifRWudVnGrDG4gSJL/iI6woEwHAxCGM5YHJKA4MnsOtciytb/Fx0Blln3Qq1NkHcm5IgbDF0gNDkUhjc6o3/EHZMxP7rb7mo4/Wx3bUtVVnV92RzYMZzZwPDOTUTYvLBxk2tF1HnniWTxVW0xEIYdrUI9sHz+1mi0/BlqAs294IFmRU4MePsHSrJ65Kf+gv7Rw+YLLLxoPq3HFMW5D6LiNOsxQUpxyAKNDyllj+GmNpGjkR/wEbjMCzphga2oFvfTSCg+3jqmNc2IsMS43A4cQ5RzasRtCXOMdVjrF/1BtA2L1fxWHGrVT1kNd3gTlAPCrU57f/WRprPvl8QIDAXYZ}",
  "bearer-only": true,
  "auth-server-url": "${keycloak.auth.server.url:http://localhost:8180}/auth",
  "ssl-required": "external",
  "resource": "name-of-client"
}
```

2. to provide the following environment variables when running the container as those will be added as system arguments to Wildfly (Those are used in the `keycloak.json` file)
  * `KEYCLOAK_REALM`
  * `ENV KEYCLOAK_REALM_PUBLIC_KEY`
  * `ENV KEYCLOAK_AUTH_SERVER_URL`
