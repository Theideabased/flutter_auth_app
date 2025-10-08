# Flutter Web Deployment to Vercel

## Build Configuration

This project uses a custom build script to compile Flutter for web deployment.

### Build Settings (Set in Vercel Dashboard)

**Go to: Project Settings → Build & Development Settings**

```
Framework Preset: Other
Build Command: chmod +x build.sh && ./build.sh
Output Directory: build/web
Install Command: (leave empty)
```

### Manual Build Command (Alternative)

If the build script fails, use this as Build Command:

```bash
git clone https://github.com/flutter/flutter.git -b stable --depth 1 && export PATH="$PATH:$PWD/flutter/bin" && flutter config --enable-web --no-analytics && flutter pub get && flutter build web --release --web-renderer canvaskit
```

### Environment Variables

The following environment variables are loaded from `.env` file:
- AUTH0_DOMAIN
- AUTH0_CLIENT_ID
- AUTH0_CUSTOM_SCHEME

### Troubleshooting

**Build fails with "command not found":**
- Ensure build.sh has execute permissions
- Try: `sh build.sh` instead

**Build fails during compile:**
- Check that all dependencies in pubspec.yaml are web-compatible
- Verify .env file exists and is committed

**Auth0 not working after deployment:**
- Add your Vercel URL to Auth0 Allowed Callback URLs
- Add your Vercel URL to Auth0 Allowed Logout URLs
- Add your Vercel URL to Auth0 Allowed Web Origins

### Build Process

1. Clone/update Flutter SDK (stable branch)
2. Add Flutter to PATH
3. Enable web support
4. Install dependencies (flutter pub get)
5. Build for web (flutter build web --release)
6. Output to: build/web

### Deployment

Push to main branch → Vercel auto-deploys

---

For more details, see: VERCEL_DEPLOYMENT.md
