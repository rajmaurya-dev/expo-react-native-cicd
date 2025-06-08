#!/bin/bash

# Navigate to the script directory from anywhere
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
ROOT_DIR="$SCRIPT_DIR"
WEBAPP_DIR="$ROOT_DIR/webapp"

echo "Root directory: $ROOT_DIR"
echo "Webapp directory: $WEBAPP_DIR"

# Create examples directory if it doesn't exist
mkdir -p "$ROOT_DIR/examples"

# Check if webapp directory exists
if [ ! -d "$WEBAPP_DIR" ]; then
  echo "Error: Webapp directory not found at $WEBAPP_DIR"
  exit 1
fi

# Navigate to the webapp directory
cd "$WEBAPP_DIR"
echo "Current directory: $(pwd)"

# Check if the workflow-tester.js exists
if [ ! -f "scripts/workflow-tester.js" ]; then
  echo "Error: workflow-tester.js not found in $(pwd)/scripts/"
  echo "Creating the file..."
  
  # Create the scripts directory if it doesn't exist
  mkdir -p "scripts"
  
  # Create the workflow-tester.js file
  cat > "scripts/workflow-tester.js" << 'EOL'
#!/usr/bin/env node

const fs = require('fs');
const path = require('path');
const { program } = require('commander');

// Define the output directory for workflows - point to the examples folder in the project root
const WORKFLOWS_DIR = path.join(process.cwd(), '..', 'examples');

// Import the workflow generator
const workflowGeneratorPath = path.join(process.cwd(), 'app', 'utils', 'workflowGenerator');
const { generateWorkflowYaml } = require(workflowGeneratorPath);

// Set up the CLI program
program
  .name("workflow-tester")
  .description("Generate and test React Native & Expo CI/CD workflows")
  .version("1.0.0");

// Helper function to generate all valid workflows
async function generateAllWorkflows(outputDir, limit) {
  // Create directory if it doesn't exist
  const exampleWorkflowsDir = path.resolve(outputDir);
  if (!fs.existsSync(exampleWorkflowsDir)) {
    fs.mkdirSync(exampleWorkflowsDir, { recursive: true });
  }

  // Define all valid combinations of form values
  const validCombinations = {
    storageTypes: ["github-release", "zoho-drive", "google-drive", "custom"],
    buildTypes: [
      ["dev"], 
      ["prod-apk"], 
      ["prod-aab"], 
      ["dev", "prod-apk"], 
      ["dev", "prod-apk", "prod-aab"]
    ],
    tests: [
      ["typescript"], 
      ["eslint"], 
      ["prettier"], 
      ["typescript", "eslint"], 
      ["typescript", "eslint", "prettier"]
    ],
    triggers: [
      ["push-main"], 
      ["pull-request"], 
      ["manual"], 
      ["push-main", "pull-request"], 
      ["push-main", "pull-request", "manual"]
    ],
    advancedOptions: [
      {
        iOSSupport: false,
        publishToExpo: false,
        publishToStores: false,
        jestTests: false,
        rntlTests: false,
        renderHookTests: false,
        caching: true,
        notifications: false,
      },
      {
        iOSSupport: true,
        publishToExpo: false,
        publishToStores: false,
        jestTests: false,
        rntlTests: false,
        renderHookTests: false,
        caching: true,
        notifications: false,
      },
      {
        iOSSupport: false,
        publishToExpo: true,
        publishToStores: false,
        jestTests: true,
        rntlTests: false,
        renderHookTests: false,
        caching: true,
        notifications: true,
      },
      {
        iOSSupport: true,
        publishToExpo: true,
        publishToStores: true,
        jestTests: true,
        rntlTests: true,
        renderHookTests: true,
        caching: true,
        notifications: true,
      }
    ]
  };

  const filePaths = [];
  let count = 0;

  // Generate all valid combinations
  for (const storageType of validCombinations.storageTypes) {
    for (const buildTypeArray of validCombinations.buildTypes) {
      for (const testArray of validCombinations.tests) {
        for (const triggerArray of validCombinations.triggers) {
          for (const advancedOpts of validCombinations.advancedOptions) {
            // If a limit is provided and we've reached it, stop generating
            if (limit && count >= limit) {
              return filePaths;
            }

            // Create a FormValues object
            const formValues = {
              storageType: storageType,
              buildTypes: buildTypeArray,
              tests: testArray,
              triggers: triggerArray,
              advancedOptions: advancedOpts
            };

            // Generate the YAML
            const yamlContent = generateWorkflowYaml(formValues);

            // Create a unique filename based on configuration
            const filename = `workflow_${storageType}_${buildTypeArray.join('-')}_${triggerArray.join('-')}_ios-${advancedOpts.iOSSupport}_${count}.yml`;
            const filePath = path.join(exampleWorkflowsDir, filename);

            // Write the file
            fs.writeFileSync(filePath, yamlContent);
            filePaths.push(filePath);
            count++;
          }
        }
      }
    }
  }

  return filePaths;
}

// Command to generate all workflows
program
  .command("generate")
  .description("Generate all valid workflow combinations")
  .option("-l, --limit <number>", "Limit the number of workflows to generate")
  .action(async (options) => {
    console.log("Generating workflow files...");
    const limit = options.limit ? parseInt(options.limit) : undefined;
    const filePaths = await generateAllWorkflows(WORKFLOWS_DIR, limit);
    console.log(`Generated ${filePaths.length} workflow files in ${WORKFLOWS_DIR}`);
  });

program.parse(process.argv);
EOL
fi

# Run the workflow generator
echo "Running workflow generator..."
node scripts/workflow-tester.js generate "$@"

echo "Done! Check the examples directory for generated workflow files."