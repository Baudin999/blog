
# build-deploy.ps1

# Build the Jekyll site locally
Write-Host "Building the Jekyll site..."
bundle exec jekyll build
if ($LASTEXITCODE -ne 0) {
    Write-Error "Failed to build the Jekyll site."
    exit 1
}

# Switch to gh-pages branch (or create it if it doesn't exist)
Write-Host "Switching to gh-pages branch..."
git checkout gh-pages
if ($LASTEXITCODE -ne 0) {
    Write-Host "gh-pages branch doesn't exist. Creating a new one..."
    git checkout --orphan gh-pages
    git rm -rf .
}

# Copy _site contents to the root
Write-Host "Copying _site content to root..."
Copy-Item -Path _site/* -Destination . -Recurse -Force

# Commit and push changes
git add .
git commit -m "Deploying to gh-pages"
git push origin gh-pages
if ($LASTEXITCODE -ne 0) {
    Write-Error "Failed to push to gh-pages branch."
    exit 1
}

git checkout master

Write-Host "Deployment to gh-pages completed successfully!"
