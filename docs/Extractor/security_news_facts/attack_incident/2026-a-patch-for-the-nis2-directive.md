# A patch for the NIS2 Directive

| 項目 | 內容 |
|------|------|
| **日期** | 2026-01-21 |
| **來源** | CERT.at (Austria) |
| **分類** | attack_incident |
| **嚴重程度** | 未評估 |
| **信心水準** | 中 |

## 摘要

On January 20th, 2026 the EU Commission presented a package of legislative proposals, including an update to the NIS2 directive.
In software terms, this would be a maintenance release. Fix some issue

## 事實內容

On January 20th, 2026 the EU Commission presented a package of legislative proposals, including an update to the NIS2 directive.
In software terms, this would be a maintenance release. Fix some issues that came up while trying to run the program (well, installing it in all 27 Member States certainly took longer that expected), adapt it to a changing environment while hopefully being a simple change.
Obvious bug-fixes are:

a minimum size for DNS server operators be relevant
don't make every large company with a bit of PV on the roof an entity in the electricity sector

Adaptions concern things like the inclusion of Providers of European Digital Identity Wallets and special reporting requirements for ransomware cases.
And what might change for us CSIRTs?
The commission proposes a change to the definition of the CSIRTs network:
The CSIRTs network shall be composed of representatives of the CSIRTs designated or established pursuant to Article 10, the computer emergency response team for the Union&rsquo;s institutions, bodies and agencies (CERT-EU) and ENISA.
ENISA also receives a fully new article Article 37a which describes ENISA&rsquo;s role in mutual assistance.
This should be read in conjuction with the newly proposed update to the Cybersecurity Act which defines the role of ENISA. This one is still on my reading list.
I'm ambivalent on this. Yes, ENISA is increasingly doing operational work, tracking incidents accross Europe and providing alerts and statistics. But they don't do incident response. They facilitate and coordinate. This might change, and yes, the CSA might contain a few easter eggs in that direction.
What is missing in the proposal?

As I have written in the German blog, Recital (44) in the NIS2 text originated from the EP's version going into the trilogue, but the corresponding articles didn't make it into the final directive. It should be struck by this update to clear up the confusion it caused.
Article 15(3)n references "regional and Union-Level Security Operations Centres (SOCs)". Back when this was written, we didn't really know what this is all about, but as far as I can see, this is a reference to the "national and cross-border SOCs" from early Cyber Solidarity Act drafts. In the final version, these are now called "national and cross-border cyber hubs", so I think that the update to the NIS2 text should harmonize the language. Adding a reference to the CSoA there wouldn't hurt, either.
Clear up the confusion regarding national cooperation forums. There is Article 11(4) which might be related to Article 19 and then there are the national cyber hubs from the CSoA. Are these separate things? Do they overlap? See also here.
And then there is the evergreen of the CNW definition with "representatives of CSIRTs" and the use of the term "national CSIRT". I'll just link to my previous rant on these points.

This is a quick reaction to the proposal from the Commission. I might write a more detailed review in the future.
&nbsp;
&nbsp;
&nbsp;

## 來源連結

- [A patch for the NIS2 Directive](https://www.cert.at/en/blog/2026/1/a-patch-for-the-nis2-directive)

---
> 萃取時間：2026-02-11 11:09 UTC
> 資料來源：CERT.at (Austria) (cert-at)
