---
title: "Scripting API: Jira Entities"
key: jibrok-studio-jira
excerpt: Users, Projects, Fields, Components, Versions, Boards, Sprints, Links
category: administration
tags:
  - doc
  - cloud
  - scripting
  - api
  - jira
---

* TOC
{:toc}

> Part of the [Scripting API](/docs/jibrok-studio-jira/scripting-api) reference.
> [Issues](/docs/jibrok-studio-jira/scripting-api-issues) | **Jira Entities** | [Utilities](/docs/jibrok-studio-jira/scripting-api-utilities) | [Smart Values](/docs/jibrok-studio-jira/scripting-api-smart-values)

## Users

Look up and search for Jira users.

| Method | Description |
|--------|-------------|
| `Users.current()` | Get the current user |
| `Users.get(accountId)` | Get user by account ID |
| `Users.find(query)` | Search users by name/email |
| `Users.findAssignable(project, query?)` | Find users assignable to a project |

```js
const me = await Users.current()
log(me.displayName)

const user = await Users.get("5b10ac8d82e05b22cc7d4ef5")
log(user.emailAddress)

const devs = await Users.find("john")
const assignable = await Users.findAssignable("PROJ", "alice")
```

### User wrapper

`Users.current()` and `Users.get(accountId)` return User wrapper objects with typed properties. Also accessible via `issue.assigneeUser` and `issue.reporterUser` on RichIssue objects.

| Property | Description |
|----------|-------------|
| `displayName` | User display name |
| `accountId` | Atlassian account ID |
| `emailAddress` | User email address |
| `avatarUrl` | Avatar URL (48x48) |
| `active` | Is account active |
| `timeZone` | User timezone |
| `locale` | User locale |

| Method | Description |
|--------|-------------|
| `toString()` | Returns displayName or accountId |
| `toJSON()` | Plain object representation |
| `equals(other)` | Compare by accountId |

```js
const user = await Users.current()
log(user.displayName)
log(user.timeZone)

const issue = await Issues.get("TEST-1")
log(issue.assigneeUser?.displayName)
log(issue.reporterUser?.equals(user))
```

---

## Projects

Access Jira project data.

| Method | Description |
|--------|-------------|
| `Projects.get(key)` | Get project by key. Returns RichProject |
| `Projects.list()` | List all accessible projects |

### RichProject methods

| Method | Description |
|--------|-------------|
| `project.getComponents()` | Get project components |
| `project.getVersions()` | Get project versions |
| `project.getStatuses()` | Get project statuses |
| `project.getRoles()` | Get project roles |

```js
const project = await Projects.get("PROJ")
log(project.name)

const components = await project.getComponents()
const versions = await project.getVersions()

const projects = await Projects.list()
for (const p of projects) {
  log(p.key + ": " + p.name)
}
```

### Project wrapper

`Projects.get(key)` returns a Project wrapper with typed properties and async methods. Also accessible via `issue.projectObj` on RichIssue objects.

| Property | Description |
|----------|-------------|
| `key` | Project key |
| `name` | Project name |
| `id` | Project ID |
| `projectTypeKey` | Project type (software, etc.) |
| `description` | Project description |
| `lead` | Project lead (User wrapper or null) |
| `url` | Project URL |

| Method | Description |
|--------|-------------|
| `getComponents()` | Get project components |
| `getVersions()` | Get project versions |
| `getStatuses()` | Get project statuses |
| `getRoles()` | Get project roles |
| `toString()` | Returns project key |
| `equals(other)` | Compare by key |

```js
const proj = await Projects.get("PROJ")
log(proj.name)
log(proj.lead?.displayName)
const comps = await proj.getComponents()

// Access from issue
const issue = await Issues.get("TEST-1")
log(issue.projectObj?.name)
```

---

## Fields

Work with Jira field metadata.

| Method | Description |
|--------|-------------|
| `Fields.list()` | Get all fields |
| `Fields.get(nameOrId)` | Get field by name or ID |
| `Fields.id(name)` | Resolve field name to its ID |

```js
const fields = await Fields.list()

const priority = await Fields.get("Priority")
log(priority.id)

// Resolve custom field name to ID
const fieldId = await Fields.id("Story Points")
log(fieldId)  // e.g., "customfield_10016"
```

---

## Components

CRUD operations on project components.

| Method | Description |
|--------|-------------|
| `Components.get(id)` | Get component by ID |
| `Components.create(projectKey, name, fields?)` | Create a component |
| `Components.update(id, fields)` | Update a component |
| `Components.delete(id)` | Delete a component |

```js
const comp = await Components.create("PROJ", "Backend", {
  description: "Backend services"
})

await Components.update(comp.id, { description: "Updated" })

const fetched = await Components.get(comp.id)
log(fetched.name)

await Components.delete(comp.id)
```

---

## Versions

Manage project versions (releases).

| Method | Description |
|--------|-------------|
| `Versions.get(id)` | Get version by ID |
| `Versions.create(projectId, name, fields?)` | Create a version |
| `Versions.update(id, fields)` | Update a version |
| `Versions.release(id)` | Release a version |

```js
const version = await Versions.create("10001", "v2.0", {
  description: "Major release"
})

await Versions.update(version.id, { description: "Updated" })

await Versions.release(version.id)
```

---

## Boards

Access Jira Software boards.

| Method | Description |
|--------|-------------|
| `Boards.get(boardId)` | Get board by ID |
| `Boards.list(options?)` | List boards |
| `Boards.getSprints(boardId, state?)` | Get sprints for a board |
| `Boards.getIssues(boardId, options?)` | Get issues on a board |

```js
const boards = await Boards.list({ projectKeyOrId: "PROJ" })
const board = await Boards.get(1)

// Get active sprints
const sprints = await Boards.getSprints(1, "active")
for (const s of sprints) {
  log(s.name + ": " + s.state)
}

// Get board issues
const issues = await Boards.getIssues(1, { maxResults: 20 })
```

---

## Sprints

Work with Jira Software sprints.

| Method | Description |
|--------|-------------|
| `Sprints.get(sprintId)` | Get sprint by ID |
| `Sprints.getIssues(sprintId, options?)` | Get issues in a sprint |
| `Sprints.moveIssues(sprintId, issueKeys)` | Move issues to a sprint |

```js
const sprint = await Sprints.get(10)
log(sprint.name)

const issues = await Sprints.getIssues(10)

// Move issues to sprint
await Sprints.moveIssues(10, ["TEST-1", "TEST-2", "TEST-3"])
```

---

## Links

Get information about issue link types.

| Method | Description |
|--------|-------------|
| `Links.types()` | Get all issue link types (id, name, inward, outward) |

```js
const linkTypes = await Links.types()
for (const lt of linkTypes) {
  log(`${lt.name}: ${lt.inward} / ${lt.outward}`)
}
// Example output:
// Blocks: is blocked by / blocks
// Duplicate: is duplicated by / duplicates
// Relates: relates to / relates to
```

---

## Next steps

- [Scripting API: Issues](/docs/jibrok-studio-jira/scripting-api-issues) - Search, create, update, and transition issues
- [Scripting API: Utilities](/docs/jibrok-studio-jira/scripting-api-utilities) - Adf, DateUtils, Arrays, Strings, CSV
- [Use Cases](/docs/jibrok-studio-jira/use-cases) - Practical scripting examples
