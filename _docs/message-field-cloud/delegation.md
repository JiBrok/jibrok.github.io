---
title: Delegation and Permissions
key: message-field-cloud
excerpt: "Delegate Message Panel management to project admins with granular project-based permissions and access control policies."
category: administration
tags: [doc, cloud, delegation, permissions, project-admin, access-control, administration]
---

{:.no_toc}
* TOC
{:toc}

## Overview

Delegation allows Jira administrators to grant project administrators the ability to manage Message Panel configurations for their projects without requiring site-wide admin permissions. This feature enables distributed management while maintaining security and control.

## How Delegation Works

### Administrator Roles

**Site Administrators**:
- Full access to all configurations
- Can configure delegation policies
- Manage global module settings
- View and edit all project configurations

**Project Administrators** (when delegation enabled):
- Access project-specific configuration page
- Create/edit/delete configurations for their projects
- Configure panels within their project scope
- Limited by delegation policy

### Delegation Flow

1. **Site admin** sets delegation policy
2. **Site admin** enables delegation for specific projects (optional)
3. **Project admin** accesses project settings page
4. **Project admin** manages configurations for their project
5. Changes apply only to their project's issues

## Delegation Policies

Choose how delegation works across your Jira instance:

### ENABLE_ALL

**Behavior**: Delegation enabled for all projects

- All project admins can manage panels
- No per-project configuration needed
- Simplest to manage
- Most permissive

**Use when**:
- You trust all project admins
- Want self-service configuration
- Have mature project teams
- Minimal governance needs

### DISABLE_ALL

**Behavior**: Delegation disabled for all projects

- Only site admins can manage panels
- Centralized control
- Highest security
- More admin workload

**Use when**:
- Strict governance required
- Centralized control needed
- Limited project admin permissions
- High security requirements

### ENABLE_OVERRIDE

**Behavior**: Enabled by default, can disable for specific projects

- Start with delegation enabled
- Selectively disable for projects
- Flexible approach
- Good default for most orgs

**Use when**:
- Most projects should have access
- Few projects need restriction
- Want opt-out model
- Trust by default

### DISABLE_OVERRIDE

**Behavior**: Disabled by default, can enable for specific projects

- Start with delegation disabled
- Selectively enable for projects
- More controlled rollout
- Good for testing

**Use when**:
- Want controlled rollout
- Testing delegation feature
- Limited trust by default
- Want opt-in model

## Setting Up Delegation

### For Site Administrators

#### 1. Choose Delegation Policy

1. Go to **Apps** → **Message Panel Settings**
2. Click **Delegation** tab
3. Select policy from dropdown:
   - Enable for all projects
   - Disable for all projects
   - Enable with overrides (default)
   - Disable with overrides
4. Click **Save**

#### 2. Configure Project Overrides (if using override policy)

**For ENABLE_OVERRIDE**:

Add projects to disable delegation:
1. In **Delegation** tab
2. Find **Disabled Projects** section
3. Click **Add Project**
4. Select projects to disable
5. Click **Save**

**For DISABLE_OVERRIDE**:

Add projects to enable delegation:
1. In **Delegation** tab
2. Find **Enabled Projects** section
3. Click **Add Project**
4. Select projects to enable
5. Click **Save**

### For Project Administrators

#### Accessing Project Configuration

1. Go to **Project Settings** for your project
2. Look for **Apps** section in sidebar
3. Click **Message Panel Settings**
4. You'll see configurations for your project

**Note**: This option only appears if delegation is enabled for your project.

#### Managing Configurations

Project admins can:
- ✅ Create new configurations for their project
- ✅ Edit existing configurations for their project
- ✅ Delete configurations for their project
- ✅ Preview configurations
- ✅ Duplicate configurations
- ✅ Export/import configurations

Project admins cannot:
- ❌ Manage global module settings
- ❌ Configure delegation policies
- ❌ View/edit configurations for other projects
- ❌ Change system-wide settings

## Permission Checking

### Access Control

The system checks permissions at multiple levels:

1. **Page Access**:
   - Site admins: Full access
   - Project admins: Project-specific access (if delegation enabled)
   - Others: No access

2. **Configuration Access**:
   - Site admins: All configurations
   - Project admins: Only configurations for their projects
   - Read-only users: No access

3. **Operation Permissions**:
   - Create: Must be admin for target project
   - Edit: Must be admin for configuration's projects
   - Delete: Must be admin for configuration's projects
   - View: Must be admin for at least one of configuration's projects

### Project Filtering

Configurations can target multiple projects:

- **Site admins**: Can select any projects
- **Project admins**: Can only select projects they admin
- **Visibility**: Users only see panels on projects they admin

**Example**:
- Config A: Projects [X, Y, Z]
- Project admin of X: Can edit if delegation enabled
- Project admin of Y: Can also edit
- Project admin of W: Cannot see this config

## Use Cases

### Use Case 1: Self-Service Teams

**Scenario**: Large organization with mature teams

**Solution**:
- Policy: **ENABLE_ALL**
- All projects can self-manage
- Minimal admin overhead
- Team autonomy

**Configuration**:
```
Delegation Policy: ENABLE_ALL
Project Overrides: None
```

### Use Case 2: Controlled Rollout

**Scenario**: Testing delegation with select teams

**Solution**:
- Policy: **DISABLE_OVERRIDE**
- Enable for pilot projects
- Evaluate before wider rollout
- Controlled expansion

**Configuration**:
```
Delegation Policy: DISABLE_OVERRIDE
Enabled Projects: [PILOT-1, PILOT-2, PILOT-3]
```

### Use Case 3: Mostly Open with Exceptions

**Scenario**: Trust most teams, restrict sensitive projects

**Solution**:
- Policy: **ENABLE_OVERRIDE**
- Disable for sensitive projects
- Balance autonomy and control
- Default to trust

**Configuration**:
```
Delegation Policy: ENABLE_OVERRIDE
Disabled Projects: [SECURITY, FINANCE, HR]
```

### Use Case 4: Centralized Control

**Scenario**: Strict governance requirements

**Solution**:
- Policy: **DISABLE_ALL**
- Only site admins configure
- Maximum control
- Consistent standards

**Configuration**:
```
Delegation Policy: DISABLE_ALL
Project Overrides: None
```

## Best Practices

### Security

1. **Review regularly**: Audit delegation settings quarterly
2. **Principle of least privilege**: Enable only where needed
3. **Monitor changes**: Track configuration modifications
4. **Document decisions**: Record why delegation enabled/disabled
5. **Test in staging**: Try policies in test environment first

### Organizational

1. **Align with structure**: Match project admin responsibilities
2. **Communicate clearly**: Explain delegation to project admins
3. **Provide training**: Show project admins how to use
4. **Set guidelines**: Create configuration standards
5. **Support channel**: Provide help for project admins

### Technical

1. **Start restrictive**: Begin with DISABLE_OVERRIDE
2. **Expand gradually**: Enable projects incrementally
3. **Use project filters**: Scope configurations appropriately
4. **Test permissions**: Verify access before rolling out
5. **Document process**: Create runbooks for common tasks

## Troubleshooting

### Project Admin Can't See Settings

**Check**:
1. ✅ Delegation policy allows their project
2. ✅ User is actually project admin (not just member)
3. ✅ Project not in override list (if using overrides)
4. ✅ Browser cache cleared
5. ✅ User has project admin role in Jira

**Solution**: Verify user has Project Administrator role in Project Settings → People

### Configuration Not Visible

**Check**:
1. ✅ Configuration targets admin's project
2. ✅ User has admin rights for at least one target project
3. ✅ Configuration is saved properly
4. ✅ Module is enabled globally

**Solution**: Edit configuration to include admin's project

### Cannot Edit Configuration

**Check**:
1. ✅ User is admin of configuration's projects
2. ✅ Delegation enabled for those projects
3. ✅ Configuration not created by site admin (may be restricted)

**Solution**: Contact site admin to adjust delegation settings

### Changes Not Appearing

**Check**:
1. ✅ Configuration saved successfully
2. ✅ Module enabled globally
3. ✅ Display conditions met
4. ✅ Project/type filters match
5. ✅ Browser cache cleared

**Solution**: Hard refresh browser (Ctrl+Shift+R / Cmd+Shift+R)

## Security Considerations

### What Project Admins Can Do

Project admins with delegation can:
- Create panels showing data from any project (via JQL)
- Set up linked issues displays
- Write templates accessing issue data
- Configure display rules

### What Project Admins Cannot Do

Project admins are restricted from:
- Accessing data outside Jira permissions
- Modifying global settings
- Seeing other projects' private configurations
- Changing delegation policies

### Data Access

**Important**: Project admins can create JQL queries that return issues from any project, but:

- Users still need Jira permissions to see issue data
- Panels respect Jira's Browse Projects permission
- No elevation of privileges
- Field-level security applies

**Example**:
```jql
project = CONFIDENTIAL AND status = Open
```
- Project admin can configure this JQL
- Only users with CONFIDENTIAL access see results
- Jira permissions are enforced

### Audit Trail

Track configuration changes:
- Creator/updater accountId stored
- Created/updated timestamps tracked
- Changes can be monitored
- History preserved

## API and Automation

### Checking Delegation

Use resolver to check if delegation enabled:

```javascript
import { invoke } from '@forge/bridge';

const settings = await invoke('getDelegationSettings');
// Returns: { policy, enabledProjects, disabledProjects }
```

### Verifying Access

Check if user can access configuration:

```javascript
const canAccess = await invoke('checkDelegation', {
  projectKey: 'PROJ'
});
// Returns: { hasAccess: boolean, reason: string }
```

## Migration from Data Center

Differences from Data Center version:

| Feature | Data Center | Cloud (Forge) |
|---------|-------------|---------------|
| Scope | Per field configuration | Per project |
| Granularity | Users, groups, roles | Project admin role |
| Configuration | Field contexts | Global policy + overrides |
| Access Method | Field config page | Project settings page |

**Migration tips**:
1. Map Data Center delegation to projects
2. Use ENABLE_OVERRIDE for similar behavior
3. Document access changes
4. Communicate to users
5. Provide training on new UI

## Next Steps

- [Configuration Guide](/docs/user-docs/configuration/) - Learn to create panels
- [Modules Guide](/docs/user-docs/modules/) - Understand display locations
- [Dynamic Templates](/docs/user-docs/dynamic-templates/) - Add dynamic content

## Support

Questions about delegation?

- 📖 [Documentation](/docs/user-docs/overview/) - Complete guide
- 🎫 [Support Portal](https://jibrok.atlassian.net/servicedesk/customer/portals) - Get help
- 💬 [Community](https://community.atlassian.com/) - Ask questions

---

**Best practice:** Start with DISABLE_OVERRIDE and gradually enable projects as teams are trained and ready!
