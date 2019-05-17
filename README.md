# Jenkins Puppeteer Docker

At geckos.io we use this to test the client/server communication between browser and Node.js.

## Build and run the docker image

- Run `npm run docker:build`
- Run `npm run docker:run`
- Open http://localhost:8080 and finish the setup
- Checkout blue ocean at http://localhost:8080/blue

## Add public Jenkins roles

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

_source: [stackoverflow.com](https://stackoverflow.com/a/43815311)_

## Badge

Add a cool badge like this

```
[![Jenkins](http://localhost:8080/buildStatus/icon?job=geckos.io%2Fmaster&style=flat-square)](http://localhost:8080/blue/organizations/jenkins/geckos.io/activity)
```

## Code Coverage with cobertura

See [medium.com](https://medium.com/@elisegev/running-tests-and-creating-code-coverage-reports-for-react-nodejs-project-continuously-with-60312b6a2dd0)
