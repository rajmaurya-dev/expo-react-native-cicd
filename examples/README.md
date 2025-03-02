# Example Workflows

This directory contains example workflow configurations for different deployment and storage options. These examples can be used as templates for your own projects.

## Available Examples

### 1. Generalized Workflow

**File:** `generalized-workflow.yml`

The primary workflow template that works with any cloud storage provider. This is the most flexible and recommended starting point.

**Key features:**

- Cloud-agnostic storage integration
- Comprehensive build pipeline
- Skip CI functionality
- Optimized caching
- Path-ignore rules for documentation updates

### 2. GitHub Releases Workflow

**File:** `github-release-workflow.yml`

This workflow builds your React Native / Expo app and creates GitHub Releases with:

- Draft release for manual review before publishing
- Automatic changelog generation from commit messages
- Versioning based on app.json and build date
- All build artifacts (APK, AAB) attached to the release

**Key features:**

- No external storage dependencies
- Version tracking through GitHub's interface
- Easy distribution via GitHub Release URLs
- Automatic changelog generation

### 3. Zoho Drive Integration

**File:** `zoho-drive-workflow.yml`

This workflow builds your app and uploads the artifacts to Zoho Drive:

- Organized folder structure by version and build date
- Direct uploads via rclone
- Secure token-based authentication
- Support for all build variants (dev, prod-apk, prod-aab)

**Key features:**

- Cloud storage integration
- Version-based organization
- Secure configuration
- Team sharing capabilities

## How to Use These Examples

1. Choose the example that best fits your needs
2. Copy the workflow file to `.github/workflows/` in your project
3. Configure the necessary secrets in your GitHub repository settings
4. Customize the workflow as needed for your specific project

## Required Secrets

### For Generalized Workflow

- `EXPO_TOKEN`: Your Expo account token
- `CLOUD_STORAGE_TYPE`: Your cloud storage provider type (e.g., "zoho", "drive")
- `CLOUD_STORAGE_TOKEN`: Authentication token for your cloud storage
- `CLOUD_STORAGE_ROOT_ID`: Root folder ID in your cloud storage

### For GitHub Releases Workflow

- `EXPO_TOKEN`: Your Expo account token

### For Zoho Drive Integration

- `EXPO_TOKEN`: Your Expo account token
- `RCLONE_CONFIG_ZOHODRIVE_TYPE`: Set to "zoho" for Zoho Drive
- `RCLONE_CONFIG_ZOHODRIVE_TOKEN`: Authentication token for Zoho Drive
- `RCLONE_CONFIG_ZOHODRIVE_DRIVE_ID`: Root folder ID in Zoho Drive

## Customization

These workflows can be further customized for your specific needs:

- Add iOS build support
- Integrate with testing frameworks
- Add notification systems (Slack, Discord, email)
- Configure automatic app store submissions

## Contributor

Created by [Tanay Kedia](https://github.com/TanayK07)
