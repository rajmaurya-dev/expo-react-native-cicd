# 🚀 Free React Native & Expo CI/CD Builder

[![GitHub Marketplace](https://img.shields.io/badge/GitHub-Marketplace-green.svg)](https://github.com/marketplace/actions/react-native-expo-builder)
[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/licenses/MIT)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)](https://github.com/TanayK07/expo-react-native-cicd/pulls)

**Save $100s monthly on Expo EAS build costs!** 🔥 Build, test, and deploy your React Native/Expo apps directly with GitHub Actions - no paid EAS subscription required.

## ✨ Key Benefits

- 💰 **Free Alternative to EAS Build Plans**: Skip the $15-100/month EAS build plans
- 🔄 **Complete CI/CD Pipeline**: Automated testing, building, and deployment
- 📱 **Multiple Build Formats**: Generate development builds, production APKs and AABs
- ☁️ **Flexible Storage Options**: Deploy to GitHub Releases, Google Drive, Zoho Drive, or any rclone-supported storage
- 🛠️ **Customizable Workflow**: Choose only the components you need
- ⚡ **Zero Configuration Option**: Get started with a single click

## 🚀 Quick Start

1. Go to the [Actions tab](../../actions) in your repository
2. Search for "React Native Expo Builder"
3. Click "Configure"
4. Commit the workflow to your repository
5. Add your Expo token in repository settings

That's it! Your next push to the main branch will trigger automatic builds.

## 📋 Configurable Options

- **Build Types**: Development builds, Production APK, Production AAB
- **Storage Destinations**: GitHub Releases, Cloud Storage (Google Drive, Zoho Drive, etc.)
- **Tests**: TypeScript checks, ESLint, Prettier
- **Triggers**: Push events, Pull requests, Manual workflow dispatch

## 🧰 Advanced Setup

For advanced configurations, check the [documentation](docs/ADVANCED.md) or use our [workflow generator](https://your-generator-url.com).

## 🤝 How It Works

1. Uses GitHub Actions' built-in runners and Expo's EAS CLI
2. Executes local builds on the runner (no EAS cloud resources)
3. Signs and packages your application
4. Uploads the build artifacts to your preferred destination

## 📚 Learn More

- [Detailed Documentation](docs/README.md)
- [Workflow Generator](https://your-generator-url.com)
- [Migration from EAS Builds](docs/MIGRATION.md)
- [Troubleshooting](docs/TROUBLESHOOTING.md)

## 📝 License

This project is [MIT](LICENSE) licensed.

---

⭐️ If this action saved you time or money, consider starring the repo!

Made with ❤️ by [Tanay Kedia](https://github.com/TanayK07)
