---
layout: post
title: Plugins for Atlassian products - One-time link
---
#### You send your secret (text, password ...) and in response, you will receive a link for one-time access to the sent secret
### [One-time link](https://marketplace.atlassian.com/apps/1219776/one-time-link?hosting=server&tab=overview)

Sometimes, one would like to transfer a secret text, a password or a key such that this information does not appear anywhere.
Email, messengers and public services are places where there could be information leakages and data breaches. But these services are vital for communication. One-time links (among other things) are used to transfer private information through such services. 
These links generate a special service that issues information accessible via the link only once. You send your secret (text, password ...) to such service, and in response, you will receive a link for one-time access to the sent secret.
After clicking through the link to read the information, the service deletes the stored secret. So the service protects your secret and confirms that it has not been compromised. 

![Message field example](/images/one-time-link/create-one-time-link.png)

The plugin works according to the following scheme.
From the custom menu in Jira, you can quickly create a one-time link. The transmitted information will be stored on the Jira server. 
Access to the information via a link is determined by the following 1) Jira access settings. 2) settings specified when creating the link - Jira users (default) or anonymous access. The transmitted information is deleted after it was been read. 

![Message field example](/images/one-time-link/get-one-time-link.png)

Such links can be sent by email or instant messenger without it being intercepted by third-parties. 

Example of a scenario when this is convenient. 
Service X access requests are processed through Jira. But service X cannot send password reset email notifications. 
You set a password, create a one-time link and send it to the client via a convenient communication channel. Unread information is automatically deleted a week after creation. 

This solution is of course not a panacea. However, it is still incomparably better than open information transfer. In addition, it does not require you to install additional programs and services on the server. Everything works on Jira. 


[View on Atlassian Marketplace](https://marketplace.atlassian.com/apps/1219776/one-time-link?hosting=server&tab=overview)

[Documentation](https://bitbucket.org/jibrok/one-time-link/wiki/Home)

[Report a problem](https://bitbucket.org/jibrok/one-time-link/issues?status=new&status=open)

