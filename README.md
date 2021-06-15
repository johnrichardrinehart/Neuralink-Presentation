# Build Instructions
This project uses [reveal.js](https://github.com/hakimel/reveal.js/) for rendering the slides in a browser.

To build this project don't worry about using `nix`. I never got the full build to work (`nix` and `node` is
painful). You can `nix develop` if you really want. But, it should be enough to

```bash
git submodule init
git submodule update
cp -r ./src/* ./reveal.js/
cd ./reveal.js
npm install
npm start
````

for development
