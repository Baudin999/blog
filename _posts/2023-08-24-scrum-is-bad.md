---
layout: post
title: The failures of modern agile frameworks 
author: Carlos Kelkboom
date: 2023-08-24
published: true
tags: Programming Agile
---

> I do not pander, I do not soften words and I do not expect everyone to agree with this article.
  I don't even think everyone will *understand* this article. With that said, I want to preface
  my writing with a general explanation. I love software and I love quality. This article is more
  a love letter to engineering than a critique on Scrum. If you *do* want to read this as a critique,
  I will not hold it against you...

Ah, Scrum! A topic that, for many, begins as an exhilarating breath of fresh air but can often leave a 
bittersweet aftertaste. Reminiscent of how inheritance in object-oriented programming, with its initial 
allure of structure and reusability, often masks complexities and muddles readability, Scrum, too, has 
its own deceptions. As inheritance can compromise code clarity, Scrum runs the risk of 
overshadowing a fundamental truth: at its core, a project's success is anchored in the competence of its engineers.

let me give you an analogy: *Imagine a carpenter. This carpenter is really bad at his work. But, this 
carpenter sees a book on Scrum and he loves it! He makes small iterations, he hires someone to plan 
his work, he even hires someone who helps him face his bad products in a retrospective. All might seem good, 
until you look at the products themselves. His skills have not changed, his products are still bad.*

I know, after a rant about [inheritance](https://baudin999.github.io/blog/2023/08/24/inheritance-is-bad.html), I 
now have the gall to rant about [Scrum](https://www.agilealliance.org/glossary/scrum/). I promise you
that the only thing I am interested in, is simplicity. I like it when: *Good engineers are left to do
what they are good at!*

For me Scrum is the antithesis of that. Scrum prefers a process over the result and Scrum pretends to 
fit onto and into any software organization\*. Transitioning from the early 90s, when Jeff Sutherland and 
Ken Schwaber were influenced by Takeuchi and Nonaka's analogy of high-performing teams to a game of 
rugby, Scrum emerged as an answer to the limitations of traditional project management. Its structure 
promised agility, adaptability, and results. And for a time, it seemed to deliver just that.

Then commercial success kicked in, especially in the early 2000s. Courses, certifications, and consulting 
services sprouted up. Everyone wanted a piece of the Agile pie, of which Scrum was a major slice. Today? 
It's a multi-billion-dollar industry. And because of this, just like with most AAA games, greed overtakes
the lofty goals of what agile software development could have been.

This article is about what is wrong with our modern approach to software development, it is a series of observations
on Scrum and it's larger brother SAFe. It tells the story of why I hate these practices, from the Scrum
boards offered by Atlassian to the need to have a PO and Scrum Master in every team. I will break down
what is needed for a successful business and I will try to setup a simple framework which, in my humble
opinion, is much better than Scrum.

*\* If you feel offended by this remark, I invite you to plow thought the Scrum literature. There is not a
single remark on the impact of a good engineer on the resulting product. It is all about process. If you still 
do not believe me, read the quotes in the next chapter.*

## What is Scrum?

Let's give a general definition of Scrum. I do not want to invent them myself, so I will give four
definitions from great sources.

### Wikipedia

Scrum is an agile project management system commonly used in software development and other industries.

Scrum prescribes for teams to break work into goals to be completed within time-boxed iterations, called sprints. Each sprint is no longer than one month and commonly lasts two weeks. The scrum team assesses progress in time-boxed, stand-up meetings of up to 15 minutes, called daily scrums. At the end of the sprint, the team holds two further meetings: one sprint review to demonstrate the work for stakeholders and solicit feedback, and one internal sprint retrospective.

Scrum's approach to product development involves bringing decision-making authority to an operational level. Unlike a sequential approach to product development, scrum is an iterative and incremental framework for product development. Scrum allows for continuous feedback and flexibility, requiring teams to self-organize by encouraging physical co-location or close online collaboration, and mandating frequent communication among all team members. The flexible and semi-unplanned approach of scrum is based in part on the notion of requirements volatility, that stakeholders will change their requirements as the project evolves.

...

A scrum team is organized into at least three categories of individuals: the product owner, developers, and the scrum master. The product owner liaises with stakeholders to communicate tasks and expectations with developers. Developers in a scrum team are intended to be organizing work by themselves, with the facilitation of a scrum master. Scrum teams, ideally, should abide by the five values of scrum: commitment, courage, focus, openness, and respect.

[1 wikipedia](https://en.wikipedia.org/wiki/Scrum_(software_development))

### The agile alliance:

<b>What is Scrum?</b>
Scrum is a process framework used to manage product development and other knowledge work. Scrum is empirical in that it provides a means for teams to establish a hypothesis of how they think something works, try it out, reflect on the experience, and make the appropriate adjustments. That is, when the framework is used properly. Scrum is structured in a way that allows teams to incorporate practices from other frameworks where they make sense for the team’s context.

<b>When is Scrum Applicable?</b>
Scrum is best suited in the case where a cross-functional team is working in a product development setting where there is a nontrivial amount of work that lends itself to being split into more than one 2 – 4 week iteration.

[2 agile alliance](https://www.agilealliance.org/glossary/scrum/)

### scrumguides.org

Scrum is a lightweight framework that helps people, teams and organizations generate value through adaptive solutions for complex problems.

In a nutshell, Scrum requires a Scrum Master to foster an environment where:

1. Product Owner orders the work for a complex problem into a Product Backlog.
1. The Scrum Team turns a selection of the work into an Increment of value during a Sprint.
1. The Scrum Team and its stakeholders inspect the results and adjust for the next Sprint.
1. Repeat

Scrum is simple. Try it as is and determine if its philosophy, theory, and structure help to achieve goals and create value. The Scrum framework is purposefully incomplete, only defining the parts required to implement Scrum theory. Scrum is built upon by the collective intelligence of the people using it. Rather than provide people with detailed instructions, the rules of Scrum guide their relationships and interactions.

Various processes, techniques and methods can be employed within the framework. Scrum wraps around existing practices or renders them unnecessary. Scrum makes visible the relative efficacy of current management, environment, and work techniques, so that improvements can be made.

[3 scrumguides.org](https://scrumguides.org/scrum-guide.html)

### Chat GPT

Scrum is an iterative and incremental Agile framework primarily used for product development. It promotes collaboration, adaptability, and continuous improvement through structured cycles known as "sprints," typically lasting 2-4 weeks. Central to Scrum are self-organizing teams comprised of a Product Owner, Scrum Master, and Development Team members. Together, they work on a prioritized list called the Product Backlog, delivering potentially shippable increments at the end of each sprint. Through regular ceremonies like Daily Stand-ups, Sprint Planning, Sprint Review, and Sprint Retrospective, Scrum ensures transparency, inspection, and adaptation.

## What rubs me the wrong way?
There are a few things which tick me off when I read these definitions. I read things like:

* Scrum is simple
* Values: commitment, courage, focus, openness, and respect
* Self-organizing teams comprised of a Product Owner, Scrum Master, and Development Team members
* It promotes collaboration, adaptability, and continuous improvement 

These are just a few lines picked from the definitions. And what do I miss?

* Great engineers and engineering
* Trust the people working for/with you
* Simplicity over complexity

A great piece of software makes the customer and the developer happy. If I read these scrum articles
they almost have you believe that a process can compensate for everything. But it cannot. A bad dev
will ruin your project and no amount of process can save you. Just like the opposite is true, a good 
dev can be ruined by a process. For me, scrum is the embodiment of this philosophy. 

My philosophy is simple, it can be summed up in a single sentence:

> Hire great engineers you can trust and give them the freedom to make mistakes.

### The Commercialization of Scrum and Its Target Audience

Over the past two decades, there's been an explosion in the commercial offerings around Scrum: 
certifications, training sessions, coaching, tools, and more. This burgeoning industry,
inevitably shapes how Scrum is presented and to whom. MMartin Fowler has even termed this phenomenon 
the: *"Agile Industrial Complex"* [3]

One can't help but notice that much of the Scrum narrative, as peddled by the industry, seems 
tailored to suit non-technical stakeholders.[1] The focus on process, ceremonies, roles, and the 
predictability they promise appeals to managers, executives, and other decision-makers who may 
not be deeply entrenched in the nuances of software engineering.

Why this shift in focus? I can only speculate, but I think it is because it's the business side 
of organizations that often controls the purse strings. 
For a training company or Scrum consultant, it's far more lucrative to sell 
a course or service to an entire executive team or management layer than to a handful of 
developers. And when you're selling to this audience, emphasizing easily digestible processes, 
punctuated with amenable images[2], the semblance of control, and the promise of predictable 
outcomes might be more attractive than delving into the intricacies of software quality or 
engineering best practices.

This commercial motive doesn't necessarily mean that Scrum itself is flawed. But it does suggest 
that the way Scrum is often presented and packaged for consumption might be skewing priorities. 
Instead of emphasizing the critical importance of skilled engineers, technical excellence, and 
product quality, the narrative leans heavily on processes and roles. The result? Organizations 
might find themselves in a sticky situation when they have spent thousands if not millions of
dollars, only to find that the root of their problems were never the process itself.

*[1] As can be seen from the quotes off of the websites. There is not a single sentence or 
remark towards quality or skill.*


[2]

![scrum agile events](/blog/assets/img/Scrum_Agile_events.png)

If you are still not convinced, please watch these videos by Dave Thomas and Martin Fowler, co-creators of the Agile Manifesto:

<iframe width="560" height="315" src="https://www.youtube-nocookie.com/embed/a-BOSpxYJ9M?si=weBkzv0hSwdyY0Yz" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>

[3] Or Martin Fowler:

<iframe width="560" height="315" src="https://www.youtube-nocookie.com/embed/G_y2pNj0zZg?si=AM8xeorNd5PbXfCM" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>

## Can Scrum work for you?
The answer is, as always, "it depends". But it does not depend on anything you might hear advocates
of scrum tell you. It depends on how senior the developers you have in your organization are. If they
know what they are doing and they take the parts of the process which add benefit to their workflow 
and increase their effectiveness through that adoption, the answer is a resounding yes! But that has 
nothing to do with Scrum and everything to do with the quality of the engineering.

> A process should only make things which are good, better. A process can never be used to make
  something which fails, succeed.

If you are working in a larger organization and are working with scrum and you find the rituals and
processes comforting, you might think that I am looking at this in a biassed way. I am not. I am 
looking at this from the perspective of the software. In the definitions it is stated that Scrum 
helps an organization focus on the product. If that is so, they must mean Scrum as a product, because
nothing in their definition states how to get to a good software product. They say nothing about the
qualities of the engineers. They say nothing about the scope of a project or the trust the stakeholders
need to let a team "code in peace". Nothing in their description is conducive to a well coded end-product
which will stand the test of time, can be extended when needed and does not cover more features
than needed. 

## What is the solution?
I believe, complexity is the only enemy in a large project. Complexity can be found on any level and
is a literal problem for every person involved. For example:

* If you have multiple teams, management is facing complexity 
* If you create an over-engineered microservice architecture, your are running against complexity
* If you try to predict when the project will be done, you will face its complexity 

*Complexity* is the main problem. *That* is why we need to break problems into smaller chunks. *That* is why
sprints are sometimes a good idea. Customers do not know what they want before you start working with
the software. They think they do, but they don't. That is why you show them the product every week, that is 
how they see and feel what they asked for and can change what they had wrong.

When software becomes complex, the delivery slows down. It sometimes grinds to a halt. What do companies do?
They throw manpower against that problem. But what should they do? Reduce the teams to the minimal number 
of people to fix the bottlenecks in the delivery. Do not be afraid to re-write. Do not be afraid the 
make mistakes. Fail, learn, fix. A truly agile company, knows that we do not write code once. We write
it continuously! A company with a mission, a goal, knows that only great engineers working together and
learning from each other while the managers keep the wolves at bay, is the only way to succeed!

The solution to this problem is almost trivial, I will sum it up in a few lines:

1. Throw away every process handbook you have
1. Fire every engineer you do not trust (not skill, trust!)
1. Everyone involved with the process writes code
1. Every requirement or feature needs to have consensus of the team
1. For every new feature, delete a feature
1. If something works well, make it better
1. If something does not work, remove it

These are the rules to live by, these rules will increase your chances of success. You do not need a book,
you just need common sense.

I will try to explain the ideas behind the solution briefly. This is not a guide, these are just some things
you can put into practice which will help you make better software:

Every book written is either theoretical, or an account of experience. While the latter is fun to read, it
does not take into account the extraordinary person who achieved those feats. I advise you to focus on the 
employees who are trustworthy and who can inspire your organization. They will create the software and they
will bring about a better community. 

If you do not write code, you do not understand the complexity. I will give a bit of nuance. Everyone 
who is envolved with the project should work with or on the project. This can be, but are not limited to: 
documentation, quality assurance, code or data. A product needs to be good, find people who will make the 
product good, by loving the foundations of your product instead of the titles your organisation hands out.
If you work this way, only features which excite the entire team can go forward. We do not need more 
people mandating or speaking from authority. We need skilled people to be humble and enthusiastic.

We are really bad at cleaning up after ourselves. Especially in an ever evolving code base. We will need
to clean up. And by enforcing that we remove as well as add, we have a better chance to mitigate complexity.

The last two items are about your process. A process should help make something which works well, work better. 
I've already said that, but it bears repeating. Please remove every process which does not add benefit, which
hinders developers and which cost money. Focus on making your engineers even more effective!

## Conclusion

Scrum, the way it is marketed, the way it is sold, is horrible. Agile software development and Scrum as a methodology of
agile, is not. For the sake of this industry and the generations to come, who will need to work with the
code and the products we create today, let's not blindly step into a methodology like scrum or SAFe, but
let's be honest and talk about what really matters. It is not about the process, it's about the people
making the products.

To finish the analogy I started at the beginning: *The carpenter would have been better off, just hiring a 
good carpenter.*
