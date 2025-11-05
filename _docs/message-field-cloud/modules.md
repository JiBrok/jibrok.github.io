---
title: Display Modules Guide
key: message-field-cloud
excerpt: "Understand different display locations for Message Panel: Issue Panel, Activity, Context, and Action modules with comparison and use cases."
category: configuration
tags: [doc, cloud, modules, display-locations, issue-panel, activity, context, action, forge-modules]
---

{:.no_toc}
* TOC
{:toc}

## Overview

Message Panel uses Atlassian Forge modules to display panels in different locations on Jira issue screens. Each module type has different characteristics and is suited for different use cases.

## Available Modules

### Issue Panel

**Location**: Right sidebar on issue view screen

**Characteristics**:
- Primary display location
- Collapsible/expandable panels
- Full-width table display
- Supports modal windows
- Best for detailed information
- Most commonly used module

**When to use**:
- Main data displays
- Linked issues tables
- Detailed dashboards
- Multi-field displays
- Interactive content

**Configuration options**:
- Standard inline display
- Modal window option
- Auto-open modal
- Custom button text
- Various modal sizes

**Example use cases**:
- Blocker dashboard
- Epic progress tracker
- Dependency viewer
- Related bugs table
- Test coverage display

### Issue Activity

**Location**: Activity feed timeline

**Characteristics**:
- Appears in activity/comments section
- Inline display only
- Mixed with comments and history
- Good for contextual information
- Updates visible in timeline

**When to use**:
- Recent changes summary
- Activity-related info
- Timeline context
- Quick status updates
- Brief notifications

**Configuration options**:
- Standard display only
- No modal support
- Fixed position in feed

**Example use cases**:
- Recent linked issue updates
- Status change notifications
- Quick team updates
- Brief warnings
- Activity summaries

### Issue Context

**Location**: Context menu (more actions)

**Characteristics**:
- Appears in "..." menu
- Compact quick view
- Minimal space usage
- Fast access
- Less intrusive

**When to use**:
- Optional information
- Quick reference data
- Supplementary details
- Low-priority info
- On-demand viewing

**Configuration options**:
- Standard compact display
- Limited customization
- Quick load priority

**Example use cases**:
- Quick stats
- Metadata display
- Reference links
- Summary information
- Helper content

### Issue Action

**Location**: Issue actions menu

**Characteristics**:
- Adds custom action button
- Opens on-click
- Menu integration
- Action-oriented
- User-initiated

**When to use**:
- User-triggered displays
- Action-based workflows
- Optional detailed views
- On-demand queries
- Interactive tools

**Configuration options**:
- Custom action label
- Button appearance
- Click behavior

**Example use cases**:
- "View Dependencies" action
- "Check Blockers" button
- "Show Impact" tool
- "Analyze Links" action
- Custom reports

## Module Comparison

| Feature | Issue Panel | Issue Activity | Issue Context | Issue Action |
|---------|------------|----------------|---------------|--------------|
| **Visibility** | Always visible | In timeline | In menu | On click |
| **Display Area** | Full width | Full width | Compact | Variable |
| **Modal Support** | ✅ Yes | ❌ No | ❌ No | ✅ Yes |
| **Collapsible** | ✅ Yes | ❌ No | ❌ No | ❌ No |
| **Best For** | Main data | Updates | Quick ref | Actions |
| **Load Time** | Deferred | On scroll | On menu open | On click |
| **Intrusiveness** | Medium | Low | Very low | User choice |

## Enabling Modules

### Global Module Settings

1. Go to **Apps** → **Message Panel Settings**
2. Click the **Modules** tab
3. Toggle modules on/off:
   - ☑️ Issue Panel
   - ☑️ Issue Activity
   - ☑️ Issue Context
   - ☑️ Issue Action
4. Click **Save**

**Important**:
- Disabled modules won't appear anywhere
- Configurations targeting disabled modules won't display
- Changes apply immediately to all users

### Per-Configuration Module Selection

Each configuration specifies which module to use:

1. Edit or create a configuration
2. Find **Display Module** setting
3. Select one module from dropdown
4. Save configuration

**Note**: One configuration = one module location

## Module Behavior

### Visibility Rules

A panel appears when ALL conditions are met:

1. ✅ Module is enabled globally
2. ✅ Configuration targets that module
3. ✅ Project filter matches (if set)
4. ✅ Issue type filter matches (if set)
5. ✅ Display JQL matches (if set)
6. ✅ Module has configurations with hasConfigs=true

### Multiple Panels

Multiple configurations can target the same module:

- **Ordering**: By weight (lower first), then alphabetically
- **Collapsible**: Each panel can be collapsed independently (Issue Panel only)
- **Performance**: More panels = slower load time
- **UX**: Too many panels can overwhelm users

**Best practice**: Limit to 3-5 panels per module

### Load Behavior

Different modules load at different times:

- **Issue Panel**: After page load (deferred)
- **Issue Activity**: When scrolling to activity section
- **Issue Context**: When opening the context menu
- **Issue Action**: When clicking the action button

## Module-Specific Features

### Issue Panel - Modal Windows

Display panels in modal dialogs:

**Settings**:
```
Show in Modal: Yes
Modal Button Text: "View Dependencies"
Button Appearance: Primary
Modal Size: Large
Auto-Open: No
```

**Benefits**:
- Save space on main screen
- Focus attention
- Optional viewing
- Better for large tables

**Modal options**:
- **Button text**: Custom label
- **Button appearance**: Default, Primary, Subtle, Warning, Danger
- **Modal size**: Small (400px), Medium (600px), Large (800px), X-Large (90%)
- **Auto-open**: Open automatically on issue load
- **Show once**: Only auto-open once per issue
- **Modal appearance**: Default, Warning, Danger
- **Close button text**: Custom label

**Example use case**:
```
Configuration: Critical Blockers
Show in Modal: Yes
Modal Button Text: "⚠️ View Blockers"
Button Appearance: Danger
Auto-Open: Yes
Show Once Per Issue: Yes
Modal Appearance: Danger
```

### Issue Activity - Timeline Integration

Panels appear inline with activity:

**Characteristics**:
- Mixed with comments
- Scrollable with timeline
- No expand/collapse
- Updates context

**Best practices**:
- Keep content brief
- Use for recent updates
- Add timestamps
- Provide context

### Issue Context - Quick Access

Minimal, focused information:

**Characteristics**:
- Compact display
- Menu-based access
- Fast loading
- Low profile

**Best practices**:
- Essential info only
- 1-3 fields max
- Quick metrics
- No large tables

### Issue Action - User Triggered

Action-based display:

**Characteristics**:
- User initiates
- On-demand loading
- Action context
- No automatic display

**Best practices**:
- Clear action labels
- Expected behavior
- Quick response
- Useful action

## Performance Considerations

### Load Impact

Each module affects performance differently:

| Module | Load Time | Network | UI Blocking |
|--------|-----------|---------|-------------|
| Issue Panel | Medium | After page | Non-blocking |
| Issue Activity | Low | On scroll | Non-blocking |
| Issue Context | Very low | On menu | Non-blocking |
| Issue Action | Low | On click | Non-blocking |

### Optimization Tips

1. **Limit configurations**: 3-5 per module max
2. **Use display JQL**: Filter early
3. **Reduce max issues**: Lower limits = faster load
4. **Select fewer fields**: Less data = faster render
5. **Simple templates**: Complex logic slows rendering
6. **Use modal windows**: Defer loading until needed

## Module Management

### Checking Module Status

View current module states:

1. Go to **Message Panel Settings**
2. Click **Modules** tab
3. See status for each module:
   - **Enabled**: Module is active
   - **Has Configs**: Configurations target this module
   - **Visible**: Module appears on issues

### Troubleshooting

**Panel not showing?**

Check:
1. ✅ Module enabled in Modules tab
2. ✅ Configuration targets correct module
3. ✅ Project/type filters match
4. ✅ Display JQL passes (if set)
5. ✅ Browser cache cleared

**Panel showing in wrong location?**

- Verify the Display Module setting in configuration
- Check if you're looking at the right screen
- Confirm module is enabled globally

**Multiple panels overlapping?**

- Adjust weights to control order
- Consider combining into fewer panels
- Use modal windows for optional content

## Use Case Guide

### Scenario: Epic Dashboard

**Goal**: Show epic progress with details

**Solution**:
- **Module**: Issue Panel
- **Reason**: Needs full table, collapsible
- **Features**: Weight=-10 to show first

### Scenario: Recent Blocker Updates

**Goal**: Show new blockers in activity

**Solution**:
- **Module**: Issue Activity
- **Reason**: Context in timeline
- **Features**: Brief, activity-focused

### Scenario: Quick Stats

**Goal**: Issue count and status

**Solution**:
- **Module**: Issue Context
- **Reason**: Quick reference, optional
- **Features**: Compact, fast

### Scenario: Detailed Analysis

**Goal**: Complex dependency viewer

**Solution**:
- **Module**: Issue Action
- **Reason**: User-triggered, detailed
- **Features**: Modal window, on-demand

### Scenario: Critical Warning

**Goal**: Show SLA breaches prominently

**Solution**:
- **Module**: Issue Panel (modal)
- **Reason**: High visibility, attention
- **Features**: Auto-open, danger appearance

## Best Practices

### Module Selection

1. **Start with Issue Panel** - Most versatile
2. **Add Activity for context** - Timeline updates
3. **Use Context for extras** - Optional info
4. **Add Actions for tools** - User workflows

### Multiple Modules

**Good**:
- Main data in Issue Panel
- Updates in Activity
- Stats in Context
- Tools in Actions

**Bad**:
- Same data in multiple modules
- Too many Issue Panels
- Redundant information
- Overlapping content

### User Experience

1. **Don't overwhelm** - 3-5 panels max
2. **Use weights wisely** - Important first
3. **Consider modal windows** - Optional details
4. **Test with users** - Get feedback
5. **Monitor performance** - Optimize if slow

## Migration from Data Center

The Cloud version uses Forge modules instead of custom fields:

| Data Center | Cloud Equivalent |
|-------------|------------------|
| Issue screen field position | Issue Panel module |
| Activity section field | Issue Activity module |
| N/A | Issue Context module |
| N/A | Issue Action module |

**Key differences**:
- No screen configuration needed
- Automatic positioning
- Module-based visibility
- Simplified setup

## Next Steps

- [Configuration Guide](/docs/user-docs/configuration/) - Set up panels
- [Dynamic Templates](/docs/user-docs/dynamic-templates/) - Add dynamic content
- [Template Examples](/docs/user-docs/template-examples/) - Ready-to-use examples

## Support

Questions about modules?

- 📖 [Documentation](/docs/user-docs/overview/) - Complete guide
- 🎫 [Support Portal](https://jibrok.atlassian.net/servicedesk/customer/portals) - Get help
- 💬 [Community](https://community.atlassian.com/) - Ask questions

---

**Pro tip:** Start with one module type, test with users, then expand to others based on feedback!
