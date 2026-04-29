# Deployment

Project: `so-smart-2025-26`

This repository is prepared for two Cloud Build triggers:

- `develop` -> `.cloudbuild/staging.yaml` -> Cloud Run service `sosmart-web-staging`
- `main` -> `.cloudbuild/production.yaml` -> Cloud Run service `sosmart-web`

Frontend-to-backend routing:

- the browser should call relative `/api/...` paths
- the web service should proxy `/api` to the backend Cloud Run service
- during frontend deploy, Cloud Build resolves the backend service URL from Cloud Run
- the frontend Cloud Run service receives it as `BACKEND_ORIGIN`

Recommended setup in GCP:

1. Create one Artifact Registry Docker repository named `sosmart` in `europe-west1`.
2. Deploy the matching backend service first so its Cloud Run URL already exists.
3. In Cloud Run, connect this GitHub repository.
4. Create one trigger for `develop` using `.cloudbuild/staging.yaml`.
5. Create one trigger for `main` using `.cloudbuild/production.yaml`.

These build files expect the application code and `Dockerfile` at repository root.
The runtime container should render its Nginx config from `BACKEND_ORIGIN` so `/api` is proxied to the backend service.
