# Jenkins Puppeteer Docker

At geckos.io we use this to test the client/server communication between browser and Node.js.

## Build and run the docker image

- Run `npm run docker:build`
- Run `npm run docker:run`
- Open http://localhost:8080 and finish the setup
- Checkout blue ocean at http://localhost:8080/blue

## Setting up jenkins

- Add some NodeJS installations to `Jenkins > Global Tool Configuration`

## Install nodejs 12

_You only have to do this as long as nodejs 12 is not available through the nodejs plugin._

- Download URL **https://nodejs.org/dist/v12.1.0/node-v12.1.0-linux-x64.tar.gz**
- Subdirectory **node-v12.1.0-linux-x64**

![Install nodejs 12](readme/install-nodejs12.png)

## Using Jest

Use `npm install -D jest jest-puppeteer`

```js
// jest.config.js
module.exports = {
  preset: 'jest-puppeteer'
}
```

```js
// jest-puppeteer.config
module.exports = {
  launch: {
    args: ['--no-sandbox', '--disable-setuid-sandbox']
  }
}
```

# Add public Jenkins roles

Use the [Role-based Authorization Strategy](https://plugins.jenkins.io/role-strategy) to manage it.

- Navigate to the "Manage and Assign Roles" view
- Add a new global role, "Public" for example
- Add only the "Overall" "Read" permission, nothing else
- Add a new Project Role with a relevant name and pattern that matches the job you want to filter for
- Add the "Job" "Read" permission to the new Project Role
- Navigate to the "Assign Roles" view
- Add user/group "Anonymous" to global roles
- Add Anonymous to the project role you created

Use a regex like `geckos\.io[\w\/-]*` to match the project name (geckos.io) and its branches (geckos.io/master).

<small>source: [stackoverflow.com](https://stackoverflow.com/a/43815311)</small>
