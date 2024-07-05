# (8) Dr Milan Milanović no X: "𝗙𝗮𝗰𝗲𝗯𝗼𝗼𝗸 𝗰𝗿𝗲𝗮𝘁𝗲𝗱 𝗮 𝘁𝗼𝗼𝗹 𝘄𝗵𝗶𝗰𝗵 𝗱𝗲𝘁𝗲𝗰𝘁 𝗮𝗻𝗱 𝗿𝗲𝗽𝗮𝗶𝗿 𝗯𝘂𝗴𝘀 𝗮𝘂𝘁𝗼𝗺𝗮𝘁𝗶𝗰𝗮𝗹𝗹𝘆 A recent document by Facebook engineers explains how they wrote a tool that can automatically fix bugs. In the paper, they introduced 𝗦𝗔𝗣𝗙𝗜𝗫, an https://t.co/77KaEOaMgu" / X

Created: June 29, 2024 5:46 PM
URL: https://twitter.com/milan_milanovic/status/1805928554116395373

[https://twitter.com/milan_milanovic/status/1805928554116395373](https://twitter.com/milan_milanovic/status/1805928554116395373)

𝗙𝗮𝗰𝗲𝗯𝗼𝗼𝗸 𝗰𝗿𝗲𝗮𝘁𝗲𝗱 𝗮 𝘁𝗼𝗼𝗹 𝘄𝗵𝗶𝗰𝗵 𝗱𝗲𝘁𝗲𝗰𝘁 𝗮𝗻𝗱 𝗿𝗲𝗽𝗮𝗶𝗿 𝗯𝘂𝗴𝘀 𝗮𝘂𝘁𝗼𝗺𝗮𝘁𝗶𝗰𝗮𝗹𝗹𝘆

A recent document by Facebook engineers explains how they wrote a tool that can automatically fix bugs. In the paper, they introduced 𝗦𝗔𝗣𝗙𝗜𝗫, an automated tool designed to detect and repair bugs in software. The tool has suggested fixes for six essential Android apps in the Facebook App Family: Facebook, Messenger, Instagram, FBLite, Workplace, and Workchat.

How Does It Work?

𝗦𝘁𝗲𝗽 𝟭: Detect a Crash - Another tool, 𝗦𝗮𝗽𝗶𝗲𝗻𝘇, finds app crashes. When Sapienz identifies a crash, it is logged into a database.

𝗦𝘁𝗲𝗽 𝟮: Identify the Problem—SAPFIX pinpoints the exact line of code causing the issue. It first checks if the crash is reproducible. If it's not, the crash is discarded. It uses a technique called "spectrum-based fault localization" to identify the most likely lines of code responsible for the crash.

𝗦𝘁𝗲𝗽 𝟯: Suggest a Fix - Using predefined templates or code mutations, SAPFIX proposes a solution. After identifying the fault location, SAPFIX attempts to generate a patch. It employs two strategies:

![https://abs-0.twimg.com/emoji/v2/svg/1f539.svg](https://abs-0.twimg.com/emoji/v2/svg/1f539.svg)

𝗧𝗲𝗺𝗽𝗹𝗮𝘁𝗲-𝗯𝗮𝘀𝗲𝗱 𝗙𝗶𝘅𝗶𝗻𝗴: SAPFIX uses predefined templates to suggest fixes for common bugs. These templates are designed based on standard developer practices.

![https://abs-0.twimg.com/emoji/v2/svg/1f539.svg](https://abs-0.twimg.com/emoji/v2/svg/1f539.svg)

𝗠𝘂𝘁𝗮𝘁𝗶𝗼𝗻-𝗯𝗮𝘀𝗲𝗱 𝗙𝗶𝘅𝗶𝗻𝗴: SAPFIX resorts to a mutation-based system if the template-based approach fails. It systematically applies a series of code mutations to the fault location to generate potential fixes.

𝗦𝘁𝗲𝗽 𝟰: Test the Fix—The proposed solution is tested to ensure its validity. It uses the test cases from 𝗦𝗮𝗽𝗶𝗲𝗻𝘇 to check the patch's validity. If the patch passes all tests, it's considered a good fix. After patch validation, SAPFIX uses 𝗜𝗻𝗳𝗲𝗿 (a static analysis tool) to analyze the proposed fix further. Infer checks if the patch introduces any new potential issues.

𝗦𝘁𝗲𝗽 𝟱: Review - Developers get the final say, reviewing and approving the fix.

Check the entire document in the comments.

Image credits: Facebook.

[#technology](https://twitter.com/hashtag/technology?src=hashtag_click)

[#softwareengineering](https://twitter.com/hashtag/softwareengineering?src=hashtag_click)

[#programming](https://twitter.com/hashtag/programming?src=hashtag_click)

[#techworldwithmilan](https://twitter.com/hashtag/techworldwithmilan?src=hashtag_click)

[#coding](https://twitter.com/hashtag/coding?src=hashtag_click)

![Untitled](segurançaInformatica/My%20links%20-%20Per%20eada1afd472341d187422e9fe4e7555e/Dr%20Milan%20Milanović%20no%20X%20𝗙𝗮𝗰𝗲𝗯𝗼𝗼𝗸%20𝗰𝗿𝗲𝗮𝘁𝗲𝗱%20𝗮%20𝘁𝗼%209a3b0162e8dd411aa174a44678c49bdd/Untitled.png)