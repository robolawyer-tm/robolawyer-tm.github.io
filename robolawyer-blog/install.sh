cd ~/repos/robolawyer-tm.github.io

# Unzip fresh
unzip robolawyer-blog.zip

# Copy your existing files in
cp index.html robolawyer-blog/public/index.html
cp robots.txt robolawyer-blog/public/robots.txt
cp llms.txt robolawyer-blog/public/llms.txt
cp llms-full.txt robolawyer-blog/public/llms-full.txt

# Add .gitignore
cat > robolawyer-blog/.gitignore << 'EOF'
node_modules/
dist/
.astro/
EOF

# Test locally
cd robolawyer-blog
npm install
npm run dev
