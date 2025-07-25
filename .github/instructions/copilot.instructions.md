---
applyTo: "**"
---

# Lambda TypeScript Template - Copilot Instructions

This is a Copier template for generating AWS Lambda functions using TypeScript. The template creates a complete serverless function with infrastructure-as-code, CI/CD pipeline, and testing setup.

## Project Structure & Conventions

### Template Files

- All template files use `.jinja` extension for Copier templating
- Template variables are defined in `copier.yml`
- Use Jinja2 templating syntax: `{{ variable_name }}` for substitution

### Core Technologies

- **Language**: TypeScript with strict type checking
- **Runtime**: Node.js 18+ for AWS Lambda
- **Testing**: Jest with ts-jest preset
- **Linting**: ESLint with TypeScript rules
- **Formatting**: Prettier with standardized configuration
- **Infrastructure**: Terraform for AWS resources
- **CI/CD**: GitHub Actions with AWS deployment

### Code Organization

#### Source Code (`src/`)

- `index.ts.jinja` - Main Lambda handler with API Gateway integration
- Follow AWS Lambda handler signature: `(event, context) => Promise<APIGatewayProxyResult>`
- Use proper TypeScript types from `@types/aws-lambda`
- Implement HTTP method routing (GET, POST, PUT, DELETE)
- Include comprehensive error handling and logging

#### Tests (`tests/`)

- `index.test.ts.jinja` - Unit tests for Lambda handler
- `setup.ts.jinja` - Jest configuration and AWS SDK mocking
- Use descriptive test names and comprehensive coverage
- Mock AWS services and external dependencies

#### Infrastructure (`terraform/`)

- `main.tf.jinja` - Terraform configuration using shared infrastructure module
- `variables.tf.jinja` - Input variables for customization
- Deploy to multiple regions (us-east-1, us-west-2)
- Use external module: `github.com/radix2779/lambda-api-infra`

### Configuration Files

#### Package Management

- `package.json.jinja` - Dependencies and npm scripts
- Include both production and development dependencies
- Standard scripts: build, dev, test, lint, package, local

#### TypeScript Configuration

- `tsconfig.json.jinja` - Strict TypeScript settings targeting ES2022
- Enable all strict mode checks and additional safety features
- Exclude test files from compilation output

#### Code Quality

- `.eslintrc.js.jinja` - ESLint with TypeScript recommended rules
- `.prettierrc.jinja` - Consistent code formatting
- `jest.config.js.jinja` - Jest testing configuration with coverage

#### Build & Deployment

- `Makefile` - Simple development commands
- `.github/workflows/deploy.yml.jinja` - Complete CI/CD pipeline

### Template Variables (copier.yml)

When working with template files, use these variables:

- `service_name` - Lambda service name (kebab-case, validated)
- `service_description` - Brief service description
- `github_repo` - GitHub repository name
- `lambda_memory` - Memory allocation (128-10240 MB)

### Development Patterns

#### Lambda Handler Pattern

```typescript
export const handler = async (
  event: APIGatewayProxyEvent,
  context: Context
): Promise<APIGatewayProxyResult> => {
  // Implement HTTP method routing
  // Include proper error handling
  // Return standardized responses
};
```

#### Response Format

- Use consistent response structure with statusCode, headers, body
- Include CORS headers for API Gateway integration
- Proper JSON serialization and error handling

#### Testing Strategy

- Unit tests for all handler methods
- Mock AWS SDK and external dependencies
- Test both success and error scenarios
- Include proper TypeScript type checking in tests

### Code Quality Standards

#### TypeScript

- Use strict type checking with no implicit any
- Prefer explicit return types for functions
- Use proper AWS Lambda types from official packages
- Enable all recommended TypeScript ESLint rules

#### Error Handling

- Catch and properly format all errors
- Use appropriate HTTP status codes
- Include detailed logging for debugging
- Return user-friendly error messages

#### Documentation

- Include comprehensive README with setup instructions
- Document all configuration options
- Provide examples for common use cases
- Maintain up-to-date dependency information

### Deployment & Infrastructure

#### Multi-Region Strategy

- Deploy to us-east-1 and us-west-2 by default
- Use shared infrastructure module for consistency
- Environment-specific configuration through variables

#### CI/CD Pipeline

- Run tests, linting, and building on all PRs
- Deploy only from main branch
- Upload artifacts and update Lambda function code
- Use proper AWS credential management

### Best Practices

#### Security

- Use least privilege IAM roles
- Deploy in private VPC subnets
- Validate input data and sanitize outputs
- Follow AWS security best practices

#### Performance

- Optimize bundle size for faster cold starts
- Use appropriate memory allocation
- Implement proper logging and monitoring
- Consider connection reuse for database/API calls

#### Maintenance

- Keep dependencies up to date
- Use semantic versioning
- Maintain backward compatibility in APIs
- Document breaking changes clearly

When modifying this template:

1. Always update corresponding test files
2. Maintain Jinja2 template syntax consistency
3. Validate template variables in copier.yml
4. Update documentation for any new features
5. Test template generation with various inputs
