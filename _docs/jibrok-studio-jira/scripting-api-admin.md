---
title: "Scripting API: Configuration & Assets"
seo_title: "Jira Admin API - Workflows, Screens, Roles, Assets"
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
last_modified_at: 2026-03-19
date: 2026-03-16
seo:
  date_modified: 2026-03-19
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
| `Workflows` | Workflow definitions | `list()`, `search(opts?)`, `searchAll()` |
| `SecuritySchemes` | Issue security schemes | `list()`, `getLevel(id)` |
| `Events` | Jira events | `list()` |

### Full CRUD namespaces (with pagination)

These namespaces support `list(opts?)`, `listAll()`, `get(id)`, `create(data)`, `update(id, data)`, `delete(id)`:

| Namespace | Description |
|-----------|-------------|
| `WorkflowSchemes` | Workflow schemes |
| `Screens` | Screens (+ sub-resource methods below) |
| `ScreenSchemes` | Screen schemes |
| `IssueTypeSchemes` | Issue type schemes |
| `IssueTypeScreenSchemes` | Issue type screen schemes |
| `FieldConfigurations` | Field configurations (+ sub-resource methods below) |
| `FieldConfigSchemes` | Field configuration schemes (+ sub-resource methods below) |
| `NotificationSchemes` | Notification schemes |
| `PrioritySchemes` | Priority schemes |

**Screens** - additional methods for tabs and fields:

| Method | Description |
|--------|-------------|
| `Screens.getTabs(screenId)` | Get all tabs of a screen |
| `Screens.getTabFields(screenId, tabId)` | Get fields of a screen tab |
| `Screens.addField(screenId, tabId, fieldId)` | Add a field to a screen tab |
| `Screens.removeField(screenId, tabId, fieldId)` | Remove a field from a screen tab |

**FieldConfigurations** - additional methods for field items:

| Method | Description |
|--------|-------------|
| `FieldConfigurations.getFields(configId, opts?)` | Get fields in a configuration (paginated) |
| `FieldConfigurations.updateFields(configId, data)` | Update field items in a configuration |

**FieldConfigSchemes** - additional methods for mappings and projects:

| Method | Description |
|--------|-------------|
| `FieldConfigSchemes.getMappings(schemeId, opts?)` | Get field configuration mappings for a scheme (paginated) |
| `FieldConfigSchemes.getProjects(projectIds)` | Get field config schemes for given project IDs |

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
| `Dashboards.listAll()` | List all dashboards (auto-pagination) |
| `Dashboards.get(id)` | Get dashboard by ID |
| `Dashboards.search(opts?)` | Search dashboards (paginated) |

### Pagination

`list(opts?)` returns a single page. Use `listAll()` to automatically fetch all pages:

```js
// Single page (default 50 items)
const page = Screens.list({ maxResults: 10 })

// All items (auto-pagination, up to 1000)
const all = Screens.listAll()
```

`list()` options:

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

// --- Screens sub-resources ---

// Get all tabs of a screen
const tabs = Screens.getTabs('10001')
for (const tab of tabs) {
  log(tab.id, tab.name)
}

// Add a field to the first tab
Screens.addField('10001', tabs[0].id, 'customfield_10100')

// List fields on a tab
const tabFields = Screens.getTabFields('10001', tabs[0].id)

// --- FieldConfigurations sub-resources ---

// Get fields in a field configuration
const items = FieldConfigurations.getFields('10001')

// Update fields in a configuration
FieldConfigurations.updateFields('10001', {
  fieldConfigurationItems: [{ id: 'customfield_10100' }]
})

// --- FieldConfigSchemes sub-resources ---

// Get mappings for a scheme
const mappings = FieldConfigSchemes.getMappings('10001')

// Get schemes for projects
const projectSchemes = FieldConfigSchemes.getProjects(['10000', '10001'])
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
