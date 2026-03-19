---
title: "Scripting API: Configuration & Assets"
key: jibrok-studio-jira
excerpt: Administration namespaces for workflows, screens, schemes, roles, and JSM Assets
category: scripting
tags:
  - doc
  - cloud
  - scripting
  - api
  - admin
  - configuration
  - assets
---

* TOC
{:toc}

> Part of the [Scripting API](/docs/jibrok-studio-jira/scripting-api) reference.

Top-level namespaces for Jira administration (workflows, screens, schemes, roles) and JSM Assets (CMDB).

All configuration namespaces are injected as top-level variables - use `WorkflowSchemes.list()`, not ~~`Admin.WorkflowSchemes.list()`~~.

---

## Configuration namespaces

### Read-only namespaces

| Namespace | Description | Methods |
|-----------|-------------|---------|
| `Workflows` | Workflow definitions | `list()`, `search(opts?)` |
| `SecuritySchemes` | Issue security schemes | `list()`, `getLevel(id)` |
| `Events` | Jira events | `list()` |

### Full CRUD namespaces (with pagination)

These namespaces support `list(opts?)`, `get(id)`, `create(data)`, `update(id, data)`, `delete(id)`:

| Namespace | Description |
|-----------|-------------|
| `WorkflowSchemes` | Workflow schemes |
| `Screens` | Screens |
| `ScreenSchemes` | Screen schemes |
| `IssueTypeSchemes` | Issue type schemes |
| `IssueTypeScreenSchemes` | Issue type screen schemes |
| `FieldConfigurations` | Field configurations |
| `FieldConfigSchemes` | Field configuration schemes |
| `NotificationSchemes` | Notification schemes |
| `PrioritySchemes` | Priority schemes |

### Full CRUD namespaces (without pagination)

These namespaces support `list()`, `get(id)`, `create(data)`, `update(id, data)`, `delete(id)`:

| Namespace | Description |
|-----------|-------------|
| `PermissionSchemes` | Permission schemes |
| `Roles` | Project roles |
| `ProjectCategories` | Project categories |

### Special namespaces

**IssueTypes** - Issue types:

| Method | Description |
|--------|-------------|
| `IssueTypes.list()` | List all issue types |
| `IssueTypes.get(id)` | Get issue type by ID |
| `IssueTypes.forProject(key)` | List issue types for a project |
| `IssueTypes.create(data)` | Create an issue type |
| `IssueTypes.update(id, data)` | Update an issue type |
| `IssueTypes.delete(id)` | Delete an issue type |

**Statuses** - Workflow statuses:

| Method | Description |
|--------|-------------|
| `Statuses.list(opts?)` | Search statuses (supports `maxResults`, `searchString`, `projectId`, `expand`) |
| `Statuses.get(id)` | Get status by ID |
| `Statuses.create(data)` | Create a status |
| `Statuses.update(data)` | Update a status (ID in data body, not as parameter) |
| `Statuses.delete(id)` | Delete a status |

**Dashboards** - Jira dashboards:

| Method | Description |
|--------|-------------|
| `Dashboards.list(opts?)` | List dashboards (paginated) |
| `Dashboards.get(id)` | Get dashboard by ID |
| `Dashboards.search(opts?)` | Search dashboards (paginated) |

### Pagination options

Methods accepting `opts?` support:

| Option | Type | Description |
|--------|------|-------------|
| `maxResults` | number | Maximum results per page |
| `startAt` | number | Starting index for pagination |

### Examples

```js
// List all workflow schemes
const schemes = WorkflowSchemes.list()
log(schemes.length)

// Get a specific screen
const screen = Screens.get('10001')
log(screen.name)

// Create a project role
const role = Roles.create({
  name: 'Release Manager',
  description: 'Manages releases'
})

// List issue types for a project
const types = IssueTypes.forProject('PROJ')
for (const t of types) {
  log(t.name, t.id)
}

// Search dashboards
const dashboards = Dashboards.search({ maxResults: 10 })
for (const d of dashboards) {
  log(d.name)
}

// Search statuses by name
const statuses = Statuses.list({ searchString: 'Done', maxResults: 50 })
log(statuses.length)

// List all Jira events
const events = Events.list()
for (const e of events) {
  log(e.name)
}
```

---

## Assets namespace

> **Note:** The Assets API requires Jira Service Management with Assets (CMDB) enabled on your Jira site.

The `Assets` namespace provides access to JSM Assets (CMDB) for managing objects, schemas, and object types.

### Methods

| Method | Description | API calls |
|--------|-------------|-----------|
| `Assets.search(aql, opts?)` | Search objects using AQL | 1 |
| `Assets.getObject(id)` | Get object by ID | 1 |
| `Assets.createObject(objectTypeId, attributes)` | Create a new object | 1 |
| `Assets.updateObject(id, attributes)` | Update an object | 1 |
| `Assets.deleteObject(id)` | Delete an object | 1 |
| `Assets.getAttributes(objectId)` | Get object attributes | 1 |
| `Assets.getObjectHistory(id)` | Get object change history | 1 |
| `Assets.getConnectedTickets(id)` | Get Jira tickets linked to an object | 1 |
| `Assets.getObjectReferenceInfo(id)` | Get objects referencing this object | 1 |
| `Assets.getSchemas()` | List all schemas | 1 |
| `Assets.getSchema(id)` | Get schema by ID | 1 |
| `Assets.getObjectTypes(schemaId)` | List object types in a schema | 1 |
| `Assets.getObjectType(id)` | Get object type by ID | 1 |
| `Assets.getObjectTypeAttributes(id)` | Get attributes for an object type | 1 |

### Search options

| Option | Type | Description |
|--------|------|-------------|
| `page` | number | Page number |
| `resultPerPage` | number | Results per page |
| `includeAttributes` | boolean | Include attribute values |
| `orderByTypeAttrId` | number | Sort by attribute ID |
| `asc` | number | Sort direction (1 = ascending) |

### Examples

```js
// Search for laptops
const result = Assets.search('objectType = "Laptop"', {
  resultPerPage: 50,
  includeAttributes: true
})
log(`Found ${result.objectEntries.length} laptops`)

// Get a specific object
const obj = Assets.getObject('123')
log(obj.label)

// Create an object
const newObj = Assets.createObject('15', [
  { objectTypeAttributeId: '100', objectAttributeValues: [{ value: 'My Laptop' }] },
  { objectTypeAttributeId: '101', objectAttributeValues: [{ value: 'Dell' }] }
])

// List schemas
const schemas = Assets.getSchemas()
for (const s of schemas.objectschemas) {
  log(s.name, s.id)
}
```

---

## Next steps

- [Scripting API](/docs/jibrok-studio-jira/scripting-api) - API overview
- [Scripting API: Issues](/docs/jibrok-studio-jira/scripting-api-issues) - Issue operations
- [Scripting API: Jira Entities](/docs/jibrok-studio-jira/scripting-api-jira) - Users, Projects, Fields
