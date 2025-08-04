---
title: Promo Code Generator for JiBrok Apps
key: generator
category: utilities
tags: [doc, promo-codes, discounts, server, datacenter, cloud, generator, utility, licensing]
excerpt: "Generate promo codes and discounts for Jira apps across Server, Data Center, and Cloud hosting environments with interactive selection tools."
---

[comment]: <> (<html>)

[comment]: <> (<head>)

[comment]: <> (    <script src="https://code.jquery.com/jquery-2.2.4.min.js" integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44=" crossorigin="anonymous"></script>)

[comment]: <> (    <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />)

[comment]: <> (    <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>)

[comment]: <> (</head>)

[comment]: <> (<div id="hosting" style="width: 100%; margin-bottom: 20px">)

[comment]: <> (    <label>Hosting</label>)

[comment]: <> (    <select class="hosting" name="hosting" style="width: 100%;">)

[comment]: <> (      <option value="SERVER">Server</option>)

[comment]: <> (      <option value="DC">Data center</option>)

[comment]: <> (      <option value="CLOUD">Cloud</option>)

[comment]: <> (    </select>)

[comment]: <> (</div>)

[comment]: <> (<div id="server" style="width: 100%; display: none; margin-bottom: 20px" >)

[comment]: <> (<label>Server apps</label>)

[comment]: <> (<select class="addons-server-select" name="addons-server-select" multiple="multiple" style="width: 100%;">)

[comment]: <> (  <option value="AL">Alabama</option>)

[comment]: <> (  <option value="WY">Wyoming</option>)

[comment]: <> (</select>)

[comment]: <> (</div>)

[comment]: <> (<div id="dc" style="width: 100%; display: none; margin-bottom: 20px">)

[comment]: <> (<label>Data center apps</label>)

[comment]: <> (<select class="addons-dc-select" name="addons-dc-select" multiple="multiple" style="width: 100%;">)

[comment]: <> (  <option value="AL">Alabama</option>)

[comment]: <> (  <option value="WY">Wyoming</option>)

[comment]: <> (</select>)

[comment]: <> (</div>)

[comment]: <> (<div id="cloud" style="width: 100%; display: none; margin-bottom: 20px">)

[comment]: <> (<label>Cloud apps</label>)

[comment]: <> (<select class="addons-cloud-select" name="addons-cloud-select" multiple="multiple" style="width: 100%;">)

[comment]: <> (  <option value="AL">Alabama</option>)

[comment]: <> (  <option value="WY">Wyoming</option>)

[comment]: <> (</select>)

[comment]: <> (</div>)

[comment]: <> (<div id="promo-code"></div>)

[comment]: <> (<script>)

[comment]: <> ( $&#40;document&#41;.ready&#40;function&#40;&#41; {)

[comment]: <> (    $&#40;'.hosting'&#41;.select2&#40;&#41;;)

[comment]: <> (    $&#40;'.addons-server-select'&#41;.select2&#40;&#41;;)

[comment]: <> (    $&#40;'.addons-dc-select'&#41;.select2&#40;&#41;;)

[comment]: <> (    $&#40;'.addons-cloud-select'&#41;.select2&#40;&#41;;)

[comment]: <> (    $&#40;'.hosting'&#41;.on&#40;'change', function&#40;&#41;{)

[comment]: <> (        if&#40;$&#40;'.hosting'&#41;.val&#40;&#41; == "SERVER"&#41;{)

[comment]: <> (            $&#40;'#server'&#41;.show&#40;&#41;;)

[comment]: <> (            $&#40;'#dc'&#41;.hide&#40;&#41;;)

[comment]: <> (            $&#40;'#cloud'&#41;.hide&#40;&#41;;)

[comment]: <> (        } else if&#40;$&#40;'.hosting'&#41;.val&#40;&#41; == "DC"&#41;{)

[comment]: <> (            $&#40;'#server'&#41;.hide&#40;&#41;;)

[comment]: <> (            $&#40;'#dc'&#41;.show&#40;&#41;;)

[comment]: <> (            $&#40;'.addons-cloud-select'&#41;.hide&#40;&#41;;)

[comment]: <> (        } else if&#40;$&#40;'.hosting'&#41;.val&#40;&#41; == "CLOUD"&#41;{)

[comment]: <> (            $&#40;'#server'&#41;.hide&#40;&#41;;)

[comment]: <> (            $&#40;'#dc'&#41;.hide&#40;&#41;;)

[comment]: <> (            $&#40;'#cloud'&#41;.show&#40;&#41;;)

[comment]: <> (        } else {)

[comment]: <> (            $&#40;'#server'&#41;.hide&#40;&#41;;)

[comment]: <> (            $&#40;'#dc'&#41;.hide&#40;&#41;;)

[comment]: <> (            $&#40;'#cloud'&#41;.hide&#40;&#41;;)

[comment]: <> (        })

[comment]: <> (    }&#41;;)

[comment]: <> (    $&#40;'.hosting'&#41;.trigger&#40;'change'&#41;)

[comment]: <> (}&#41;;  )

[comment]: <> (function generatePromo&#40;hosting, apps&#41;{)

[comment]: <> (})

[comment]: <> (</script>)

[comment]: <> (</html>)