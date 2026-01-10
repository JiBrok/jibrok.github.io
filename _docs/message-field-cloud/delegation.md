---
title: Delegation
key: message-field-cloud
excerpt: Allow project admins to manage their own panel configurations
category: administration
tags:
  - doc
  - cloud
  - delegation
  - permissions
  - administration
---

{:.no_toc}
* TOC
{:toc}

## Overview

Delegation allows site administrators to grant project administrators the ability to manage Message Panel configurations for their projects.

### Administrator Roles

**Site Administrators**:
- Full access to all configurations
- Configure delegation policies
- Manage global module settings
- View and edit all project configurations

**Project Administrators** (when delegation enabled):
- Access project-specific configuration page
- Create/edit/delete configurations for their projects
- Limited by delegation policy

## Delegation Policies

### Enable for All Projects
Delegation enabled for all projects. All project administrators can manage panels for their projects.

**Use when**: You trust all project admins and want self-service configuration.

### Disable for All Projects
Delegation disabled for all projects. Only site admins can manage panels.

**Use when**: Strict governance required and centralized control needed.

### Enable with Exceptions
Enabled by default, with ability to disable for specific projects.

**Use when**: Most projects should have access, few projects need restriction.

### Disable with Exceptions
Disabled by default, with ability to enable for specific projects.

**Use when**: Want controlled rollout or testing delegation feature.

## Setting Up Delegation

### For Site Administrators

![Configuration Delegation Settings](/uploads/message-field-cloud/configuration/delegation%20settings.png)

1. Go to **Apps** → **Message Panel Settings**
2. Click **Configuration Delegation** tab
3. Select **Global Delegation Policy** from dropdown:
   - **Enable for all projects, unless specified otherwise**
   - **Disable for all projects**
   - (Other policy options)
4. Configure **Project-specific Settings** to override the global policy for individual projects
5. Click **Save Settings**

The delegation settings allow you to control which projects can access and configure message panels. You can:
- Set a global policy for all projects
- Optionally configure specific overrides for individual projects
- Choose between "Use global setting", "Enable", or "Disable" for each project

**For override policies**: Add projects to enable/disable list in the Project-specific Settings table.

### For Project Administrators

1. Go to **Project Settings** for your project
2. Look for **Apps** section in sidebar
3. Click **Message Panel Settings**

**Note**: This option only appears if delegation is enabled for your project.

#### What Project Admins Can Do

Project admins can:
- Create new configurations for their project
- Edit existing configurations for their project
- Delete configurations for their project
- Preview, duplicate, export/import configurations

Project admins cannot:
- Manage global module settings
- Configure delegation policies
- View/edit configurations for other projects

## Permission Checking

### Access Control

- **Site admins**: Full access to all configurations
- **Project admins**: Only configurations for their projects (if delegation enabled)

### Data Access

Project admins can create JQL queries that return issues from any project, but:
- Users still need Jira permissions to see issue data
- Panels respect Jira's Browse Projects permission
- No elevation of privileges

## Next Steps

- [Configuration Basics](configuration-basics) - Create panel configurations
- [Modules](modules) - Display locations
- [Templates](templates) - Dynamic content
- [Use Cases](use-cases) - Examples and best practices
