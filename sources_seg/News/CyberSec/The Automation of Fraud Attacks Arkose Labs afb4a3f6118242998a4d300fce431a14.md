# The Automation of Fraud Attacks | Arkose Labs

Created: June 29, 2024 7:38 PM
URL 1: https://www.arkoselabs.com/blog/the-automation-of-fraud-attacks/

automation of fraud attacks

### The need for automation of fraud attacks

Legitimate enterprises take advantage of automation to handle repetitive, yet business-critical tasks. They pay top dollars for skilled engineers to build and maintain automated business logic. Fraudsters do the same and commonly leverage botnets to automate part of the workflow that will lead to a successful fraud attack. I even occasionally see legitimate-looking job ads with very competitive salaries, targeting employees of companies that offer bot management products.

Over the years, fraudsters have perfected the art of automation of fraud attacks and on occasion, they go as far as taking advantage of [artificial intelligence](https://www.ibm.com/cloud/learn/what-is-artificial-intelligence). Automation is commonly used in the following use cases:

- [Credentials stuffing](https://www.arkoselabs.com/explained/credential-stuffing/), also known as credentials enumeration or account checking, is one of the steps that can lead to a full [account taken over](https://www.arkoselabs.com/explained/account-takeover-fraud-page/)
- New accounts creation, which are then reused for various fraud schemes
- Gift card enumeration attack against a gift card balance application on an eCommerce web site to steal the credits available
- Posting Spam content on a forum or review boards

A successful attack on the above use cases requires sending tens of thousands of requests, which cannot realistically be done manually in a cost-effective manner. Just like any regular business, fraudsters always look for ways to scale their operations to maximize their profit.

### Botnets business logic

Botnet sophistication has continuously evolved over the years to defeat bot management or fraud detection products that are now commonly protecting major websites’ most critical endpoints. Global botnets with tens of thousands of nodes with each node sending a limited number of requests per hour (or per day) closely mimicking a legitimate user behavior have become the norm.

Fraud detection products like Arkose Labs deploy JavaScript on the client-side that collects attributes about the browser and the device, often referred to as a fingerprint. The data collected is evaluated on the server side to differentiate the good from bad traffic. One of the most common techniques fraudsters implement in their botnet to defeat detection is to randomize some of these attributes. In the past though, the randomization was much more obvious and limited than it is today: I could count on the common mistake of using obsolete browser versions or operating systems like Firefox v2 (Well over 10 years old at this point) or Windows 95 (Really?). I even occasionally saw a request with a “Gameboy” user-agent (Come on now!). But more recently, I’ve seen attackers becoming a lot more subtle and use current or not-so-old software versions (within 2 quarters old) and adopt randomization schemes that goes way beyond the browser and OS. Fraudsters are also “adopting” the mobile trend by impersonating mobile devices, betting on the fact that the protections may not be as effective in dealing with mobile traffic or the site owner may not take the risk of mitigating an attack on his mobile application that is gaining in popularity.

### Evolving the detection engine

If randomizing 1 or 2 attributes of the fingerprint was considered sophisticated in the past, today botnets include much more complex randomization logic. Efficiently detecting these attacks with negligible impact on the experience of legitimate users has become very tricky nowadays and requires a lot more advanced knowledge and understanding of the Internet ecosystem. It’s no longer good enough to evaluate the attributes from the fingerprint individually. As defenders, we must combine them in a meaningful way, and see if the resulting combination matches a predefined norm. To illustrate the point, here are the sorts of more obvious anomalies that we look for:

- Some minor versions of browsers are specific to an operating system (say MacOS) and seeing that minor version coming from a Windows system is an anomaly.
- A MacIntel chip should never be associated with a Windows operating system
- A 1080P screen resolution for an iPhone is not possible.

But of course, most of the attacks Arkose Labs is dealing with go well beyond these more obvious signs a trained eye can recognize. We take advantage of machine learning algorithms to continuously observe and learn trends from the Internet ecosystem.

### The takeaway

Fraudsters have mastered the art of automation of fraud attacks and I’m always amazed by their creativity. So far, I still see bot operators sticking with scripted botnets, becoming a lot more subtle and accurate when crafting their requests, and continuously exploiting weaknesses of detection engines. But as detection engines improve, the attacker’s window of opportunity is slowly closing. Botnets have becomes increasingly advanced but I still haven’t seen significant adoption of headless browsers as they are more complex and costly to build and maintain. At Arkose Labs, we work hard to continously evolve our detection engine, anticipate the evolution of the attack vectors and make it increasingly difficult and cost-prohibitive for fraudsters to continue their attack.