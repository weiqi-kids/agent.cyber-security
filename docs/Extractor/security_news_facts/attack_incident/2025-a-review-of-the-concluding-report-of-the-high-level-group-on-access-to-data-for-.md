# A review of the “Concluding report of the High-Level Group on access to data for effective law enforcement”

| 項目 | 內容 |
|------|------|
| **日期** | 2025-10-16 |
| **來源** | CERT.at (Austria) |
| **分類** | attack_incident |
| **嚴重程度** | 高 |
| **信心水準** | 中 |

## 摘要

As I&rsquo;ve written here, the EU unveiled a roadmap for addressing the encryption woes of law enforcement agencies in June 2025. As a preparation for this push, a &ldquo;High-Level Group on access t

## 事實內容

As I&rsquo;ve written here, the EU unveiled a roadmap for addressing the encryption woes of law enforcement agencies in June 2025. As a preparation for this push, a &ldquo;High-Level Group on access to data for effective law enforcement&rdquo; has summarized the problems for law enforcement and developed a list of recommendations.
(Side note: The EU Chat Control proposal is making headlines these days, the HLG report is dealing with a larger topic. I will not comment on the CSAM issues here at all.)
I&rsquo;ve read this this report and its conclusions, and it is certainly a well-argued document, but strictly from a law enforcement perspective. Some points are pretty un-controversial (shared training and tooling), others are pretty spicy. In a lot of cases, it hedges by using language similar to the one used by the Commission:
In 2026, the Commission will present a Technology Roadmap on encryption to identify and evaluate solutions that enable lawful access to encrypted data by law enforcement, while safeguarding cybersecurity and fundamental rights. 
They are not presenting concrete solutions; they are hoping that there is a magic bullet which will fulfill all the requirements. Let&rsquo;s see what this expert group will come up with.
But first, let&rsquo;s have a look at the report from the HLG. This is not a full review but highlights the points I find interesting, with a likely bias in the direction of where I disagree.
Chapter I: Digital forensics
Page 8:
Criminals constantly adapt their behaviours to elude detection. Available statistics indicate that criminals are increasingly moving to legitimate end-to-end encrypted platforms. However, once effective countermeasures are found, it is likely that they will move again to different communication channels.
This is a two-edged sword: if criminals use their own dedicated infrastructure, they are making these a perfect target for LE actions (or subterfuge), Ghost,&nbsp;EncroChat and AN0M are examples for this. If the criminals hide between millions of law-abiding users in popular apps, then any LE action will potentially impact them as well. Any meaningful cooperation by the operators will just drive the criminals again into niche or self-hosted solutions &ndash; opening another window for targeted operations. So perhaps having LE access in big platforms will just mean that the big fishes will move to other ponds, leaving only the small fry in the reach of LE nets.
But the main takeaway is the following: Whatever Law Writers and Law Enforcement do; the other side can react. We thus need to plan and strategize not just for the here and now but also think about countermoves and unintended consequences.
Page 9:
Access to digital evidence is considered to play a key role in 85 % of investigations.
Has the resource allocation within LE moved in parallel with the shift of crime to the online space?
While lawful access to data for law enforcement purposes is at the core of providing our citizens with the highest possible level of security, this must not be at the expense of fundamental rights or the cybersecurity of systems and products.
I&rsquo;m really glad that this report acknowledges these two counterbalancing requirements. While I have a strong personal opinion on the fundamental rights aspect, the effect on the cybersecurity of systems and products is of professional interest to me. This blogpost will thus focus on the cybersecurity impact, not the human rights one.
Page 10:
Strong accountability is crucial. In our democratic societies, it is the responsibility of lawmakers to establish the conditions for such accountability, ensuring a high level of privacy and security.
That is the theory. In practice we all know that accountability for LE overreach in practice is, let&rsquo;s say it that way, spotty. The report from the European Parliament&nbsp;documents the abuse of LE powers, but news of real accountability for those transgressions have been scarce.
Call me jaded, but the only way that LE can convince the population that &ldquo;yes, this time, for these new power, we well strictly follow the law and have accountability if abuses happen&rdquo; are not empty promises is to effectively police themselves regarding past abuses.
Page 10:
Cybersecurity of products and services and lawful access to data both stem from legal obligations and must be able to coexist.
This is the challenge in a nutshell. None of the proposals I have seen managed to thread that needle. I specifically asked exactly this question at the EC3 during my latest visit, and the answers all came down to

We need it, there must be a way
Just be more creative and think outside the box
I once talked to someone who claimed to have a solution

The Recommendation Cluster 1 is fine.
Page 20, Recommendation Cluster 2:
2. setting up a process dedicated to the exchange of capacities that potentially involve the use of vulnerabilities, which would allow knowledge and resources to be pooled while ensuring that the confidentiality and sensitivity of the information would be respected. 
3. possibly exploring a European approach to the management and disclosure of vulnerabilities handled by law enforcement, based on existing good practices.
Existing good practices are called &ldquo;CVD &ndash; coordinated vulnerability disclosure&rdquo;, and the aim is to get vulnerabilities fixed as comprehensively and quickly as possible. This is what NIS2 requires CERTs to do. This is what the CRA demands that suppliers do.
The idea that we keep vulnerabilities open for our own use is completely anathema to the thinking and the mission of the cybersecurity community.
Page 21:
Though it is still sometimes key to investigations, the exploitation of vulnerabilities must be handled with extreme care, in compliance with the relevant domestic legal framework, as it impinges on the security posture of hardware and software.
No shit, Sherlock!
We really need to differentiate here. Exploiting an operations error or programming mistake on the side of the criminals is fine. If they don&rsquo;t secure their Ransomware management infrastructure, then by all means, let LE break in and do their investigations. But if the vulnerability is in a generic software product that is being used by millions of citizens, then things change dramatically. I do not think that even &ldquo;extreme care&rdquo; can overcome the downsides here.
The HLG experts invite the European Commission&rsquo;s JRC to explore the feasibility of setting out a European approach for the management and disclosure of vulnerabilities, handled by law enforcement, based on existing good practices
This clashes with the CRA and NIS2 regulations, as well as national CVD policies.
The Recommendation Cluster 3 is fine.
Page 23, Recommendation Cluster 4:
1. developing a platform (SIRIUS or equivalent) for sharing tools, best practices and knowledge on how to be granted access to data by product owners, producers and hardware manufacturers. 
4. establishing a research group to assess the technical feasibility of built-in lawful access obligations (including for accessing encrypted data) for digital devices, while maintaining and without compromising the security of devices and the privacy of information for all users, as well as without weakening or undermining communications security.
&ldquo;Owners&rdquo; is fine &ndash; if they want to give access to LE to their own devices, so be it. But secure and targeted LE access in products is a chimera.
For me, the important distinction between a product and a service is the following:
A product is built by the manufacturer and then delivered in (mostly) the same state to multiple customers. In many cases, old-school shrink-wrapped software, the supplier doesn&rsquo;t even know who the customer is. And once the product has been shipped, the influence of the vendor on the operation of the product is very limited. This can be best explained by Open-Source products: If I install Debian Linux on my Laptop, use LUKS to do full-disk encryption and give LE a reason to do full forensics on that machine without my cooperation: what can LE do? They could go and ask Debian and the answer will be: &ldquo;Otmar probably (we don&rsquo;t know for sure; we don&rsquo;t keep track who uses our product) runs LUKS with the default encryption settings, we don&rsquo;t know any way to bypass that encryption. If we knew a way, then millions of other users would be in danger, thus we would have fixed the defect as soon as we learned of it.&rdquo; There is no way to implement real security in a product (without some sort of key-escrow service) while still give LE access.
A service is different thing: here the vendor is directly involved in handling the data of its customers, there is at least a change to special-case this single customer once a court-order arrives at the door.
Service vs. product is not strictly binary, though. Products need updates, giving vendors a chance to influence what&rsquo;s running at a specific customer. WhatsApp and other such OTT services combing a Product (the App) with a Service (the cloud-component).
For example, in the case of video surveillance recordings, LEAs are increasingly faced with encrypted files that cannot be analysed by automatic software, especially when large quantities of video are involved.
That's an easy one, and not only for LEAs, as citizens run into the same issue with e.g. TV time-shifting disks attached to TVs. It should be possible for the owners of a device to have unencumbered access to content they own, or where there is a legal right to access it.
In parallel, more transparent solutions enabling access to data in clear on seized devices should be considered, to increase the effectiveness of investigations and, at the same time, ensure a level playing field among industry players, while preserving cybersecurity and safeguarding privacy.
No. This will not work. See the argument about the security of products from above.
A key action under this technology roadmap would be to assess the technical feasibility of built-in lawful access obligations (including for accessing encrypted data and encrypted CCTV recordings) for digital files and devices, while ensuring strong cybersecurity safeguards and without weakening or undermining communications security. This assessment would be carried out involving all relevant stakeholders.
I give you the CCTV case (give the owners the possibility to do bulk export in clear data), but for the rest, I just don&rsquo;t see a solution that still &ldquo;ensures strong cybersecurity safeguards and does not weaken or undermine communications security&rdquo;.
Chapter II: Data retention
The majority of points raised here are sensible.
Page 34, Recommendation Cluster 6:
ensuring that Member States can enforce sanctions against electronic and other communications services providers which do not cooperate with regard to the retention and provision of data, e.g. through the implementation of administrative sanctions or limits on their capacity to operate in the EU market.
Given how miserably the EU fails to enforce EU law with respect to big US companies, I&rsquo;m not optimistic that this will work. See also online gambling and similar &ldquo;services&rdquo; which might be popular, but of unclear legality.
Chapter III: Lawful interception
Page 39:
In contrast, the UK, under the Investigatory Powers Act, has set up a framework for lawful interception of OTT communications which, thanks to the adoption of the UK-US data access agreement, also applies to OTT services based in the US. According to relevant UK authorities, this makes a significant difference in crime prevention and investigations.
Citation needed.
Page 40:
In landmark case C-670/22, the CJEU embraced a broad concept of &lsquo;interception of telecommunications&rsquo;, holding that the infiltration of terminal devices for the purpose of gathering traffic, location and communication data from an internet-based communication service constituted an &lsquo;interception of telecommunications&rsquo;.
I wasn&rsquo;t aware of that case, I should probably read the judgment.
Page 41:
However, the increasing complexity of communication infrastructures and protocols in 5G, such as virtualisation, network slicing, edge computing and privacy-enhanced features, poses new technological challenges for traditional operators. The HLG experts insisted notably on challenges pertaining to Home Routing and to Rich Communication Services (RCS).
The authors are right that the changes in technology have a clear impact on which options are even there for lawful interception. The &ldquo;Europol position paper on Home routing&rdquo; also sounds interesting.&nbsp;
Page 41/42:
Finally, the HLG experts highlighted that one of the main technical challenges posed to LEAs comes from end-to-end encryption, notably for OTT communications, with more than 80 % of communications being run through end-to-end encrypted services (live communications and back-up storage), thus preventing investigators from accessing communication content. At the same time, the experts also agree that end-to-end encryption is considered a robust security measure which effectively protects citizens from various forms of crime. By ensuring that only the communicating users can access the content of their messages, end-to-end encryption effectively protects against unlawful eavesdropping, data theft, state-sponsored espionage and other forms of unauthorised access by hackers, cybercriminals, or even the service providers themselves.
This is the crux of the matter in a nutshell.
There is a legitimate need to protect communication from eavesdropping, and the possible adversaries range from the operators themselves up to state-sponsored espionage. And despite this, when law enforcement comes in waving a magic paper signed by a judge, then all those technical defences need to stand aside and enable &ldquo;lawful interception&rdquo;. Like Moses parting the sea, the Light of Galadriel causing orcs to flee, holy water repelling vampires, or any other magic device from the realm of human fantasy that can save a tricky situation.
How exactly this magic can be worked, this paper does not reveal.
Page 42:
Law enforcement representatives would prefer an approach that requires companies to provide law enforcement with access to data in clear under strict conditions. It should be noted, however, that cybersecurity experts raised concerns that such solutions would undermine cybersecurity.
Three points here:
This is thinking in &ldquo;services&rdquo;, not in &ldquo;products&rdquo;. Signal, the cloud service, does not deal in messages at all, it provides authentication and a publish-subscribe message bus for generic communication. It&rsquo;s only the &ldquo;product&rdquo;, the Signal App, that turns all this into a messaging platform. The &ldquo;company&rdquo; has as much knowledge of the cleartext communication as Canon knows about the images the cameras take that it sold to customers.
That&rsquo;s why the &ldquo;undermine cybersecurity&rdquo; point come in: in order to be able to give LE any leg up in accessing the cleartext, the company has to undermine the security properties of end-to-end encrypted communication. If, for example, Signal were able to give LE enough information that LE can decrypt communication data received via a wiretap, then Signal itself would be able to decrypt the messages, as they are relayed via Signal&rsquo;s servers. This clearly contradicts the quote from above: &ldquo;By ensuring that only the communicating users can access the content of their messages, end-to-end encryption effectively protects against unlawful eavesdropping, data theft, state-sponsored espionage and other forms of unauthorised access by hackers, cybercriminals, or even the service providers themselves.&rdquo;
Once you open a door for LEAs, then other players (including LEAs from non-democratic countries) will also come knocking. And in a number of countries, those players (services, state security, military) operate under a completely different legal regime. For example, from Wikipedia: &ldquo;A national security letter (NSL) is an administrative subpoena issued by the United States government to gather information for national security purposes. NSLs do not require prior approval from a judge.&rdquo; These agencies might be constrained regarding their own citizens, but for foreigners there is usually very little oversight. Holding LEA to a hight legal standard is thus not enough. Any solution that enables LEA access must somehow be able to deny the same access to organisation with a bigger bludgeon to enforce compliance.
Page 44:
As a result, the HLG experts consider it a priority to ensure that obligations on lawful interception of available data apply in the same way to traditional and non-traditional communication providers and are equally enforceable. The harmonisation of such obligations should serve to overcome the challenges related to the execution of cross-border requests.
From the LEA side, this is an understandable objective. It misses an important point, though: &ldquo;traditional&rdquo; and &ldquo;non-traditional communication providers&rdquo; are so fundamentally different, that transferring approaches from one side to the other just doesn&rsquo;t work. It starts with territoriality/jurisdiction, touches the services vs. product mismatch and end with the old difference between the old telco networks and the Internet: Are services provided by the network or by the end-points. If you look at the design of Signal and others, all the security properties are in the client, not the server.
Thus, the approach that worked for the old network just doesn&rsquo;t fit the new one.
The HLG report is not giving any guidance how to get there.
Second, it is necessary to reach an agreement on high-level operational requirements that clearly states what is expected by national authorities in terms of lawful interception and what the associated safeguards should be. LEON has been identified as a good basis for defining law enforcement requirements. This document should be accompanied by requirements on e.g. proportionality, oversight and transparency, possibly distinguishing between the rules applicable to content and non-content data, with full respect for cybersecurity and data protection and privacy and without undermining encryption.
This is an important point here, and I really think we need to hammer this down.
We first need to agree on a set of requirements for the &ldquo;lawful interception without weakening cyber security &amp; fundamental right&rdquo; solution. This document is a great summary of what the LEA side wants; we need a similar document that describes the requirements on the cyber security side of the equation.
Or in other words, we need to checklist according to which we can score any proposed solution X. Some ideas:

Does X restrict what software citizens can install on their devices?
Does X undermine the goal of having people trust automatic updates of software?
Does X lead to more people rooting their phones and side-loading applications?
Does X respect mobile users that travel between jurisdictions?
Does X also work for Open Source software?
Does X need to be undetectable by the user under surveillance?
Does X undermine the security of non-targeted users?
What is the abuse potential for X and which guardrails are in place?

We should agree on such a list of requirements before we embark on the quest to find a solution.
Third, the concept of territorial jurisdiction needs to be clarified in terms of its applicability to OTT services, taking into account the divergent interpretations among national authorities and, most importantly, between national authorities and OTT providers.
This is also an interesting point: Jurisdiction. In contrast to an old-fashioned land-line telephone, mobile phone using an OTT communication service are, well, mobile. They can travel. They can leave the current jurisdiction. So what happens if LEA in country Y gets a warrant and support from the OTT service to do wiretapping, and now the suspect travels to country Z. Does the wiretap need to stop? What happens if spyware was used on the suspects phone? Can LEA from Y legally wiretap the communication of a suspect in a different jurisdiction?
The points 3,4 and 5 from the Recommendation Cluster 7 capture these questions.
Number 4 is crucial: &ldquo;[&hellip;] no measure should entail an obligation for providers to adjust their ICT systems in a way that would negatively impact the cybersecurity of their users&rdquo;.
At a recent conference I heard a presentation about the Australian law for LEA access to communication content. They do these things in three levels: Asking nicely for help (TAR), force operators to help (TAN) and order that capabilities need to be implemented (TCN). The latter has a strong restriction: &ldquo;Importantly, a TCN is expressly prohibited from requiring the building of a capability to decrypt information or remove electronic protection.&rdquo;
In other words, Australia can demand from communication providers that they build the infrastructure to enable wiretapping, but they can not be forced to lower the inherent security of communication protocols.
Page 46:
Step 2: [&hellip;] In addition, the HLG experts stressed the urgent need to improve the efficiency of cross-border lawful interception requests under the current framework, while carrying out the work outlined above.
Indeed. The current time-penalty LE is paying for any cross-border interaction is just not sustainable.
Page 47, Recommendation Cluster 8:
To ensure that a broad range of providers of ECS, including OTT providers, respond to lawful interception requests as set out in national laws
This is getting tricky. We have seen this play out in other areas, e.g. access to online betting services, pharmacies or other services that are deemed non-compliant in one country. We always deride non-EU countries that block access to Wikipedia, independent media, social media and other &ldquo;undesirable&rdquo; content. What usually follows is an uptick of the use of VPNs and other means of working around blocks. And to be honest, why should an OTT service from south-east Asia care about Austrian law and the wishes of our LEAs? Where do we end here? Try to block these services on the DNS or network layer? Make it illegal to use them? As the report puts it:
HLG experts agreed that any initiative to foster or impose lawful interception rules on all type of ECS should come with a clear and enforceable framework for taking action against communication providers that operate illegally and/or refuse any form of cooperation with law enforcement.
The authors almost get it
Furthermore, the differences between lawful interception rules across the EU place burdensome requirements upon regulated entities such as OTT providers, potentially creating market access barriers for communication providers.
but miss the elephant in the room: It&rsquo;s not about differences in legislation between EU member states, this is a global competition. I don&rsquo;t worry about a company moving from Germany to Spain, I worry about all those OTT services moving to offshore locations. See Proton&rsquo;s move away from Switzerland for an example.
Page 48, Recommendation Cluster 9:
Based on further analysis and an impact assessment, the experts recommend devising an EU instrument on lawful interception (consisting of soft-law or binding legal instruments) for law enforcement purposes that would establish enforceable obligations for providers of ECS in the EU.
I&rsquo;m a mathematician by training. We often get derided for this, but here is fits perfectly: Before trying to find a solution to a problem, it might be worthwhile to first consider the question if a solution does exist in the first place. So yes: first do the &ldquo;further analysis and an impact assessment&rdquo;, and if &ndash; and only if &ndash; we can find a technical solution satisfying the requirements, then we can start to write laws.
This is what is starting to happen in the EU right now: Experts have been invited to think about this challenge and let&rsquo;s see what they will come up with.
It certainly is not an easy assignment.

## 來源連結

- [A review of the “Concluding report of the High-Level Group on access to data for effective law enforcement”](https://www.cert.at/en/blog/2025/10/hlg-paper-review)

---
> 萃取時間：2026-02-11 11:09 UTC
> 資料來源：CERT.at (Austria) (cert-at)
