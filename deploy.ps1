
# build-deploy.ps1

# Build the Jekyll site locally
Write-Host "Building the Jekyll site..."
bundle exec jekyll build
if ($LASTEXITCODE -ne 0) {
    Write-Error "Failed to build the Jekyll site."
    exit 1
}

# Ensure master is clean
git stash

# Switch to gh-pages branch (or create it if it doesn't exist)
Write-Host "Switching to gh-pages branch..."
git checkout gh-pages
if ($LASTEXITCODE -ne 0) {
    Write-Host "gh-pages branch doesn't exist. Creating a new one..."
    git checkout --orphan gh-pages
}

git pull origin gh-pages

# Clean up everything in the gh-pages branch to mirror _site exactly
Write-Host "Cleaning up gh-pages branch..."
git rm -rf .

# Copy _site contents to the root (excluding .git folder if it exists)
Write-Host "Copying _site content to root..."
Copy-Item -Path _site/* -Destination . -Recurse -Force -Exclude ".git"

# Commit and push changes
git add .
git commit -m "Deploying to gh-pages"
git push origin gh-pages
if ($LASTEXITCODE -ne 0) {
    Write-Error "Failed to push to gh-pages branch."
    exit 1
}

git checkout master

# Restore any stashed changes
git stash pop

Write-Host "Deployment to gh-pages completed successfully!"git checkout master

Write-Host "Deployment to gh-pages completed successfully!"