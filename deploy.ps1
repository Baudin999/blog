
# Ensure the script stops on the first error
$ErrorActionPreference = "Stop"

Write-Host "Building the Jekyll site..."
Invoke-Expression "bundle exec jekyll build"

# Stash any local changes
Invoke-Expression "git stash"

# Switch to the gh-pages branch
Invoke-Expression "git checkout gh-pages"

# Remove all files and directories except for .git
Invoke-Expression "git rm -qr ."

# Copy all content from _site to the current directory
Copy-Item -Path _site/* -Destination . -Recurse -Force

# Remove _site directory
Remove-Item -Path _site -Recurse -Force

# Add all changes to git
Invoke-Expression "git add ."

# Commit the changes
Invoke-Expression 'git commit -m "changed"'

# Push to the gh-pages branch on the origin remote
Invoke-Expression "git push origin gh-pages"

# Switch back to the master branch
Invoke-Expression "git checkout master"

# Pop stashed changes back onto the working directory
Invoke-Expression "git stash pop"
# build-deploy.ps1
