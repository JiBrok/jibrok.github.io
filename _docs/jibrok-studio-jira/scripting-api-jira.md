---
title: "Scripting API: Jira Entities"
seo_title: "Jira Entities API - Users, Projects, Fields, Boards"
key: jibrok-studio-jira
excerpt: "Jira entity APIs for managing users, projects, custom fields, components, versions, boards, sprints, and issue links"
category: scripting
tags:
  - doc
  - cloud
  - scripting
  - api
  - jira
last_modified_at: 2026-03-19
date: 2026-03-16
seo:
  date_modified: 2026-03-19
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
const me = Users.current()
log(me.displayName)

const user = Users.get("5b10ac8d82e05b22cc7d4ef5")
log(user.emailAddress)

const devs = Users.find("john")
const assignable = Users.findAssignable("PROJ", "alice")
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
const user = Users.current()
log(user.displayName)
log(user.timeZone)

const issue = Issues.get("TEST-1")
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
| `Projects.validateKey(key)` | Validate a project key for creation |

### RichProject methods

| Method | Description |
|--------|-------------|
| `project.getComponents()` | Get project components |
| `project.getVersions()` | Get project versions |
| `project.getStatuses()` | Get project statuses |
| `project.getRoles()` | Get project roles |

```js
const project = Projects.get("PROJ")
log(project.name)

const components = project.getComponents()
const versions = project.getVersions()

const projects = Projects.list()
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
| `listProperties()` | List project property keys |
| `getProperty(key)` | Get project property value |
| `setProperty(key, value)` | Set project property |
| `deleteProperty(key)` | Delete project property |
| `toString()` | Returns project key |
| `equals(other)` | Compare by key |

```js
const proj = Projects.get("PROJ")
log(proj.name)
log(proj.lead?.displayName)
const comps = proj.getComponents()

// Access from issue
const issue = Issues.get("TEST-1")
log(issue.projectObj?.name)
```

---

## Fields

Work with Jira field metadata.

| Method | Description | API calls |
|--------|-------------|-----------|
| `Fields.list()` | Get all fields | 0-1 (cached) |
| `Fields.get(nameOrId)` | Get field by name or ID | 0-1 (cached) |
| `Fields.id(name)` | Resolve field name to its ID | 0-1 (cached) |
| `Fields.getOption(optionId)` | Get custom field option by ID | 1 |
| `Fields.create(data)` | Create a custom field | 1 |
| `Fields.getContexts(fieldId, opts?)` | Get contexts for a field. `opts`: `{ startAt?: number, maxResults?: number }` (paginated) | 1 |
| `Fields.createContext(fieldId, data)` | Create a context for a field | 1 |

> **Caching.** The first `Fields.list()`, `Fields.get()`, or `Fields.id()` call loads the entire field list once (1 API call) and caches it for the rest of the script execution. Subsequent calls to any of these three methods use the cached data and do not consume your API call budget. Use `Fields.id('Story Points')` or `Fields.get('Priority')` freely - there is no penalty for calling them multiple times.

```js
const fields = Fields.list()

const priority = Fields.get("Priority")
log(priority.id)

// Resolve custom field name to ID
const fieldId = Fields.id("Story Points")
log(fieldId)  // e.g., "customfield_10016"

// Create a custom field
const created = Fields.create({
  name: 'My Field',
  type: 'com.atlassian.jira.plugin.system.customfieldtypes:textfield'
})
log(created.id)

// Get and create contexts
const contexts = Fields.getContexts('customfield_10100')

// Paginate: second page of 50
const page2 = Fields.getContexts('customfield_10100', { startAt: 50, maxResults: 50 })

Fields.createContext('customfield_10100', {
  name: 'Project context',
  projectIds: ['10000']
})
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
const comp = Components.create("PROJ", "Backend", {
  description: "Backend services"
})

Components.update(comp.id, { description: "Updated" })

const fetched = Components.get(comp.id)
log(fetched.name)

Components.delete(comp.id)
```

---

## Versions

Manage project versions (releases).

| Method | Description |
|--------|-------------|
| `Versions.get(id)` | Get version by ID |
| `Versions.create(projectId, name, fields?)` | Create a version |
| `Versions.update(id, fields)` | Update a version |
| `Versions.delete(id, opts?)` | Delete a version (opts: moveFixIssuesTo, moveAffectedIssuesTo) |
| `Versions.release(id)` | Release a version |

```js
const version = Versions.create("10001", "v2.0", {
  description: "Major release"
})

Versions.update(version.id, { description: "Updated" })

Versions.release(version.id)
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
| `Boards.moveToBacklog(issueKeys)` | Move issues to backlog (remove from sprint) |

```js
const boards = Boards.list({ projectKeyOrId: "PROJ" })
const board = Boards.get(1)

// Get active sprints
const sprints = Boards.getSprints(1, "active")
for (const s of sprints) {
  log(s.name + ": " + s.state)
}

// Get board issues
const issues = Boards.getIssues(1, { maxResults: 20 })
```

---

## Sprints

Work with Jira Software sprints.

| Method | Description |
|--------|-------------|
| `Sprints.get(sprintId)` | Get sprint by ID |
| `Sprints.getIssues(sprintId, options?)` | Get issues in a sprint |
| `Sprints.moveIssues(sprintId, issueKeys)` | Move issues to a sprint |
| `Sprints.create(boardId, name, opts?)` | Create a sprint (opts: startDate, endDate, goal) |
| `Sprints.update(sprintId, fields)` | Update sprint fields (name, state, startDate, endDate, goal) |

```js
const sprint = Sprints.get(10)
log(sprint.name)

const issues = Sprints.getIssues(10)

// Move issues to sprint
Sprints.moveIssues(10, ["TEST-1", "TEST-2", "TEST-3"])
```

---

## Links

Manage issue link types and links between issues.

| Method | Description |
|--------|-------------|
| `Links.types()` | Get all issue link types (id, name, inward, outward) |
| `Links.create(typeName, inwardKey, outwardKey)` | Create a link between two issues |
| `Links.get(linkId)` | Get link by ID |
| `Links.delete(linkId)` | Delete a link |

```js
const linkTypes = Links.types()
for (const lt of linkTypes) {
  log(`${lt.name}: ${lt.inward} / ${lt.outward}`)
}

// Create a link
Links.create("Blocks", "TEST-1", "TEST-2")

// Get and delete a link
const link = Links.get(12345)
Links.delete(12345)
```

---

## Epics

Work with Jira Software epics.

| Method | Description |
|--------|-------------|
| `Epics.get(epicId)` | Get epic by ID |
| `Epics.getIssues(epicId, opts?)` | Get issues in an epic (opts: jql, maxResults, startAt) |
| `Epics.moveIssues(epicId, issueKeys)` | Move issues to an epic |
| `Epics.removeIssues(issueKeys)` | Remove issues from their epic |

```js
const epic = Epics.get(10001)
log(epic.name)

const issues = Epics.getIssues(10001, { maxResults: 50 })

// Move issues to epic
Epics.moveIssues(10001, ["TEST-1", "TEST-2"])

// Remove issues from any epic
Epics.removeIssues(["TEST-3"])
```

---

## Groups

Manage Jira groups and membership.

| Method | Description |
|--------|-------------|
| `Groups.find(query?)` | Find groups by name |
| `Groups.get(opts)` | Get a group by ID or name (opts: groupId or groupName) |
| `Groups.getBulk(opts?)` | Get groups with pagination (opts: maxResults, startAt, groupId[], groupName[]) |
| `Groups.getMembers(groupName, opts?)` | Get group members (opts: maxResults, startAt) |
| `Groups.create(name)` | Create a group |
| `Groups.addUser(groupName, accountId)` | Add user to group |
| `Groups.removeUser(groupName, accountId)` | Remove user from group |

```js
const groups = Groups.find("developers")

const members = Groups.getMembers("jira-software-users", { maxResults: 50 })
for (const m of members) {
  log(m.displayName)
}

Groups.create("new-team")
Groups.addUser("new-team", "5b10ac8d82e05b22cc7d4ef5")
Groups.removeUser("new-team", "5b10ac8d82e05b22cc7d4ef5")
```

---

## Filters

Manage saved Jira filters.

| Method | Description |
|--------|-------------|
| `Filters.get(id)` | Get filter by ID |
| `Filters.getMy()` | Get current user's filters |
| `Filters.getFavourites()` | Get current user's favourite filters |
| `Filters.create(name, jql, opts?)` | Create a filter (opts: description, favourite, etc.) |
| `Filters.update(id, fields)` | Update filter fields |
| `Filters.delete(id)` | Delete a filter |

```js
const myFilters = Filters.getMy()
for (const f of myFilters) {
  log(f.name + ": " + f.jql)
}

const filter = Filters.create("Open Bugs", "type = Bug AND status != Done", {
  description: "All unresolved bugs"
})
log(filter.id)

Filters.update(filter.id, { name: "Active Bugs" })
Filters.delete(filter.id)
```

---

## Labels

Access Jira labels.

| Method | Description |
|--------|-------------|
| `Labels.list(opts?)` | List all labels (opts: startAt, maxResults) |

```js
const labels = Labels.list({ maxResults: 100 })
for (const label of labels) {
  log(label)
}
```

---

## JQL

Validate and autocomplete JQL queries.

| Method | Description |
|--------|-------------|
| `JQL.validate(jql)` | Validate JQL syntax and return parse results |
| `JQL.autocomplete()` | Get JQL autocomplete suggestions (field names, functions) |

```js
const result = JQL.validate("project = TEST AND status = Open")
log(result)

const suggestions = JQL.autocomplete()
```

---

## Permissions

Check current user's permissions.

| Method | Description |
|--------|-------------|
| `Permissions.my(opts?)` | Get current user's permissions (opts: permissions, issueKey, projectKey) |

```js
// Check specific permissions for a project
const perms = Permissions.my({
  permissions: "BROWSE_PROJECTS,CREATE_ISSUES",
  projectKey: "PROJ"
})

// Check permissions for a specific issue
const issuePerms = Permissions.my({
  permissions: "EDIT_ISSUES",
  issueKey: "PROJ-123"
})
```

---

## Next steps

- [Scripting API: Issues](/docs/jibrok-studio-jira/scripting-api-issues) - Search, create, update, and transition issues
- [Scripting API: Utilities](/docs/jibrok-studio-jira/scripting-api-utilities) - Adf, DateUtils, Arrays, Strings, CSV
- [Use Cases](/docs/jibrok-studio-jira/use-cases) - Practical scripting examples
